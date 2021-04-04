`timescale 1ns / 1ns
`include "Processor.v"

module Processor_tb;
	reg clk;
	reg reset;
	wire [31:0] processor_out;
	wire [31:0] instruction;

	Processor processor(.clk(clk), .reset(reset), 
			.processor_out(processor_out),
			.instruction(instruction)
	);
	
	always #5 clk = ~clk;
	
	initial
	begin
		$dumpfile("processor_out.vcd");
		$dumpvars(0,Processor_tb);
		clk = 0;
		reset = 1;#10;
	
		reset = 0;
		#1000;

		$display ("out = %d", processor_out);
		$finish;
	end
endmodule
