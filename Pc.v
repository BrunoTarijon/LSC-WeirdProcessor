module Pc (
	input [7:0] new_addr,
	input reset,
	input clk,
	output reg [7:0] addr
	);
	
	always @(posedge clk)
	begin
		if(reset == 1) addr = 0;
		else addr = new_addr;
	end
	
endmodule
