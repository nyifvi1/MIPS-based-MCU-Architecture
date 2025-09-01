LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------
ENTITY GPIO IS
  GENERIC (DATA_BUS_WIDTH : integer 	:= 32); 
  PORT(MCLK_i              :IN  STD_LOGIC;
	   MemWrite_ctrl_i 	   :IN 	STD_LOGIC;
	   MemRead_ctrl_i      :IN 	STD_LOGIC;
	   SW7to0_i   : in std_logic_vector(7 downto 0);
	   DataBus_io   : inout std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	   AddrBus_i   : in std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
	   HEX0_o,HEX1_o,HEX2_o,HEX3_o,HEX4_o,HEX5_o : out std_logic_vector(6 downto 0);
	   LEDR7to0_o : out std_logic_vector(7 downto 0)
		); 
END GPIO;
-----------------------------------------------
ARCHITECTURE GPIO OF GPIO IS 
signal CS : std_logic_vector(6 downto 0);
signal Addr11_6to1_w : std_logic_vector(6 downto 0);

signal LEDR7to0_Lat_EN,LEDR7to0_BidirPin_EN : std_logic;
signal LEDR7to0_Lat_Q : std_logic_vector(7 downto 0);
signal LEDR7to0_Lat_D,LEDR7to0_Lat_Q_ext : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);

signal HEX0_Lat_EN,HEX0_BidirPin_EN : std_logic;
signal HEX0_Lat_D,HEX0_Lat_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal HEX0_Lat_Q : std_logic_vector(7 downto 0);

signal HEX1_Lat_EN,HEX1_BidirPin_EN : std_logic;
signal HEX1_Lat_D,HEX1_Lat_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal HEX1_Lat_Q : std_logic_vector(7 downto 0);

signal HEX2_Lat_EN,HEX2_BidirPin_EN : std_logic;
signal HEX2_Lat_D,HEX2_Lat_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal HEX2_Lat_Q : std_logic_vector(7 downto 0);

signal HEX3_Lat_EN,HEX3_BidirPin_EN : std_logic;
signal HEX3_Lat_D,HEX3_Lat_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal HEX3_Lat_Q : std_logic_vector(7 downto 0);

signal HEX4_Lat_EN,HEX4_BidirPin_EN : std_logic;
signal HEX4_Lat_D,HEX4_Lat_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal HEX4_Lat_Q : std_logic_vector(7 downto 0);

signal HEX5_Lat_EN,HEX5_BidirPin_EN : std_logic;
signal HEX5_Lat_D,HEX5_Lat_Q_ext  : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
signal HEX5_Lat_Q : std_logic_vector(7 downto 0);

signal SW7to0_TriState_EN : std_logic;
signal SW7to0_ext : std_logic_vector(DATA_BUS_WIDTH-1 downto 0);

begin
--------------------------Chip Select interface------------------------------------
Addr11_6to1_w <= AddrBus_i(11)&AddrBus_i(6 downto 1);

with Addr11_6to1_w select 
	CS <= "0000001" WHEN "1000000",--0x800 (LEDS)
		  "0000010" WHEN "1000010",--0x804,0x805 (HEX0 and 1)
		  "0000100" WHEN "1000100",--0x808,0x809 (HEX2 and 3)
		  "0001000" WHEN "1000110",--0x80C,0x80D (HEX4 and 5)
		  "0010000" WHEN "1001000",--0x810 (SWs)
		  "0000000" WHEN OTHERS;
--------------------------LEDR7 to LEDR0 interface------------------------------------
LEDR7to0_Lat_EN <= CS(0) and MemWrite_ctrl_i;		  
LEDR7to0_Lat : process(LEDR7to0_Lat_EN,LEDR7to0_Lat_D)
				begin
					if (LEDR7to0_Lat_EN = '1') then
						LEDR7to0_Lat_Q <= LEDR7to0_Lat_D(7 downto 0);
					end if;
				end process;
				
LEDR7to0_o <= LEDR7to0_Lat_Q;	
LEDR7to0_BidirPin_EN <= CS(0) and MemRead_ctrl_i;		  
	
LEDR7to0_BidirPin : BidirPin
	PORT MAP (Dout  => LEDR7to0_Lat_Q_ext,  	
			  en    => LEDR7to0_BidirPin_EN,		
		      Din   => LEDR7to0_Lat_D,
		      IOpin => DataBus_io		
			);	
	LEDR7to0_Lat_Q_ext		<= X"000000"&LEDR7to0_Lat_Q;	
-----------------------HEX0 interface---------------------------------------
HEX0_Lat_EN <= CS(1) and MemWrite_ctrl_i and not AddrBus_i(0);		  
HEX0_Lat : process(MCLK_i)
			begin
				if rising_edge(MCLK_i) then
					if (HEX0_Lat_EN = '1') then
						HEX0_Lat_Q <= HEX0_Lat_D(7 downto 0);
					end if;
				end if;
			end process;
				
HEX0_BidirPin_EN <= CS(1) and MemRead_ctrl_i and not AddrBus_i(0);		  
	
HEX0_BidirPin : BidirPin
	PORT MAP (Dout  => HEX0_Lat_Q_ext,  	
			  en    => HEX0_BidirPin_EN,		
		      Din   => HEX0_Lat_D,
		      IOpin => DataBus_io		
			);	
HEX0_Lat_Q_ext		<= X"000000"&HEX0_Lat_Q;
		
HEX0_7segD : SevenSegDecoder
	PORT MAP (data => HEX0_Lat_Q(3 downto 0),
			  seg  => HEX0_o
			  );
-----------------------HEX1 interface---------------------------------------
HEX1_Lat_EN <= CS(1) and MemWrite_ctrl_i and AddrBus_i(0);		  
HEX1_Lat : process(MCLK_i)
			begin
				if rising_edge(MCLK_i) then
					if (HEX1_Lat_EN = '1') then
						HEX1_Lat_Q <= HEX1_Lat_D(7 downto 0);
					end if;
				end if;
			end process;
				
HEX1_BidirPin_EN <= CS(1) and MemRead_ctrl_i and AddrBus_i(0);		  
	
HEX1_BidirPin : BidirPin
	PORT MAP (Dout  => HEX1_Lat_Q_ext,  	
			  en    => HEX1_BidirPin_EN,		
		      Din   => HEX1_Lat_D,
		      IOpin => DataBus_io		
			);	
HEX1_Lat_Q_ext		<= X"000000"&HEX1_Lat_Q;
		
HEX1_7segD : SevenSegDecoder
	PORT MAP (data => HEX1_Lat_Q(3 downto 0),
			  seg  => HEX1_o
			  );
-----------------------HEX2 interface---------------------------------------
HEX2_Lat_EN <= CS(2) and MemWrite_ctrl_i and not AddrBus_i(0);		  
HEX2_Lat : process(MCLK_i)
			begin
				if rising_edge(MCLK_i) then
					if (HEX2_Lat_EN = '1') then
						HEX2_Lat_Q <= HEX2_Lat_D(7 downto 0);
					end if;
				end if;
			end process;
				
HEX2_BidirPin_EN <= CS(2) and MemRead_ctrl_i and not AddrBus_i(0);		  
	
HEX2_BidirPin : BidirPin
	PORT MAP (Dout  => HEX2_Lat_Q_ext,  	
			  en    => HEX2_BidirPin_EN,		
		      Din   => HEX2_Lat_D,
		      IOpin => DataBus_io		
			);	
HEX2_Lat_Q_ext		<= X"000000"&HEX2_Lat_Q;
		
HEX2_7segD : SevenSegDecoder
	PORT MAP (data => HEX2_Lat_Q(3 downto 0),
			  seg  => HEX2_o
			  );
-----------------------HEX3 interface---------------------------------------
HEX3_Lat_EN <= CS(2) and MemWrite_ctrl_i and AddrBus_i(0);		  
HEX3_Lat : process(MCLK_i)
			begin
				if rising_edge(MCLK_i) then
					if (HEX3_Lat_EN = '1') then
						HEX3_Lat_Q <= HEX3_Lat_D(7 downto 0);
					end if;
				end if;
			end process;
				
HEX3_BidirPin_EN <= CS(2) and MemRead_ctrl_i and AddrBus_i(0);		  
	
HEX3_BidirPin : BidirPin
	PORT MAP (Dout  => HEX3_Lat_Q_ext,  	
			  en    => HEX3_BidirPin_EN,		
		      Din   => HEX3_Lat_D,
		      IOpin => DataBus_io		
			);	
HEX3_Lat_Q_ext		<= X"000000"&HEX3_Lat_Q;
		
HEX3_7segD : SevenSegDecoder
	PORT MAP (data => HEX3_Lat_Q(3 downto 0),
			  seg  => HEX3_o
			  );
-----------------------HEX4 interface---------------------------------------
HEX4_Lat_EN <= CS(3) and MemWrite_ctrl_i and not AddrBus_i(0);		  
HEX4_Lat : process(MCLK_i)
			begin
				if rising_edge(MCLK_i) then
					if (HEX4_Lat_EN = '1') then
						HEX4_Lat_Q <= HEX4_Lat_D(7 downto 0);
					end if;
				end if;
			end process;
				
HEX4_BidirPin_EN <= CS(3) and MemRead_ctrl_i and not AddrBus_i(0);		  
	
HEX4_BidirPin : BidirPin
	PORT MAP (Dout  => HEX4_Lat_Q_ext,  	
			  en    => HEX4_BidirPin_EN,		
		      Din   => HEX4_Lat_D,
		      IOpin => DataBus_io		
			);	
HEX4_Lat_Q_ext		<= X"000000"&HEX4_Lat_Q;
		
HEX4_7segD : SevenSegDecoder
	PORT MAP (data => HEX4_Lat_Q(3 downto 0),
			  seg  => HEX4_o
			  );
-----------------------HEX5 interface---------------------------------------
HEX5_Lat_EN <= CS(3) and MemWrite_ctrl_i and AddrBus_i(0);		  
HEX5_Lat : process(MCLK_i)
			begin
			if rising_edge(MCLK_i) then
				if (HEX5_Lat_EN = '1') then
					HEX5_Lat_Q <= HEX5_Lat_D(7 downto 0);
				end if;
			end if;
			end process;
				
HEX5_BidirPin_EN <= CS(3) and MemRead_ctrl_i and AddrBus_i(0);		  
	
HEX5_BidirPin : BidirPin
	PORT MAP (Dout  => HEX5_Lat_Q_ext,  	
			  en    => HEX5_BidirPin_EN,		
		      Din   => HEX5_Lat_D,
		      IOpin => DataBus_io		
			);	
HEX5_Lat_Q_ext		<= X"000000"&HEX5_Lat_Q;
		
HEX5_7segD : SevenSegDecoder
	PORT MAP (data => HEX5_Lat_Q(3 downto 0),
			  seg  => HEX5_o
			  );
-----------------------SWs interface---------------------------------------
SW7to0_TriState_EN <= CS(4) and MemRead_ctrl_i;		  
SW7to0_ext  <= X"000000"&SW7to0_i;

SW7to0_TriState : TriState	
	PORT MAP(Dout => SW7to0_ext,
			 en   => SW7to0_TriState_EN,
			 IOpin=> DataBus_io
			 );
			 
END GPIO;

