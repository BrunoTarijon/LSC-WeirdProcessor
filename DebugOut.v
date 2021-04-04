module DebugOut (
	input [31:0] read_data,
	output [7:0] read_addr,
	output pw_inout,
	output [7:0] write_addr,
	output [31:0] write_data,
	output [31:0] show_data
	);
	
	assign show_data = read_data;
	assign read_addr = 0;
	assign write_data = 0;
	assign write_addr = 0;
	assign pw_inout = 0;
		
endmodule
