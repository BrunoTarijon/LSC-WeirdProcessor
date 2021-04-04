`include "Pc.v"
`include "Rom.v"
`include "InstructionControl.v"
`include "RegBank.v"
`include "AluMux.v"
`include "Alu.v"
`include "Ram.v"
`include "MemoryControl.v"
`include "JumpControl.v"
`include "DebugOut.v"

module Processor (
	input clk,
	input reset,
	output [31:0] processor_out,
	output [31:0] instruction
	);
	
	wire [7:0] next_addr, pc;
	wire [31:0] instruction;
	wire [4:0] op_code;
	wire num_op_code;
	wire [4:0] reg1, reg2, reg3;
	wire [24:0] immediate;
	wire reg_pw;
	wire  [31:0] reg_write_data;
	wire [31:0] reg_data1, reg_data2;
	wire [31:0]alu_in2;
	wire [31:0] alu_result;
	wire [7:0] ram_read_addr2, ram_write_addr2;
	wire [31:0] ram_write_data2;
	wire ram_pw1, ram_pw2;
	wire [31:0] ram_read_data2, ram_read_data1;
	
	Pc program_counter (
		next_addr,
		reset,
		clk,
		pc
	);
	
	Rom rom (
		pc,
		instruction
	);
	
	
	InstructionControl instruction_control(
		instruction,
		op_code,
		num_op_code,
		reg1, reg2, reg3,
		immediate
	);
	
	RegBank reg_bank(
		reset,
		clk,
		reg_pw,
		reg1,
		reg_write_data,
		reg2, reg3,
		reg_data1, reg_data2
	);


	AluMux alu_mux(
		reg_data2,
		immediate,
		num_op_code,
		alu_in2
	);
	
	Alu alu (
		op_code,
		reg_data1, 
		alu_in2,
		alu_result
	);
	
	 
	Ram ram (
		reg_data1[7:0],
		ram_read_addr2,
		reg_data1[7:0],
		ram_write_addr2,
		alu_result,
		ram_write_data2,
		clk, ram_pw1, ram_pw2,
		ram_read_data1,
		ram_read_data2
	);
	
	MemoryControl memory_control(
		op_code,
		alu_result,
		ram_read_data1,
		reg_write_data,
		reg_pw, ram_pw1
	);

	JumpControl jump_control (
		clk,
		op_code, 
		pc,
		immediate[7:0],
		reg_data1[0],
		next_addr
	);

	DebugOut debug_out(
		ram_read_data2,
		ram_read_addr2,
		ram_pw2,
		ram_write_addr2,
		ram_write_data2,
		processor_out
	);

endmodule	
