onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group tb /mcu_tb/rst_tb_i
add wave -noupdate -group tb /mcu_tb/clk_tb_i
add wave -noupdate -group tb /mcu_tb/SW7to0_i
add wave -noupdate -group tb /mcu_tb/LEDR7to0_o
add wave -noupdate -group tb /mcu_tb/HEX0_o
add wave -noupdate -group tb /mcu_tb/HEX1_o
add wave -noupdate -group tb /mcu_tb/HEX2_o
add wave -noupdate -group tb /mcu_tb/HEX3_o
add wave -noupdate -group tb /mcu_tb/HEX4_o
add wave -noupdate -group tb /mcu_tb/HEX5_o
add wave -noupdate -group tb /mcu_tb/PWM_o
add wave -noupdate -group tb /mcu_tb/KEY3to1_i
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/rst_i
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/clk_i
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/SW7to0_i
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/HEX0_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/HEX1_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/HEX2_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/HEX3_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/HEX4_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/HEX5_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/LEDR7to0_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/KEY3to1_i
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/PWM_o
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/pc_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/alu_result_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/read_data1_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/read_data2_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/write_data_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/instruction_top_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/DataBus_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/Branch_ctrl_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/Jump_ctrl_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/Zero_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/MemWrite_ctrl_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/MemRead_ctrl_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/RegWrite_ctrl_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/mclk_cnt_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/inst_cnt_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/KEY3to1_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/IRQ_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/INTA_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/GIE_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/INTR_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/BTIFQ_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/MCLK_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/FIRCLK_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/FIFOEMPTY_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/FIROUT_w
add wave -noupdate -group mcu /mcu_tb/MCU_Inst/MCLK_div
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/rst_i
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MCLK_i
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/pc_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/alu_result_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/read_data1_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/read_data2_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/write_data_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/instruction_top_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/Branch_ctrl_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/Jump_ctrl_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/Zero_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MemWrite_ctrl_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MemRead_ctrl_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/RegWrite_ctrl_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/mclk_cnt_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/inst_cnt_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/DataBus_io
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/INTA_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/GIE_o
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/INTR_i
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/pc_plus4_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/read_data1_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/read_data2_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/sign_extend_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/addr_res_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/alu_result_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/dtcm_data_rd_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/read_data_final
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/alu_src_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/branch_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/bne_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/jump_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/reg_dst_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/reg_write_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/zero_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/mem_write_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/DTCM_mem_write_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MemtoReg_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/mem_read_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/alu_op_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/instruction_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/mclk_cnt_q
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/inst_cnt_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/jr_flag
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/rs_data
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/rst_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/BidPinEN
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/DataBus_in_w
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/DTCM_addr_int_supp
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/INTA_Reg_Q
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/DTCM_MemRead_int_supp
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MIPSBidPin/Dout
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MIPSBidPin/en
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MIPSBidPin/Din
add wave -noupdate -group mips /mcu_tb/MCU_Inst/CORE/MIPSBidPin/IOpin
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/clk_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/rst_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/add_result_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/Branch_ctrl_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/BNE_ctrl_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/Jump_ctrl_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/zero_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/jr_flag_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/rs_data_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/pc_o
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/pc_plus4_o
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/instruction_o
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_cnt_o
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/INTA_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/IntrAddr_i
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/pc_q
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/pc_plus4_r
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/itcm_addr_w
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/next_pc_w
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/next_pc0_w
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/next_pc_final_w
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/next_pc_int_supp
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/instruction_j_aux
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/rst_flag_q
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_cnt_q
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/pc_prev_q
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/wren_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/wren_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/rden_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/rden_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/data_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/data_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/address_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/address_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/clock0
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/clock1
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/clocken0
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/clocken1
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/clocken2
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/clocken3
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/aclr0
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/aclr1
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/addressstall_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/addressstall_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/byteena_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/byteena_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/q_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/q_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/eccstatus
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_data_reg_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_data_reg_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_reg_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_tmp_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_tmp2_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_tmp_wren_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_tmp2_wren_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_tmp_wren_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_reg_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_tmp_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_tmp2_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_output_latch
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_ecc_reg_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_q_ecc_tmp_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_current_written_data_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_original_data_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_original_data_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_a_x
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_b_x
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_a_out
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_b_out
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_address_reg_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_address_reg_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_wren_reg_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_wren_reg_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_rden_reg_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_rden_reg_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_read_flag_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_read_flag_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_reread_flag_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_reread_flag_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_reread_flag2_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_reread_flag2_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_write_flag_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_write_flag_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_nmram_write_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_nmram_write_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_indata_aclr_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_address_aclr_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_wrcontrol_aclr_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_indata_aclr_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_address_aclr_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_wrcontrol_aclr_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_outdata_aclr_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_outdata_aclr_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_rdcontrol_aclr_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_aclr_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_byteena_aclr_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/good_to_go_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/good_to_go_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_core_clocken_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_core_clocken_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_core_clocken_b0
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_core_clocken_b1
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_inclocken0
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_input_clocken_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_outdata_clken_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_outdata_clken_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_outlatch_clken_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_outlatch_clken_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_core_clocken_a_reg
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_core_clocken_b_reg
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/default_val
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_data_zero_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_data_zero_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_data_ones_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_data_ones_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/same_clock_pulse0
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/same_clock_pulse1
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_force_reread_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_force_reread_a1
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_force_reread_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_force_reread_b1
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_force_reread_signal_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_force_reread_signal_b
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_good_to_write_a
add wave -noupdate -group ifetch /mcu_tb/MCU_Inst/CORE/IFE/inst_memory/i_good_to_write_b
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/clk_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/rst_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/instruction_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/dtcm_data_rd_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/alu_result_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/RegWrite_ctrl_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/MemtoReg_ctrl_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/RegDst_ctrl_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/pc_plus4_r
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/read_data1_o
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/read_data2_o
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/sign_extend_o
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/GIE_o
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/INTR_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/INTA_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/pc_i
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/RF_q
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/write_reg_addr_w
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/write_reg_data_w
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/rs_register_w
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/rt_register_w
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/rd_register_w
add wave -noupdate -group idecode /mcu_tb/MCU_Inst/CORE/ID/imm_value_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/opcode_i
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/funct_i
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/RegDst_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/ALUSrc_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/MemtoReg_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/RegWrite_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/MemRead_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/MemWrite_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/Branch_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/BNE_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/Jump_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/ALUOp_ctrl_o
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/rtype_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/lw_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/sw_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/beq_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/itype_imm_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/jump_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/jal_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/bne_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/lui_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/mul_w
add wave -noupdate -group control /mcu_tb/MCU_Inst/CORE/CTL/jr_w
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/read_data1_i
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/read_data2_i
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/sign_extend_i
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/funct_i
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/ALUOp_ctrl_i
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/ALUSrc_ctrl_i
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/pc_plus4_i
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/zero_o
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/alu_res_o
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/addr_res_o
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/jr_flag_o
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/rs_data_o
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/a_input_w
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/b_input_w
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/alu_out_mux_w
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/branch_addr_r
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/alu_ctl_w
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/shifter_dir
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/shifter_cout
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/shifter_out
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/Shftr/x
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/Shftr/y
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/Shftr/dir
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/Shftr/cout
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/Shftr/res
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/Shftr/mat
add wave -noupdate -group execute /mcu_tb/MCU_Inst/CORE/EXE/Shftr/c
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/clk_i
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/rst_i
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/dtcm_addr_i
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/dtcm_data_wr_i
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/MemRead_ctrl_i
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/MemWrite_ctrl_i
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/dtcm_data_rd_o
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/wrclk_w
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/wren_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/wren_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/rden_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/rden_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/data_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/data_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/address_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/address_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/clock0
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/clock1
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/clocken0
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/clocken1
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/clocken2
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/clocken3
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/aclr0
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/aclr1
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/addressstall_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/addressstall_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/byteena_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/byteena_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/q_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/q_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/eccstatus
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_data_reg_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_data_reg_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_reg_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_tmp_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_tmp2_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_tmp_wren_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_tmp2_wren_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_tmp_wren_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_reg_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_tmp_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_tmp2_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_output_latch
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_ecc_reg_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_q_ecc_tmp_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_current_written_data_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_original_data_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_original_data_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a_x
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b_x
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a_out
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b_out
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_address_reg_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_address_reg_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_wren_reg_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_wren_reg_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_rden_reg_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_rden_reg_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_read_flag_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_read_flag_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_reread_flag_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_reread_flag_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_reread_flag2_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_reread_flag2_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_write_flag_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_write_flag_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_nmram_write_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_nmram_write_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_indata_aclr_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_address_aclr_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_wrcontrol_aclr_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_indata_aclr_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_address_aclr_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_wrcontrol_aclr_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_outdata_aclr_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_outdata_aclr_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_rdcontrol_aclr_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_aclr_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_byteena_aclr_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/good_to_go_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/good_to_go_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_core_clocken_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_core_clocken_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_core_clocken_b0
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_core_clocken_b1
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_inclocken0
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_input_clocken_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_outdata_clken_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_outdata_clken_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_outlatch_clken_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_outlatch_clken_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_core_clocken_a_reg
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_core_clocken_b_reg
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/default_val
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_data_zero_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_data_zero_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_data_ones_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_data_ones_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/same_clock_pulse0
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/same_clock_pulse1
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_force_reread_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_force_reread_a1
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_force_reread_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_force_reread_b1
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_force_reread_signal_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_force_reread_signal_b
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_good_to_write_a
add wave -noupdate -group memory /mcu_tb/MCU_Inst/CORE/G1/MEM/data_memory/i_good_to_write_b
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/MemWrite_ctrl_i
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/MemRead_ctrl_i
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/SW7to0_i
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/DataBus_io
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/AddrBus_i
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_o
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_o
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_o
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_o
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_o
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_o
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_o
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/CS
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/Addr11_6to1_w
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_Lat_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_BidirPin_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_Lat_Q
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_Lat_D
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_Lat_Q_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_Lat_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_BidirPin_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_Lat_D
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_Lat_Q_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_Lat_Q
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_Lat_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_BidirPin_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_Lat_D
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_Lat_Q_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_Lat_Q
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_Lat_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_BidirPin_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_Lat_D
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_Lat_Q_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_Lat_Q
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_Lat_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_BidirPin_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_Lat_D
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_Lat_Q_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_Lat_Q
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_Lat_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_BidirPin_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_Lat_D
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_Lat_Q_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_Lat_Q
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_Lat_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_BidirPin_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_Lat_D
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_Lat_Q_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_Lat_Q
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/SW7to0_TriState_EN
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/SW7to0_ext
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_BidirPin/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_BidirPin/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_BidirPin/Din
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/LEDR7to0_BidirPin/IOpin
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_BidirPin/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_BidirPin/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_BidirPin/Din
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_BidirPin/IOpin
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_7segD/data
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX0_7segD/seg
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_BidirPin/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_BidirPin/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_BidirPin/Din
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_BidirPin/IOpin
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_7segD/data
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX1_7segD/seg
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_BidirPin/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_BidirPin/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_BidirPin/Din
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_BidirPin/IOpin
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_7segD/data
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX2_7segD/seg
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_BidirPin/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_BidirPin/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_BidirPin/Din
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_BidirPin/IOpin
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_7segD/data
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX3_7segD/seg
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_BidirPin/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_BidirPin/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_BidirPin/Din
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_BidirPin/IOpin
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_7segD/data
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX4_7segD/seg
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_BidirPin/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_BidirPin/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_BidirPin/Din
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_BidirPin/IOpin
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_7segD/data
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/HEX5_7segD/seg
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/SW7to0_TriState/Dout
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/SW7to0_TriState/en
add wave -noupdate -group gpio /mcu_tb/MCU_Inst/GPIO_Inst/SW7to0_TriState/IOpin
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/clk_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/rst_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IRQ_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/INTA_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/GIE_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/MemWrite_ctrl_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/MemRead_ctrl_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/DataBus_io
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/AddrBus_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/INTR_o
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/KEY3to1_i
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/CS
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/Addr11_6to0_w
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_Reg_EN
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_BidirPin_EN
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_Reg_D
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_Reg_Q_ext
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_Reg_Q
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_Reg_EN
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_BidirPin_EN
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_Reg_Q_ext
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_Reg_Q
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/TYPE_TriState_EN
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/TYPE_ext
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_fromDataBus
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/TYPE_Reg_D
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/TYPE_Reg_Q
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IRQ_Reg_Q
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_Reg_D
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/clr_irq
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IntTrig
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/KEY3to1_TriState_EN
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/KEY3to1_ext
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_BidirPin/Dout
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_BidirPin/en
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_BidirPin/Din
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IE_BidirPin/IOpin
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_BidirPin/Dout
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_BidirPin/en
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_BidirPin/Din
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/IFG_BidirPin/IOpin
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/TYPE_TriState/Dout
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/TYPE_TriState/en
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/TYPE_TriState/IOpin
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/KEY3to1_TriState/Dout
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/KEY3to1_TriState/en
add wave -noupdate -group {interrupt control} /mcu_tb/MCU_Inst/IntControl_Inst/KEY3to1_TriState/IOpin
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/rst_i
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/MCLK_i
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/MemWrite_ctrl_i
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/MemRead_ctrl_i
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/DataBus_io
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/AddrBus_i
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/PWM_o
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTIFG
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNT
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCL0
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCL1
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNT_fromDataBus
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/rst_timer
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/HEU0
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCLK
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/MCLK_2
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/MCLK_4
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/MCLK_8
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNTeq0
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNT_BidirPin_EN
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/MCLK_div
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/CS
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/Addr11_6to0_w
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_BidirPin_EN
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_Reg_D
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_Reg_Q_ext
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_Reg_Q
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR0_BidirPin_EN
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR0_Reg_D
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR0_Reg_Q
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR1_BidirPin_EN
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR1_Reg_D
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR1_Reg_Q
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTHOLD
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCLR
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTOUTEN
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTOUTMD
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTSSELx
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTIPx
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_BidirPin/Dout
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_BidirPin/en
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_BidirPin/Din
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCTL_BidirPin/IOpin
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR0_BidirPin/Dout
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR0_BidirPin/en
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR0_BidirPin/Din
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR0_BidirPin/IOpin
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR1_BidirPin/Dout
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR1_BidirPin/en
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR1_BidirPin/Din
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCCR1_BidirPin/IOpin
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNT_BidirPin/Dout
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNT_BidirPin/en
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNT_BidirPin/Din
add wave -noupdate -group {basic timer} /mcu_tb/MCU_Inst/BasicTimer_Inst/BTCNT_BidirPin/IOpin
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/rst_i
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/MCLK_i
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCLK_i
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/MemWrite_ctrl_i
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/MemRead_ctrl_i
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/DataBus_io
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/AddrBus_i
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIFOEMPTY_o
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIROUT_o
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/CS
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/Addr11_6to0_w
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_Reg_Q
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_Reg_Q_aux
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_Reg_D
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_Reg_Q_ext
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_BidirPin_EN
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRIN_BidirPin_EN
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRIN_Reg_D
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRIN_Reg_Q
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIROUT_TriState_EN
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIROUT_Reg_Q
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF3_0_BidirPin_EN
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF3_0_Reg_D
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF3_0_Reg_Q
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF7_4_BidirPin_EN
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF7_4_Reg_D
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF7_4_Reg_Q
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIFO_Inst
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/wr_ptr
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/rd_ptr
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/count
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/data_out_reg
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus1
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus2
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus3
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus4
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus5
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus6
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus7
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIFOEMPTY_D
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIFOFULL_D
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/toggle_A
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/sync_ff1
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/sync_ff2
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/sync_ff3
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIFOREN
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/y_n
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus1_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus2_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus3_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus4_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus5_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus6_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/x_n_minus7_mult
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_BidirPin/Dout
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_BidirPin/en
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_BidirPin/Din
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRCTL_BidirPin/IOpin
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRIN_BidirPin/Dout
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRIN_BidirPin/en
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRIN_BidirPin/Din
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIRIN_BidirPin/IOpin
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIROUT_TriState/Dout
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIROUT_TriState/en
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/FIROUT_TriState/IOpin
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF3_0_BidirPin/Dout
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF3_0_BidirPin/en
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF3_0_BidirPin/Din
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF3_0_BidirPin/IOpin
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF7_4_BidirPin/Dout
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF7_4_BidirPin/en
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF7_4_BidirPin/Din
add wave -noupdate -expand -group fir /mcu_tb/MCU_Inst/FIR_Inst/COEF7_4_BidirPin/IOpin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {424857534 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 366
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {400200 ns} {484200 ns}
