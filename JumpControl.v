module JumpControl (
	input clk,
	input [4:0] op, //opcode without the last bit (lef->right)
	input [7:0] pc,
	input [7:0] jump_addr,
	input branch_res,
	output reg [7:0] next_addr
	);
	
	always @ (negedge clk)
	begin
		case (op)
			5'b10011://BZ - Branch Zero
			begin
				if(branch_res == 0) next_addr = jump_addr;
				
				else next_addr = pc + 1;
			end
			
			5'b10100://B - Branch One
			begin
				if(branch_res == 1) next_addr = jump_addr;

				else next_addr = pc + 1;
			end
			
			5'b10101://Jump
			begin
				next_addr = jump_addr;
			end

			//5'bx://Initialization
			//begin
			//	next_addr = 0;
			//end
		
			default:
			begin
				next_addr = pc + 1;
			end
		endcase
	end
endmodule


	
