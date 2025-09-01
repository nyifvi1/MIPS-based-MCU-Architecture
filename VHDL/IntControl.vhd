LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------
ENTITY IntControl IS
  GENERIC (DATA_BUS_WIDTH : integer := 32); 
  PORT(clk_i : in std_logic;
	   rst_i : in std_logic; 
	   IRQ_i : in std_logic_vector(7 downto 0);
	   INTA_i : in std_logic;
	   GIE_i  : in std_logic;
	   MemWrite_ctrl_i 	   :in 	STD_LOGIC;
	   MemRead_ctrl_i      :in 	STD_LOGIC;
	   DataBus_io   : inout std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	   AddrBus_i   : in std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
       INTR_o : out std_logic;
	   KEY3to1_i : std_logic_vector(2 downto 0) -- Real value of PBs
	   ); 
END IntControl;
-----------------------------------------------
ARCHITECTURE IntControl OF IntControl IS 
signal CS : std_logic_vector(3 downto 0);
signal Addr11_6to0_w : std_logic_vector(7 downto 0);

signal IE_Reg_EN,IE_BidirPin_EN : std_logic;
signal IE_Reg_D,IE_Reg_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal IE_Reg_Q : std_logic_vector(7 downto 0);

signal IFG_Reg_EN,IFG_BidirPin_EN : std_logic;
signal IFG_Reg_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal IFG_Reg_Q : std_logic_vector(7 downto 0);

signal TYPE_TriState_EN : std_logic;
signal TYPE_ext : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);

signal IFG_fromDataBus : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal TYPE_Reg_D,TYPE_Reg_Q : 	std_logic_vector(7 downto 0);
signal IRQ_Reg_Q,IFG_Reg_D : std_logic_vector(7 downto 0);
signal clr_irq,IntTrig : std_logic_vector(7 downto 0);

signal KEY3to1_TriState_EN : std_logic;
signal KEY3to1_ext : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
begin
--------------------------Chip Select interface------------------------------------
Addr11_6to0_w <= AddrBus_i(11)&AddrBus_i(6 downto 0);

with Addr11_6to0_w select 
	CS <= "0001" WHEN "11000000",--0x840 (IE)
		  "0010" WHEN "11000001",--0x841 (IFG)
		  "0100" WHEN "11000010",--0x842 (TYPE)
		  "1000" WHEN "10010100",--0x814 (KEY3to1)
		  "0000" WHEN OTHERS;
-----------------------IE interface---------------------------------------
IE_Reg_EN <= CS(0) and MemWrite_ctrl_i;		  
IE_Reg : process(clk_i,rst_i)
			begin
				if(rst_i='1') then
					IE_Reg_Q <= (others => '0');
				elsif(rising_edge(clk_i)) then
					if (IE_Reg_EN = '1') then
						IE_Reg_Q <= '0'&IE_Reg_D(6 downto 0);
					end if;
				end if;
			end process;
				
IE_BidirPin_EN <= CS(0) and MemRead_ctrl_i;		  
	
IE_BidirPin : BidirPin
	PORT MAP (Dout  => IE_Reg_Q_ext,  	
			  en    => IE_BidirPin_EN,		
		      Din   => IE_Reg_D,
		      IOpin => DataBus_io		
			);	
IE_Reg_Q_ext		<= X"000000"&IE_Reg_Q;
-----------------------IFG interface---------------------------------------
IFG_Reg : process(clk_i,rst_i)
			begin
				if(rst_i='1') then
					IFG_Reg_Q <= (others => '0'); 
				elsif(rising_edge(clk_i)) then
					IFG_Reg_Q <= '0'&(IFG_Reg_D(7) or IFG_Reg_D(6))&IFG_Reg_D(5 downto 0);			
				end if;
			end process;
				
IFG_BidirPin_EN <= CS(1) and MemRead_ctrl_i;		  
	
IFG_BidirPin : BidirPin	
	PORT MAP(Dout => IFG_Reg_Q_ext,
			 en   => IFG_BidirPin_EN,
			 Din  => IFG_fromDataBus,
			 IOpin=> DataBus_io
			 );
			 
IFG_Reg_Q_ext		<= X"000000"&IFG_Reg_Q; 

-----------------------Priority Encoder interface---------------------------------------
TYPE_Reg_D <= 	 "00000100" when IFG_Reg_D(0) = '1' else 		-- UART ERROR
				 "00001000" when IFG_Reg_D(0) = '1' else		-- RX 
				 "00001100" when IFG_Reg_D(1) = '1' else		-- TX 
				 "00010000" when IFG_Reg_D(2) = '1' else		-- Timer
				 "00010100" when IFG_Reg_D(3) = '1' else		-- KEY1
				 "00011000" when IFG_Reg_D(4) = '1' else		-- KEY2
				 "00011100" when IFG_Reg_D(5) = '1' else		-- KEY3
				 "00100000" when IFG_Reg_D(6) = '1' else		-- FIFOEMPTY
				 "00100100" when IFG_Reg_D(7) = '1' else		-- FIROUT
				 "00000000";
-----------------------TYPE interface---------------------------------------
TYPE_TriState_EN <= (CS(2) and MemRead_ctrl_i) or (not INTA_i);	  --CPU SW read  or  HW INTRRUPT HANDLING
TYPE_ext  <= X"000000"&TYPE_Reg_Q;

TYPE_Reg : process(clk_i,rst_i)      
			begin
				if(rst_i='1') then
					TYPE_Reg_Q <= (others => '0');
				elsif(rising_edge(clk_i)) then
					TYPE_Reg_Q <= TYPE_Reg_D;
				end if;
			end process;
			
TYPE_TriState : TriState	
	PORT MAP(Dout => TYPE_ext,
			 en   => TYPE_TriState_EN,
			 IOpin=> DataBus_io
			 );			 
--------------------------Handling  an interrupt------------------------------
clr_irq(0) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(0) = '0') or  --RXIFG CLEAR
			 ((TYPE_Reg_Q = "00000100" or TYPE_Reg_Q = "00001000") and INTA_i = '0')) else '0';
clr_irq(1) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(1) = '0') or  --TXIFG CLEAR
			 (TYPE_Reg_Q = "00001100" and INTA_i = '0')) else '0';
clr_irq(2) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(2) = '0') or  --BTIFG CLEAR
			 (TYPE_Reg_Q = "00010000" and INTA_i = '0')) else '0';
clr_irq(3) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(3) = '0')) else '0';  	  --KEY1IFG CLEAR
clr_irq(4) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(4) = '0')) else '0'; 	  --KEY2IFG CLEAR
clr_irq(5) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(5) = '0')) else '0'; 	  --KEY3IFG CLEAR
clr_irq(6) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(6) = '0') or   --FIRIFG CLEAR(FIFOEMPTY)
			 (TYPE_Reg_Q = "00100000" and INTA_i = '0')) else '0';
clr_irq(7) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(6) = '0') or   --FIRIFG CLEAR(FIROUT)
			 (TYPE_Reg_Q = "00100100" and INTA_i = '0')) else '0';			 
-------------
IntTrig(0) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(0) = '1') or  --SET RXIFG 
			  IRQ_i(0)='1') else '0';
IntTrig(1) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(1) = '1') or  --SET TXIFG 
			  IRQ_i(1)='1') else '0';
IntTrig(2) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(2) = '1') or  --SET BTIFG 
			  IRQ_i(2)='1') else '0';
IntTrig(3) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(3) = '1') or  --SET KEY1IFG 
			  IRQ_i(3)='1') else '0';
IntTrig(4) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(4) = '1') or  --SET KEY2IFG 
			  IRQ_i(4)='1') else '0';
IntTrig(5) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(5) = '1') or  --SET KEY3IFG 
			  IRQ_i(5)='1') else '0';
IntTrig(6) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(6) = '1') or   --SET FIRIFG(FIFOEMPTY) 
			  IRQ_i(6)='1') else '0';
IntTrig(7) <= '1' when ((CS(1) = '1' and MemWrite_ctrl_i = '1' and IFG_fromDataBus(6) = '1') or   --SET FIRIFG(FIROUT) 
			  IRQ_i(7)='1') else '0';			  			  
-------------
IRQ0_Reg : process(rst_i,IntTrig(0),clr_irq(0))  --RX Interrupt source    
			begin
				if(clr_irq(0)='1' or rst_i='1') then
					IRQ_Reg_Q(0) <= '0';
				elsif(rising_edge(IntTrig(0))) then
					IRQ_Reg_Q(0) <= '1';
				end if;
			end process;
			
IRQ1_Reg : process(rst_i,IntTrig(1),clr_irq(1))  --TX Interrupt source     
			begin
				if(clr_irq(1)='1' or rst_i='1') then
					IRQ_Reg_Q(1) <= '0';
				elsif(rising_edge(IntTrig(1))) then
					IRQ_Reg_Q(1) <= '1';
				end if;
			end process;
IRQ2_Reg : process(rst_i,IntTrig(2),clr_irq(2))  --BT Interrupt source     
			begin
				if(clr_irq(2)='1' or rst_i='1') then
					IRQ_Reg_Q(2) <= '0';
				elsif(rising_edge(IntTrig(2))) then
					IRQ_Reg_Q(2) <= '1';
				end if;
			end process;
			
IRQ3_Reg : process(rst_i,IntTrig(3),clr_irq(3))   --KEY1 Interrupt source   
			begin
				if(clr_irq(3)='1' or rst_i='1') then
					IRQ_Reg_Q(3) <= '0';
				elsif(rising_edge(IntTrig(3))) then
					IRQ_Reg_Q(3) <= '1';
				end if;
			end process;	

IRQ4_Reg : process(rst_i,IntTrig(4),clr_irq(4))   --KEY2 Interrupt source   
			begin
				if(clr_irq(4)='1' or rst_i='1') then
					IRQ_Reg_Q(4) <= '0';
				elsif(rising_edge(IntTrig(4))) then
					IRQ_Reg_Q(4) <= '1';
				end if;
			end process;

IRQ5_Reg : process(rst_i,IntTrig(5),clr_irq(5))    --KEY3 Interrupt source  
			begin
				if(clr_irq(5)='1' or rst_i='1') then
					IRQ_Reg_Q(5) <= '0';
				elsif(rising_edge(IntTrig(5))) then
					IRQ_Reg_Q(5) <= '1';
				end if;
			end process;

IRQ6_Reg : process(rst_i,IntTrig(6),clr_irq(6))     --FIR(FIFOEMPTY) Interrupt source 
			begin
				if(clr_irq(6)='1' or rst_i='1') then
					IRQ_Reg_Q(6) <= '0';
				elsif(rising_edge(IntTrig(6))) then
					IRQ_Reg_Q(6) <= '1';
				end if;
			end process;			

IRQ7_Reg : process(rst_i,IntTrig(7),clr_irq(7))     --FIR(FIROUT) Interrupt source 
			begin
				if(clr_irq(7)='1' or rst_i='1') then
					IRQ_Reg_Q(7) <= '0';
				elsif(rising_edge(IntTrig(7))) then
					IRQ_Reg_Q(7) <= '1';
				end if;
			end process;
			
IFG_sig:	for i in 0 to 6 generate 
			IFG_Reg_D(i) <= IRQ_Reg_Q(i) and IE_Reg_Q(i);
			end generate;
			IFG_Reg_D(7) <= IRQ_Reg_Q(7) and IE_Reg_Q(6);

			INTR_o <= (IFG_Reg_D(0) or IFG_Reg_D(1) or IFG_Reg_D(2) or IFG_Reg_D(3) or IFG_Reg_D(4) or 
						IFG_Reg_D(5) or IFG_Reg_D(6) or IFG_Reg_D(7)) and GIE_i;
-----------------------KEY3to1 interface---------------------------------------
KEY3to1_TriState_EN <= CS(3) and MemRead_ctrl_i;		  
KEY3to1_ext  <= X"0000000"&KEY3to1_i&'0';

KEY3to1_TriState : TriState	
	PORT MAP(Dout => KEY3to1_ext,
			 en   => KEY3to1_TriState_EN,
			 IOpin=> DataBus_io
			 );
			 					
END IntControl;

