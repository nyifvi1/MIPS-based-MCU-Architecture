---------------------------------------------------------------------------------------------
-- Copyright 2025 Hananya Ribo 
-- Advanced CPU architecture and Hardware Accelerators Lab 361-1-4693 BGU
---------------------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
USE work.cond_comilation_package.all;


package aux_package is

	component MIPS is
		generic( 
			WORD_GRANULARITY : boolean 	:= G_WORD_GRANULARITY;
	        MODELSIM : integer 			:= G_MODELSIM;
			DATA_BUS_WIDTH : integer 	:= 32;
			ITCM_ADDR_WIDTH : integer 	:= G_ADDRWIDTH;
			DTCM_ADDR_WIDTH : integer 	:= 1;
			PC_WIDTH : integer 			:= 10;
			FUNCT_WIDTH : integer 		:= 6;
			DATA_WORDS_NUM : integer 	:= G_DATA_WORDS_NUM;
			CLK_CNT_WIDTH : integer 	:= 16;
			INST_CNT_WIDTH : integer 	:= 16
		);
		PORT(	
			rst_i		 		:IN	STD_LOGIC;
			MCLK_i				:IN	STD_LOGIC; 
			-- Output important signals to pins for easy display in Simulator
			pc_o				:OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			alu_result_o 		:OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			read_data1_o 		:OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			read_data2_o 		:OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			write_data_o		:OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			instruction_top_o	:OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			Branch_ctrl_o		:OUT 	STD_LOGIC;
			Jump_ctrl_o         :OUT 	STD_LOGIC; 
			Zero_o				:OUT 	STD_LOGIC; 
			MemWrite_ctrl_o		:OUT 	STD_LOGIC;
			MemRead_ctrl_o      :OUT 	STD_LOGIC; 
			RegWrite_ctrl_o		:OUT 	STD_LOGIC;
			mclk_cnt_o			:OUT	STD_LOGIC_VECTOR(CLK_CNT_WIDTH-1 DOWNTO 0);
			inst_cnt_o 			:OUT	STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
			DataBus_io          :INOUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
		    INTA_o              :OUT 	STD_LOGIC;
			GIE_o               :OUT 	STD_LOGIC;
			INTR_i              :IN 	STD_LOGIC		
		);		
	end component;
---------------------------------------------------------  
	component control is
		PORT( 	
		opcode_i 			: IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		funct_i             : IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		RegDst_ctrl_o 		: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUSrc_ctrl_o 		: OUT 	STD_LOGIC;
		MemtoReg_ctrl_o 	: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		RegWrite_ctrl_o 	: OUT 	STD_LOGIC;
		MemRead_ctrl_o 		: OUT 	STD_LOGIC;
		MemWrite_ctrl_o	 	: OUT 	STD_LOGIC;
		Branch_ctrl_o 		: OUT 	STD_LOGIC;
		BNE_ctrl_o          : OUT 	STD_LOGIC; 
		Jump_ctrl_o         : OUT 	STD_LOGIC;
		ALUOp_ctrl_o	 	: OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
	end component;
---------------------------------------------------------	
	component dmemory is
		generic(
		DATA_BUS_WIDTH : integer := 32;
		DTCM_ADDR_WIDTH : integer := 8;
		WORDS_NUM : integer := 256
	);
	PORT(	clk_i,rst_i			: IN 	STD_LOGIC;
			dtcm_addr_i 		: IN 	STD_LOGIC_VECTOR(DTCM_ADDR_WIDTH-1 DOWNTO 0);
			dtcm_data_wr_i 		: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			MemRead_ctrl_i  	: IN 	STD_LOGIC;
			MemWrite_ctrl_i 	: IN 	STD_LOGIC;
			dtcm_data_rd_o 		: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
	);
	end component;
---------------------------------------------------------		
	component Execute is
		generic(
			DATA_BUS_WIDTH : integer := 32;
			FUNCT_WIDTH : integer := 6;
			PC_WIDTH : integer := 10
		);
		PORT(	
			read_data1_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			read_data2_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			sign_extend_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			funct_i 		: IN 	STD_LOGIC_VECTOR(FUNCT_WIDTH-1 DOWNTO 0);
			ALUOp_ctrl_i 	: IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
			ALUSrc_ctrl_i 	: IN 	STD_LOGIC;
			pc_plus4_i 		: IN 	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			zero_o 			: OUT	STD_LOGIC;
			alu_res_o 		: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			addr_res_o 		: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			jr_flag_o       : OUT   STD_LOGIC;
			rs_data_o       : OUT   STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0)
		);
	end component;
---------------------------------------------------------		
	component Idecode is
		generic(
			DATA_BUS_WIDTH : integer := 32;
			PC_WIDTH : integer 			:= 10
		);
		PORT(	
			clk_i,rst_i		: IN 	STD_LOGIC;
			instruction_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			dtcm_data_rd_i 	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			alu_result_i	: IN 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			RegWrite_ctrl_i : IN 	STD_LOGIC;
			MemtoReg_ctrl_i : IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			RegDst_ctrl_i 	: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			pc_plus4_r      : IN    STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			read_data1_o	: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			read_data2_o	: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			sign_extend_o 	: OUT 	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			GIE_o           : OUT   STD_LOGIC;
			INTR_i          : IN    STD_LOGIC;
			INTA_i 			: IN    STD_LOGIC;
			pc_i            : IN    STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0)			
		);
	end component;
---------------------------------------------------------		
	component Ifetch is
		generic(
			WORD_GRANULARITY : boolean 	:= False;
			DATA_BUS_WIDTH : integer 	:= 32;
			PC_WIDTH : integer 			:= 10;
			NEXT_PC_WIDTH : integer 	:= 8; -- NEXT_PC_WIDTH = PC_WIDTH-2
			ITCM_ADDR_WIDTH : integer 	:= 8;
			WORDS_NUM : integer 		:= 256;
			INST_CNT_WIDTH : integer 	:= 16
		);
		PORT(	
			clk_i, rst_i 	: IN 	STD_LOGIC;
			add_result_i 	: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
        	Branch_ctrl_i 	: IN 	STD_LOGIC;
			BNE_ctrl_i      : IN 	STD_LOGIC;
			Jump_ctrl_i     : IN 	STD_LOGIC;
        	zero_i 			: IN 	STD_LOGIC;	
			jr_flag_i       : IN 	STD_LOGIC;
		    rs_data_i		: IN	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			pc_o 			: OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			pc_plus4_o 		: OUT	STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
			instruction_o 	: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
			inst_cnt_o 		: OUT	STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
			INTA_i          : IN    STD_LOGIC;
			IntrAddr_i      : IN    STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0) 			
		);
	end component;
---------------------------------------------------------
	COMPONENT PLL port(
	    areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0     		: OUT STD_LOGIC ;
		locked		: OUT STD_LOGIC );
    END COMPONENT;
---------------------------------------------------------	
	COMPONENT Shifter IS
		GENERIC (n : INTEGER :=32;
				 k : INTEGER :=5); --k=log2(n)
		PORT(x,y : IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			 dir : IN STD_LOGIC;
			 cout : OUT STD_LOGIC;
			 res : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
	END COMPONENT;
---------------------------------------------------------
	COMPONENT BidirPin is
		generic( width: integer:=32 );
		port(   Dout: 	in 		std_logic_vector(width-1 downto 0);
				en:		in 		std_logic;
				Din:	out		std_logic_vector(width-1 downto 0);
				IOpin: 	inout 	std_logic_vector(width-1 downto 0)
		);
	end COMPONENT;
---------------------------------------------------------	
	COMPONENT SevenSegDecoder IS
	  PORT (data		: in STD_LOGIC_VECTOR (3 DOWNTO 0);
			seg   		: out STD_LOGIC_VECTOR (6 downto 0));
	END COMPONENT;
---------------------------------------------------------
	COMPONENT TriState is
		generic( width: integer:=32 );
		port(   Dout: 	in 		std_logic_vector(width-1 downto 0);
				en:		in 		std_logic;
				IOpin: 	out 	std_logic_vector(width-1 downto 0));
	end COMPONENT;	
---------------------------------------------------------
	COMPONENT GPIO IS
	  GENERIC (DATA_BUS_WIDTH : integer 	:= 32); 
	  PORT(MCLK_i                :IN  STD_LOGIC;
		   MemWrite_ctrl_i 	   :IN 	STD_LOGIC;
		   MemRead_ctrl_i      :IN 	STD_LOGIC;
		   SW7to0_i   : in std_logic_vector(7 downto 0);
		   DataBus_io   : inout std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
		   AddrBus_i   : in std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
		   HEX0_o,HEX1_o,HEX2_o,HEX3_o,HEX4_o,HEX5_o : out std_logic_vector(6 downto 0);
		   LEDR7to0_o : out std_logic_vector(7 downto 0)
			); 
	END COMPONENT;
---------------------------------------------------------
	COMPONENT MCU IS
	  GENERIC (DATA_BUS_WIDTH : integer := 32;
				WORD_GRANULARITY : boolean 	:= G_WORD_GRANULARITY;
				MODELSIM : integer 			:= G_MODELSIM;
				ITCM_ADDR_WIDTH : integer 	:= G_ADDRWIDTH;
				DTCM_ADDR_WIDTH : integer 	:= G_ADDRWIDTH;
				PC_WIDTH : integer 			:= 10;
				FUNCT_WIDTH : integer 		:= 6;
				DATA_WORDS_NUM : integer 	:= G_DATA_WORDS_NUM;
				CLK_CNT_WIDTH : integer 	:= 16;
				INST_CNT_WIDTH : integer 	:= 16
				); 
				
	  PORT(		rst_i,clk_i : in std_logic;         --rst is KEY0
				SW7to0_i    : in std_logic_vector(7 DOWNTO 0);
				HEX0_o,HEX1_o,HEX2_o,HEX3_o,HEX4_o,HEX5_o : out std_logic_vector(6 DOWNTO 0);
				LEDR7to0_o  : out std_logic_vector(7 DOWNTO 0);
				KEY3to1_i   : in std_logic_vector(2 DOWNTO 0);
				PWM_o       : out std_logic				
	); 
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT IntControl IS
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
	END COMPONENT;
---------------------------------------------------------	
	COMPONENT BasicTimer IS
	  GENERIC (DATA_BUS_WIDTH : integer := 32); 
	  PORT(rst_i,MCLK_i : in std_logic;         --rst is KEY0
		   MemWrite_ctrl_i 	   :in 	STD_LOGIC;
		   MemRead_ctrl_i      :in 	STD_LOGIC;
		   DataBus_io   : inout std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
		   AddrBus_i   : in std_logic_vector(DATA_BUS_WIDTH-1 downto 0);
		   PWM_o,BTIFG : out std_logic
			); 
	END COMPONENT;	
---------------------------------------------------------
	COMPONENT FIRfilter IS
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
	END COMPONENT;	
---------------------------------------------------------
	COMPONENT PLL2 IS
		PORT
		(
			areset		: IN STD_LOGIC  := '0';
			inclk0		: IN STD_LOGIC  := '0';
			c0		: OUT STD_LOGIC ;
			locked		: OUT STD_LOGIC 
		);
	END COMPONENT;	
end aux_package;

