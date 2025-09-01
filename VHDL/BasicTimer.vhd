LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------
ENTITY BasicTimer IS
  GENERIC (DATA_BUS_WIDTH : integer := 32); 
  PORT(rst_i,MCLK_i : in std_logic;         --rst is KEY0
	   MemWrite_ctrl_i 	   :in 	STD_LOGIC;
	   MemRead_ctrl_i      :in 	STD_LOGIC;
	   DataBus_io   : inout std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	   AddrBus_i   : in std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	   PWM_o,BTIFG : out std_logic
		); 
END BasicTimer;
-----------------------------------------------
ARCHITECTURE BasicTimer OF BasicTimer IS 

signal BTCNT,BTCL0,BTCL1,BTCNT_fromDataBus : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);	
signal rst_timer,HEU0,BTCLK,MCLK_2,MCLK_4,MCLK_8,BTCNTeq0,BTCNT_BidirPin_EN : std_logic;
signal MCLK_div : std_logic_vector(2 downto 0);

signal CS : std_logic_vector(3 downto 0);
signal Addr11_6to0_w : std_logic_vector(7 downto 0);

signal BTCTL_BidirPin_EN : std_logic;
signal BTCTL_Reg_D,BTCTL_Reg_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal BTCTL_Reg_Q : std_logic_vector(7 downto 0);


signal BTCCR0_BidirPin_EN : std_logic;
signal BTCCR0_Reg_D  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal BTCCR0_Reg_Q : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);

signal BTCCR1_BidirPin_EN : std_logic;
signal BTCCR1_Reg_D  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal BTCCR1_Reg_Q : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);

signal BTHOLD,BTCLR,BTOUTEN,BTOUTMD : std_logic;
signal BTSSELx,BTIPx : std_logic_vector(1 downto 0);

signal BTCCR0_Reg_Q_aux : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	
begin
-----------------------Chip Select interface---------------------------------------
Addr11_6to0_w <= AddrBus_i(11)&AddrBus_i(6 downto 0);

with Addr11_6to0_w select 
	CS <= "0001" WHEN "10011100",--0x81C (BTCTL)
		  "0010" WHEN "10100000",--0x820 (BTCNT)
		  "0100" WHEN "10100100",--0x824 (BTCCR0)
		  "1000" WHEN "10101000",--0x828 (BTCCR1)
		  "0000" WHEN OTHERS;
-----------------------BTCTL Register---------------------------------------
BTCTL_Reg : process(rst_i,MCLK_i)      
			begin
				if(rst_i = '1') then
					BTCTL_Reg_Q <= (others => '0');
				elsif(rising_edge(MCLK_i)) then
					if (CS(0)='1' and MemWrite_ctrl_i='1') then
						BTCTL_Reg_Q <= BTCTL_Reg_D(7 downto 0);
					elsif (BTCTL_Reg_Q(2)='1') THEN  --Added to reset BTCLR after 1 cycle
						BTCTL_Reg_Q(2) <= '0';		 --Added to reset BTCLR after 1 cycle
					end if;
				end if;
			end process;
			
BTCTL_BidirPin_EN <= CS(0) and MemRead_ctrl_i;		  
	
BTCTL_BidirPin : BidirPin
	PORT MAP (Dout  => BTCTL_Reg_Q_ext,  	
			  en    => BTCTL_BidirPin_EN,		
		      Din   => BTCTL_Reg_D,
		      IOpin => DataBus_io		
			);	
BTCTL_Reg_Q_ext		<= X"000000"&BTCTL_Reg_Q;
-----------------------BTCTL Assignments---------------------------------------
BTIPx <= BTCTL_Reg_Q(1 downto 0);
BTCLR <= BTCTL_Reg_Q(2);
BTSSELx <= BTCTL_Reg_Q(4 downto 3);
BTHOLD <= BTCTL_Reg_Q(5);
BTOUTEN <= BTCTL_Reg_Q(6);
BTOUTMD <= BTCTL_Reg_Q(7);
-----------------------BTCCR0 Register---------------------------------------
BTCCR0_Reg : process(rst_i,MCLK_i)      
			begin
				if(rst_i = '1') then
					BTCCR0_Reg_Q <= (others => '0');
				elsif(rising_edge(MCLK_i)) then
					if (CS(2)='1' and MemWrite_ctrl_i='1') then
						BTCCR0_Reg_Q <= BTCCR0_Reg_D;
					end if;
				end if;
			end process;
			
BTCCR0_BidirPin_EN <= CS(2) and MemRead_ctrl_i;		  
	
BTCCR0_BidirPin : BidirPin
	PORT MAP (Dout  => BTCCR0_Reg_Q,  	
			  en    => BTCCR0_BidirPin_EN,		
		      Din   => BTCCR0_Reg_D,
		      IOpin => DataBus_io		
			);	
-----------------------BTCCR1 Register---------------------------------------
BTCCR1_Reg : process(rst_i,MCLK_i)      
			begin
				if(rst_i = '1') then
					BTCCR1_Reg_Q <= (others => '0');
				elsif(rising_edge(MCLK_i)) then
					if (CS(3)='1' and MemWrite_ctrl_i='1') then
						BTCCR1_Reg_Q <= BTCCR1_Reg_D;
					end if;
				end if;
			end process;
			
BTCCR1_BidirPin_EN <= CS(3) and MemRead_ctrl_i;		  
	
BTCCR1_BidirPin : BidirPin
	PORT MAP (Dout  => BTCCR1_Reg_Q,  	
			  en    => BTCCR1_BidirPin_EN,		
		      Din   => BTCCR1_Reg_D,
		      IOpin => DataBus_io		
			);	
-----------------------MCLK Divider---------------------------------------
process (MCLK_i,BTCLR)
BEGIN
	if(BTCLR='1') THEN
		MCLK_div <= (others => '0');
	elsif (rising_edge(MCLK_i)) then	   
		MCLK_div <= MCLK_div + 1;
	end if;
end process;

MCLK_2 <= MCLK_div(0);
MCLK_4 <= MCLK_div(1);
MCLK_8 <= MCLK_div(2);
	
with BTSSELx select	
	BTCLK <= MCLK_i 	when "00",
		     MCLK_2 when "01",
		     MCLK_4 when "10",
		     MCLK_8 when others;
--------------------------------------------------------------------
--BTCL0,BTCL1 latches
BTCNTeq0 <= '1' when BTCNT=0 else '0';
/* 
BTCL0_Lat : process(BTCNTeq0,BTCCR0_Reg_Q)
			begin
				if (BTCNTeq0 = '1') then
					BTCL0 <= BTCCR0_Reg_Q;
				end if;
		end process;

		
BTCL1_Lat : process(BTCNTeq0,BTCCR1_Reg_Q)
			begin
				if (BTCNTeq0 = '1') then
					BTCL1 <= BTCCR1_Reg_Q;
				end if;
		end process; */
		
BTCL0 <= BTCCR0_Reg_Q when BTCNTeq0='1' else BTCL0;
BTCL1 <= BTCCR1_Reg_Q when BTCNTeq0='1' else BTCL1;
				
		
---------------------BTIFG mux-----------------------------------
with BTIPx select	
	BTIFG <= HEU0 	   when "00",
		     BTCNT(23) when "01",
		     BTCNT(27) when "10",
		     BTCNT(31) when others;
---------------------Timer Register----------------------------------------
Timer : process(BTCLK,rst_timer)
			begin
				if(rst_timer = '1') then 
					BTCNT <= (others => '0');
				elsif (rising_edge(BTCLK)) then 
					if (CS(1)='1' and MemWrite_ctrl_i='1') then
						BTCNT <= BTCNT_fromDataBus;
					elsif (BTHOLD = '0') then
						BTCNT <= BTCNT+1;
					end if;
				end if;
		end process;

HEU0      <= '1' when BTCNT>=BTCL0 else '0';	
rst_timer <= '1' when (BTCLR='1' or HEU0='1' or rst_i='1') else '0';      

BTCNT_BidirPin_EN <= CS(1) and MemRead_ctrl_i;

BTCNT_BidirPin : BidirPin	
	PORT MAP(Dout => BTCNT,
			 en   => BTCNT_BidirPin_EN,
			 Din  => BTCNT_fromDataBus,
			 IOpin=> DataBus_io
			 );
---------------------Output Compare Unit----------------------------------------
OutputUnit: process(BTCL1,BTCL0,BTOUTMD,BTOUTEN,BTCNT)
			begin 
			if BTOUTEN='1' then
				case BTOUTMD is 
					when '0' =>
						if BTCNT < BTCL1 then
							PWM_o <= '0';
						else 
							PWM_o <= '1';
						end if;
					when '1' =>
						if BTCNT < BTCL1 then
							PWM_o <= '1';
						else 
							PWM_o <= '0';
						end if;										
					when others =>
							PWM_o <= '0';
				end case;
			else 
							PWM_o <= '0';
			end if;
		end process;

		
END BasicTimer;



