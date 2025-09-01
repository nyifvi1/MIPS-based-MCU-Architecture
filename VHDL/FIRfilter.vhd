LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------
ENTITY FIRfilter IS
  GENERIC (DATA_BUS_WIDTH : integer := 32); 
  PORT(rst_i : in std_logic;         --rst is KEY0
	   MCLK_i : in std_logic;        --FIFO clk(same as CORE)
	   FIRCLK_i : in std_logic;        --FIFO clk(same as CORE)
	   MemWrite_ctrl_i 	   :in 	STD_LOGIC;
	   MemRead_ctrl_i      :in 	STD_LOGIC;
	   DataBus_io   : inout std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	   AddrBus_i   : in std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	   FIFOEMPTY_o : out std_logic;
	   FIROUT_o : out std_logic
		); 
END FIRfilter;
-----------------------------------------------
ARCHITECTURE FIRfilter OF FIRfilter IS
 
signal CS : std_logic_vector(4 downto 0);
signal Addr11_6to0_w : std_logic_vector(7 downto 0);

signal FIRCTL_Reg_Q,FIRCTL_Reg_Q_aux : std_logic_vector(7 downto 0);
signal FIRCTL_Reg_D,FIRCTL_Reg_Q_ext : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal FIRCTL_BidirPin_EN : std_logic;

signal FIRIN_BidirPin_EN : std_logic;
signal FIRIN_Reg_D  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal FIRIN_Reg_Q : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	
signal FIROUT_TriState_EN : std_logic;
signal FIROUT_Reg_Q : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);	

signal COEF3_0_BidirPin_EN : std_logic;
signal COEF3_0_Reg_D  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal COEF3_0_Reg_Q : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);	

signal COEF7_4_BidirPin_EN : std_logic;
signal COEF7_4_Reg_D  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal COEF7_4_Reg_Q : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);	

type fifo_array is array (0 to 7) of std_logic_vector(23 downto 0);
signal FIFO_Inst : fifo_array;
signal wr_ptr   : std_logic_vector(2 downto 0);
signal rd_ptr   : std_logic_vector(2 downto 0);
signal count    : std_logic_vector(3 downto 0); 
signal data_out_reg,x_n,x_n_minus1,x_n_minus2,x_n_minus3,x_n_minus4,x_n_minus5,x_n_minus6,x_n_minus7 : std_logic_vector(23 downto 0);
signal FIFOEMPTY_D,FIFOFULL_D : std_logic;

signal toggle_A,sync_ff1,sync_ff2,sync_ff3     : std_logic;  
signal FIFOREN      : std_logic;  

signal y_n,x_n_mult,x_n_minus1_mult,x_n_minus2_mult,x_n_minus3_mult,x_n_minus4_mult,x_n_minus5_mult,x_n_minus6_mult,x_n_minus7_mult : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal flag,event_latch,FIFOFULL_FUTURE_D : std_logic;
begin  
-----------------------Chip Select interface---------------------------------------
Addr11_6to0_w <= AddrBus_i(11)&AddrBus_i(6 downto 0);

with Addr11_6to0_w select 
	CS <= "00001" WHEN "10101100",--0x82C (FIRCTL)
		  "00010" WHEN "10110000",--0x830 (FIRIN)
		  "00100" WHEN "10110100",--0x834 (FIROUT)
		  "01000" WHEN "10111000",--0x838 (COEF3_0)
		  "10000" WHEN "10111100",--0x83C (COEF7_4)
		  "00000" WHEN OTHERS;
-----------------------FIRCTL Register---------------------------------------
FIRCTL_Reg : process(rst_i,MCLK_i)      
			begin
				if(rst_i = '1') then
					FIRCTL_Reg_Q_aux <= (others => '0');
				elsif(rising_edge(MCLK_i)) then
					FIRCTL_Reg_Q_aux(3 downto 2) <= FIFOFULL_FUTURE_D&FIFOEMPTY_D;
					if (CS(0)='1' and MemWrite_ctrl_i='1') then
						FIRCTL_Reg_Q_aux <= "00"&FIRCTL_Reg_D(5 downto 4)&FIFOFULL_FUTURE_D&FIFOEMPTY_D&FIRCTL_Reg_D(1 downto 0);
					end if;
				end if;
			end process;
			
	
FIRCTL_Reg_Q <= FIRCTL_Reg_Q_aux when MCLK_i='1' else FIRCTL_Reg_Q_aux(7 downto 6)&'0'&FIRCTL_Reg_Q_aux(4 downto 0);					
			
			
FIRCTL_BidirPin_EN <= CS(0) and MemRead_ctrl_i;		  
	
FIRCTL_BidirPin : BidirPin
	PORT MAP (Dout  => FIRCTL_Reg_Q_ext,  	
			  en    => FIRCTL_BidirPin_EN,		
		      Din   => FIRCTL_Reg_D,
		      IOpin => DataBus_io		
			);	
			
FIRCTL_Reg_Q_ext		<= X"000000"&FIRCTL_Reg_Q;
-----------------------FIRIN Register---------------------------------------
FIRIN_Reg : process(rst_i,MCLK_i)      
			begin
				if(rst_i = '1') then
					FIRIN_Reg_Q <= (others => '0');
				elsif(rising_edge(MCLK_i)) then
					if (CS(1)='1' and MemWrite_ctrl_i='1') then
						FIRIN_Reg_Q <= FIRIN_Reg_D;
					end if;
				end if;
			end process;
			
FIRIN_BidirPin_EN <= CS(1) and MemRead_ctrl_i;		  
	
FIRIN_BidirPin : BidirPin
	PORT MAP (Dout  => FIRIN_Reg_Q,  	
			  en    => FIRIN_BidirPin_EN,		
		      Din   => FIRIN_Reg_D,
		      IOpin => DataBus_io		
			);	
-----------------------FIROUT Register---------------------------------------
FIROUT_Reg : process(rst_i,FIRCLK_i)      
			begin
				if(rst_i = '1') then
					FIROUT_Reg_Q <= (others => '0');
				elsif(rising_edge(FIRCLK_i)) then
						if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
						FIROUT_Reg_Q <= X"00"&y_n(31 downto 8);
						end if;
				end if;
			end process;
			
FIROUT_TriState_EN <= CS(2) and MemRead_ctrl_i;		  
	
FIROUT_TriState : TriState
	PORT MAP (Dout  => FIROUT_Reg_Q,  	
			  en    => FIROUT_TriState_EN,		
		      IOpin => DataBus_io		
			);				

-----------------------COEF3_0 Register---------------------------------------
COEF3_0_Reg : process(rst_i,MCLK_i)      
			begin
				if(rst_i = '1') then
					COEF3_0_Reg_Q <= (others => '0');
				elsif(rising_edge(MCLK_i)) then
					if (CS(3)='1' and MemWrite_ctrl_i='1') then
						COEF3_0_Reg_Q <= COEF3_0_Reg_D;
					end if;
				end if;
			end process;
			
COEF3_0_BidirPin_EN <= CS(3) and MemRead_ctrl_i;		  
	
COEF3_0_BidirPin : BidirPin
	PORT MAP (Dout  => COEF3_0_Reg_Q,  	
			  en    => COEF3_0_BidirPin_EN,		
		      Din   => COEF3_0_Reg_D,
		      IOpin => DataBus_io		
			);				

-----------------------COEF7_4 Register---------------------------------------
COEF7_4_Reg : process(rst_i,MCLK_i)      
			begin
				if(rst_i = '1') then
					COEF7_4_Reg_Q <= (others => '0');
				elsif(rising_edge(MCLK_i)) then
					if (CS(4)='1' and MemWrite_ctrl_i='1') then
						COEF7_4_Reg_Q <= COEF7_4_Reg_D;
					end if;
				end if;
			end process;
			
COEF7_4_BidirPin_EN <= CS(4) and MemRead_ctrl_i;		  
	
COEF7_4_BidirPin : BidirPin
	PORT MAP (Dout  => COEF7_4_Reg_Q,  	
			  en    => COEF7_4_BidirPin_EN,		
		      Din   => COEF7_4_Reg_D,
		      IOpin => DataBus_io		
			);						

-----------------------FIFO Implementation---------------------------------------
  process(MCLK_i,rst_i)
  begin
	if (rst_i='1') then
        wr_ptr <= (others => '0');
        rd_ptr <= (others => '0');
        count  <= (others => '0');
        data_out_reg <= (others => '0');	
    elsif rising_edge(MCLK_i) then
      if FIRCTL_Reg_Q(4)= '1' then       --FIRCTL_Reg_Q(4) = FIFORST
        wr_ptr <= (others => '0');
        rd_ptr <= (others => '0');
        count  <= (others => '0');
        data_out_reg <= (others => '0');
      else
        -- Write
        if CS(0)='1' and MemWrite_ctrl_i='1' and FIRCTL_Reg_D(5) = '1' and FIFOFULL_D = '0' then  -- FIRCTL_Reg_D(5) = FIFOWEN
          FIFO_Inst(CONV_INTEGER(wr_ptr)) <= FIRIN_Reg_Q(23 downto 0);
          wr_ptr <= wr_ptr + 1;
          count  <= count + 1;
        end if;

        -- Read
        if FIFOREN = '1' and FIFOEMPTY_D = '0' then         
          data_out_reg <= FIFO_Inst(CONV_INTEGER(rd_ptr));
          rd_ptr <= rd_ptr + 1;
          count  <= count - 1;
		elsif FIFOREN = '1' and FIFOEMPTY_D = '1' then
		  data_out_reg <= (others => '0');
        end if;
      end if;
    end if;
  end process;

  x_n <= data_out_reg;
  FIFOEMPTY_D <= '1' when count = 0 else '0';
  FIFOFULL_D  <= '1' when count = 8 else '0';
  
  --1 if counter is 7 and data is written to FIFO
  FIFOFULL_FUTURE_D <= '1' when count = 7 and CS(0)='1' and MemWrite_ctrl_i='1' and FIRCTL_Reg_D(5) = '1' and FIFOFULL_D = '0' else '0';
-------------------FIFOREN Implementation--------------------------------------------------------------------------------------
process(FIRCLK_i,rst_i)            --T FF 
begin
	if rst_i='1' then
		toggle_A <= '0';
    elsif rising_edge(FIRCLK_i) then
        if FIRCTL_Reg_Q(0) = '1' then  -- FIRCTL_Reg_Q(0) = FIRENA
            toggle_A <= not toggle_A;
        end if;
    end if;
end process;

process(MCLK_i,rst_i)
begin
	if rst_i='1' then
        sync_ff1 <= '0';		--DFF
        sync_ff2 <= '0';		--DFF	
		sync_ff3 <= '0';		--DFF		
    elsif rising_edge(MCLK_i) then
        sync_ff1 <= toggle_A;		--DFF
        sync_ff2 <= sync_ff1;		--DFF	
		sync_ff3 <= sync_ff2;		--DFF
		
        FIFOREN <= sync_ff3 xor sync_ff2;  --set FIFOREN for 1 MCLK cycle
    end if;
end process;

-----------------------FIR Implementation---------------------------------------
process(FIRCLK_i,rst_i)            
begin
	if rst_i='1' then
		x_n_minus1 <= (others => '0');
    elsif rising_edge(FIRCLK_i) then
		if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
			x_n_minus1 <= x_n;
        end if;
    end if;
end process;
----------------
process(FIRCLK_i,rst_i)            
begin
	if rst_i='1' then
		x_n_minus2 <= (others => '0');
    elsif rising_edge(FIRCLK_i) then
		if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
			x_n_minus2 <= x_n_minus1;
        end if;
    end if;
end process;
----------------
process(FIRCLK_i,rst_i)            
begin
	if rst_i='1' then
		x_n_minus3 <= (others => '0');
    elsif rising_edge(FIRCLK_i) then
		if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
			x_n_minus3 <= x_n_minus2;
        end if;
    end if;
end process;
----------------
process(FIRCLK_i,rst_i)            
begin
	if rst_i='1' then
		x_n_minus4 <= (others => '0');
    elsif rising_edge(FIRCLK_i) then
		if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
			x_n_minus4 <= x_n_minus3;
        end if;
    end if;
end process;  
----------------
process(FIRCLK_i,rst_i)            
begin
	if rst_i='1' then
		x_n_minus5 <= (others => '0');
    elsif rising_edge(FIRCLK_i) then
		if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
			x_n_minus5 <= x_n_minus4;
        end if;
    end if;
end process; 
----------------
process(FIRCLK_i,rst_i)            
begin
	if rst_i='1' then
		x_n_minus6 <= (others => '0');
    elsif rising_edge(FIRCLK_i) then
		if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
			x_n_minus6 <= x_n_minus5;
        end if;
    end if;
end process; 
----------------
process(FIRCLK_i,rst_i)            
begin
	if rst_i='1' then
		x_n_minus7 <= (others => '0');
    elsif rising_edge(FIRCLK_i) then
		if(FIRCTL_Reg_Q(0)='1') then 	-- FIRCTL_Reg_Q(0) = FIRENA
			x_n_minus7 <= x_n_minus6;
        end if;
    end if;
end process; 
----------------
x_n_mult <= x_n * COEF3_0_Reg_Q(7 downto 0);  
x_n_minus1_mult <= x_n_minus1 * COEF3_0_Reg_Q(15 downto 8);  
x_n_minus2_mult <= x_n_minus2 * COEF3_0_Reg_Q(23 downto 16);  
x_n_minus3_mult <= x_n_minus3 * COEF3_0_Reg_Q(31 downto 24);  

x_n_minus4_mult <= x_n_minus4 * COEF7_4_Reg_Q(7 downto 0);  
x_n_minus5_mult <= x_n_minus5 * COEF7_4_Reg_Q(15 downto 8);  
x_n_minus6_mult <= x_n_minus6 * COEF7_4_Reg_Q(23 downto 16);  
x_n_minus7_mult <= x_n_minus7 * COEF7_4_Reg_Q(31 downto 24);

y_n <= x_n_mult+x_n_minus1_mult+x_n_minus2_mult+x_n_minus3_mult+x_n_minus4_mult+x_n_minus5_mult+x_n_minus6_mult+x_n_minus7_mult;  
-----------------------FIR Interrupts---------------------------------------
--FIFOEMPTY_o <= FIFOEMPTY_D;   
--FIROUT_o <= FIRCTL_Reg_Q(0) and FIRCLK_i and flag;  --FIRENA and FIRCLK_i and 

    process(MCLK_i)   
    begin
	if rising_edge(MCLK_i) then
		FIFOEMPTY_o <= FIFOEMPTY_D; 
		FIROUT_o <= FIRCTL_Reg_Q(0) and FIRCLK_i and flag;  --FIRENA and FIRCLK_i and FIFOREN at the beginning of FIRCLK_i
	end if;
	end process; 
	
    process(FIRCLK_i, rst_i, FIFOREN)   
    begin
        if rst_i = '1' then
            event_latch <= '0';
            flag <= '0';
        elsif FIFOREN = '1' then  
            event_latch <= '1';
        elsif rising_edge(FIRCLK_i) then
            flag <= event_latch;  
            event_latch <= '0';   
        end if;
    end process;



END FIRfilter;



