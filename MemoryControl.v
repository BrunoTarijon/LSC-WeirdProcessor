module MemoryControl (
	input [4:0] op,
	input [31:0] data_alu,
	input [31:0] data_ram,
	output reg [31:0] data_reg,
	output reg reg_write, ram_write
	);

	always @ (*)
	begin
		reg_write = 0;
		ram_write = 0;
	
		if ( op == 5'b11000) // Load
		begin
			reg_write = 1;
			data_reg = data_ram;
		end
		
		else if (op == 5'b11001) // Store
			ram_write = 1 ;
		
		else if (op[4] == 0)// All ALU operations
		begin
			reg_write = 1;
			data_reg = data_alu;
		end
	end

endmodule
