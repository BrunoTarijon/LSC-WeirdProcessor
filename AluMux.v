module AluMux (
	input [31:0] data1,
	input [24:0] data2,
	input op_num_code,
	output reg [31:0] out_data
	);
	
	always @(*)
	begin
		if(op_num_code == 0) out_data = data1;
		else out_data = data2;
	end
endmodule
