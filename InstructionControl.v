module InstructionControl (
	input [31:0] instruction,
	output reg [4:0] op_code,
	output reg num_op_code,
	output reg [4:0] reg1, reg2, reg3,
	output reg [24:0] immediate
	);
	
	always @ (*)
	begin
		if (instruction[31] == 0) // Reg-Reg/Reg-I type
		begin
			op_code = instruction[31:27];
			
			num_op_code = instruction[26];
			
			reg1 = instruction[25:21];
			reg2 = instruction[20:16];
			reg3 = instruction[15:11];
			immediate = instruction[15:0];
		end

		else if (instruction[31:27] == 5'b10000) // Not type
		begin
			op_code = instruction[31:27];
			
			num_op_code = 0;
			
			reg1 = instruction[25:21];
			reg2 = instruction[20:16];
			reg3 = 0;
			immediate = 0;
		end
		
		else if (instruction[31:27] == 5'b10001) // NOP type
		begin
			op_code = instruction[31:27];
			
			num_op_code = 0;
			
			reg1 = 0;
			reg2 = 0;
			reg3 = 0;
			immediate = 0;
		end
		
		else if (instruction[31:27] >= 5'b10010 & instruction[31:27] <= 5'b10101) // jump-branch type
		begin
			op_code = instruction[31:27];
			
			num_op_code = 0;
			
			reg1 = 0; // dont write in any reg
			reg2 = 5'b10011;// reg num 20 from set instruction
			reg3 = 0;
			immediate = instruction[24:0];//addr to jump
		end

		else if (instruction[31:27] >= 5'b11000 ) // memory type
		begin
			op_code = instruction[31:27];
			
			num_op_code = 0;
			
			reg1 = instruction[25:21]; // reg addr (to write in bank)
			reg2 = instruction[20:16]; // reg with addr to write/read
			reg3 = instruction[15:11]; // reg with data to write
			immediate = 0;
		end
	end
endmodule



