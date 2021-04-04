module Rom (
	input [(addr_width - 1):0] addr,
	output reg [(data_width - 1):0] out
	);
	
	parameter data_width = 32;
	parameter addr_width = 8;
	
	reg [(data_width - 1):0] memory [0:((2**addr_width)-1)];

	initial 
	begin
		$readmemb("rom_instructions_file.txt", memory);
	end
	
	always @ (*)
	begin
		out <= memory[addr];
	end
endmodule
