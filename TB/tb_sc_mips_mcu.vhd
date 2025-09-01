---------------------------------------------------------------------------------------------
-- Copyright 2025 Hananya Ribo 
-- Advanced CPU architecture and Hardware Accelerators Lab 361-1-4693 BGU
---------------------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
USE work.cond_comilation_package.all;
USE work.aux_package.all;


ENTITY MCU_tb IS
	generic( 
		WORD_GRANULARITY : boolean 	:= G_WORD_GRANULARITY;
	    MODELSIM : integer 			:= G_MODELSIM;
		DATA_BUS_WIDTH : integer 	:= 32;
		ITCM_ADDR_WIDTH : integer 	:= G_ADDRWIDTH;
		DTCM_ADDR_WIDTH : integer 	:= G_ADDRWIDTH;
		PC_WIDTH : integer 			:= 10;
		FUNCT_WIDTH : integer 		:= 6;
		DATA_WORDS_NUM : integer 	:= G_DATA_WORDS_NUM;
		CLK_CNT_WIDTH : integer 	:= 16;
		INST_CNT_WIDTH : integer 	:= 16
	);
END MCU_tb ;


ARCHITECTURE struct OF MCU_tb IS
   -- Internal signal declarations
SIGNAL rst_tb_i           	: STD_LOGIC;
SIGNAL clk_tb_i           	: STD_LOGIC;
SIGNAL SW7to0_i,LEDR7to0_o             : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL HEX0_o,HEX1_o,HEX2_o,HEX3_o,HEX4_o,HEX5_o : STD_LOGIC_VECTOR(6 downto 0);
SIGNAL PWM_o : STD_LOGIC;   
SIGNAL KEY3to1_i : std_logic_vector(2 DOWNTO 0);
BEGIN
MCU_Inst : MCU	
	PORT MAP (	rst_i   => rst_tb_i,
				clk_i   => clk_tb_i,
				SW7to0_i=> SW7to0_i,
				HEX0_o  => HEX0_o,
				HEX1_o  => HEX1_o,
				HEX2_o  => HEX2_o,
				HEX3_o  => HEX3_o,
				HEX4_o  => HEX4_o,
				HEX5_o  => HEX5_o,
				LEDR7to0_o => LEDR7to0_o,
				KEY3to1_i => KEY3to1_i,
				PWM_o => PWM_o
	);			
--------------------------------------------------------------------	
	gen_clk : 
	process
        begin
		  clk_tb_i <= '1';
		  wait for 50 ns;
		  clk_tb_i <= not clk_tb_i;
		  wait for 50 ns;
    end process;
	
	gen_rst : 
	process
        begin
		  rst_tb_i <='1';
		  wait for 80 ns;
		  rst_tb_i <='0';
		  wait;
    end process;
--------------------------------------------------------------------
SW7to0_i <= "00000000";
	gen_KEYS : 
	process
        begin
		  KEY3to1_i <="000";
		  wait for 200 us;
		  KEY3to1_i <="001";
		  wait for 400 ns;
		  KEY3to1_i <="000";
		  --wait for 200 us;
		  --KEY3to1_i <="100";
		  wait;
    end process;	
--------------------------------------------------------------------		
END struct;
