---------------------------------------------------------------------------------------------
-- Copyright 2025 Hananya Ribo 
-- Advanced CPU architecture and Hardware Accelerators Lab 361-1-4693 BGU
---------------------------------------------------------------------------------------------
-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE work.const_package.all;


ENTITY control IS
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
END control;

ARCHITECTURE behavior OF control IS

	SIGNAL  rtype_w, lw_w, sw_w, beq_w, itype_imm_w,jump_w,jal_w,bne_w,lui_w,mul_w,jr_w : STD_LOGIC;

BEGIN           
				-- Code to generate control signals using opcode bits
	rtype_w 			<=  '1'	WHEN	opcode_i = R_TYPE_OPC  		ELSE '0';
	lw_w          		<=  '1'	WHEN  	opcode_i = LW_OPC  			ELSE '0';
 	sw_w          		<=  '1'	WHEN  	opcode_i = SW_OPC  			ELSE '0';
   	beq_w         		<=  '1'	WHEN  	opcode_i = BEQ_OPC  		ELSE '0';
	itype_imm_w			<=	'1'	WHEN	((opcode_i = ADDI_OPC) or 
										( opcode_i = ORI_OPC)  or 
										( opcode_i = ANDI_OPC) or 
										( opcode_i = ADDIU_OPC) or 
										( opcode_i = SLTI_OPC) or
										( opcode_i = XORI_OPC))		ELSE '0'; 
	jump_w              <=  '1' when    opcode_i = JUMP_OPC else '0';
	jal_w               <=  '1' when    opcode_i = JAL_OPC else '0';
	bne_w               <=  '1' when    opcode_i = BNE_OPC else '0';
	lui_w               <=  '1' when    opcode_i = LUI_OPC else '0';
	mul_w               <=  '1' when    opcode_i = MUL_OPC else '0';
	jr_w                <=  '1' when    opcode_i = R_TYPE_OPC and funct_i = "001000"  else '0';

	---------------- control signals ---------------------------------------------
		
  	RegDst_ctrl_o    	<=  "01" when (rtype_w='1') or (mul_w='1') ELSE
						    "10" when opcode_i = JAL_OPC else 
							"00";
	
 	ALUSrc_ctrl_o  		<=  lw_w OR sw_w or itype_imm_w;
	
	MemtoReg_ctrl_o 	<=  "01" when lw_w = '1' ELSE
							"10" when jal_w = '1' ELSE
							"00";
	
  	RegWrite_ctrl_o 	<=  (rtype_w and not jr_w) OR lw_w or itype_imm_w or jal_w or lui_w or mul_w;
  	MemRead_ctrl_o 		<=  lw_w;
   	MemWrite_ctrl_o 	<=  sw_w; 
 	Branch_ctrl_o      	<=  beq_w;
	Jump_ctrl_o         <=  jump_w or jal_w;
	BNE_ctrl_o          <=  bne_w;
	
	ALUOp_ctrl_o 		<=  "0000"      when rtype_w='1' else
							"0001"      when (opcode_i = ADDI_OPC) or (opcode_i = LW_OPC) or (opcode_i = SW_OPC) or (opcode_i = ADDIU_OPC) else 
							"0010"      when opcode_i = ORI_OPC else										
							"0011"      when opcode_i = ANDI_OPC else
							"0100"      when (opcode_i = BEQ_OPC) or (opcode_i = BNE_OPC) else
							"0101"      when opcode_i = SLTI_OPC else
							"0110"      when opcode_i = XORI_OPC else
							"0111"      when opcode_i = LUI_OPC else
							"1000"      when opcode_i = MUL_OPC else
							"1111";     --DEFAULT VALUE							
   END behavior;


