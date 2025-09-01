LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.cond_comilation_package.all;
USE work.aux_package.all;

-------------------------------------
ENTITY MCU IS
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
END MCU;
-----------------------------------------------
ARCHITECTURE MCU OF MCU IS 
signal pc_w : STD_LOGIC_VECTOR(PC_WIDTH-1 DOWNTO 0);
signal alu_result_w,read_data1_w,read_data2_w,write_data_w,instruction_top_w,DataBus_w : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
signal Branch_ctrl_w,Jump_ctrl_w,Zero_w,MemWrite_ctrl_w,MemRead_ctrl_w,RegWrite_ctrl_w : std_logic;
signal mclk_cnt_w : STD_LOGIC_VECTOR(CLK_CNT_WIDTH-1 DOWNTO 0);
signal inst_cnt_w : STD_LOGIC_VECTOR(INST_CNT_WIDTH-1 DOWNTO 0);
signal KEY3to1_w  : std_logic_vector(2 DOWNTO 0) ;
signal IRQ_w      : std_logic_vector(7 downto 0);
signal INTA_w,GIE_w,INTR_w,BTIFQ_w,MCLK_w,FIRCLK_w,FIFOEMPTY_w,FIROUT_w,rst_w     : std_logic; 
signal MCLK_div : std_logic_vector(8 DOWNTO 0);                     
begin
	G_KEY3to1:
	if MODELSIM = 1 generate
		KEY3to1_w <= KEY3to1_i;
		rst_w <= rst_i;
	end generate;

	G_KEY3to1_NOT:
	if MODELSIM = 0 generate
		KEY3to1_w <= not KEY3to1_i;
		rst_w <= not rst_i;
	end generate;

	-- connect the PLL component
	G0:
	if (MODELSIM = 0) generate
	  MCLK: PLL
		PORT MAP (
			inclk0 	=> clk_i,
			c0 		=> MCLK_w
		);
	  FIRCLK: PLL2
		PORT MAP (
			inclk0 	=> clk_i,
			c0 		=> FIRCLK_w
		);
		
	else generate
		MCLK_w <= clk_i;
		process (MCLK_w,rst_w)
		BEGIN
		if(rst_w='1') THEN
			MCLK_div <= (others => '0');
		elsif (rising_edge(MCLK_w)) then	   
			MCLK_div <= MCLK_div + 1;
		end if;
		end process;

		FIRCLK_w <= MCLK_div(8);
		end generate;
	
CORE : MIPS 
	generic map( 
			WORD_GRANULARITY => G_WORD_GRANULARITY,
	        MODELSIM 		 => G_MODELSIM,
			DATA_BUS_WIDTH   => 32,
			ITCM_ADDR_WIDTH	 => G_ADDRWIDTH,
			DTCM_ADDR_WIDTH	 => G_ADDRWIDTH,
			PC_WIDTH		 => 10,
			FUNCT_WIDTH		 => 6,
			DATA_WORDS_NUM   => G_DATA_WORDS_NUM,
			CLK_CNT_WIDTH	 => 16,
			INST_CNT_WIDTH   => 16
	)
	PORT MAP(rst_i		 		=> rst_w,
			MCLK_i				=> MCLK_w,
			-- Output important signals to pins for easy display in SignalTap
			pc_o				=> pc_w,
			alu_result_o 		=> alu_result_w,
			read_data1_o 		=> read_data1_w,
			read_data2_o 		=> read_data2_w,
			write_data_o		=> write_data_w,
			instruction_top_o	=> instruction_top_w,
			Branch_ctrl_o		=> Branch_ctrl_w,
			Jump_ctrl_o         => Jump_ctrl_w,
			Zero_o				=> Zero_w,
			MemWrite_ctrl_o		=> MemWrite_ctrl_w,
			MemRead_ctrl_o      => MemRead_ctrl_w,
			RegWrite_ctrl_o		=> RegWrite_ctrl_w,
			mclk_cnt_o			=> mclk_cnt_w,
			inst_cnt_o 			=> inst_cnt_w,
			DataBus_io          => DataBus_w,
			INTA_o              => INTA_w,
			GIE_o               => GIE_w,
			INTR_i              => INTR_w
	);
	
GPIO_Inst : GPIO 
	  PORT MAP (MCLK_i             =>	MCLK_w,
			   MemWrite_ctrl_i   => MemWrite_ctrl_w,
			   MemRead_ctrl_i    => MemRead_ctrl_w,
			   SW7to0_i   	     => SW7to0_i,
			   DataBus_io        => DataBus_w,
			   AddrBus_i   		 => alu_result_w,
			   HEX0_o			 => HEX0_o,	
			   HEX1_o			 => HEX1_o,
			   HEX2_o			 => HEX2_o,
			   HEX3_o			 => HEX3_o,
			   HEX4_o			 => HEX4_o,
			   HEX5_o			 => HEX5_o,
			   LEDR7to0_o 	     => LEDR7to0_o
				); 	

IRQ_w <= FIROUT_w&FIFOEMPTY_w&KEY3to1_w&BTIFQ_w&"00"; 

IntControl_Inst : IntControl
		PORT MAP(clk_i => MCLK_w,
				 rst_i => rst_w,
				 IRQ_i => IRQ_w,
				 INTA_i => INTA_w,
				 GIE_i => GIE_w, 
				 MemWrite_ctrl_i => MemWrite_ctrl_w,
				 MemRead_ctrl_i => MemRead_ctrl_w,
				 DataBus_io => DataBus_w,
				 AddrBus_i => alu_result_w,
				 INTR_o => INTR_w,
				 KEY3to1_i => KEY3to1_w
				 );
				 
BasicTimer_Inst : BasicTimer 
		PORT MAP(rst_i => rst_w,
				 MCLK_i => MCLK_w,
				 MemWrite_ctrl_i => MemWrite_ctrl_w,
				 MemRead_ctrl_i => MemRead_ctrl_w,
				 DataBus_io => DataBus_w,
				 AddrBus_i => alu_result_w,
				 PWM_o => PWM_o,
				 BTIFG => BTIFQ_w
				 );

FIR_Inst    : FIRfilter 
		PORT MAP(rst_i => rst_w,
				MCLK_i => MCLK_w,
				FIRCLK_i => FIRCLK_w,
				MemWrite_ctrl_i => MemWrite_ctrl_w,
				MemRead_ctrl_i => MemRead_ctrl_w,
				DataBus_io => DataBus_w,
				AddrBus_i => alu_result_w,
				FIFOEMPTY_o => FIFOEMPTY_w,
                FIROUT_o => FIROUT_w
			 );				
				 
				 
				 
END MCU;
