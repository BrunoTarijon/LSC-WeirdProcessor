module Ram (
	input[(addr_width - 1):0] read_addr1,
	input[(addr_width - 1):0] read_addr2,
	input[(addr_width - 1):0] write_addr1,
	input[(addr_width - 1):0] write_addr2,
	input[(data_width - 1):0] write_data1,
	input[(data_width - 1):0] write_data2,
	input clk, pw1, pw2,
	output [(data_width - 1):0] read_data1,
	output [(data_width - 1):0] read_data2
	);

	parameter addr_width = 8;
	parameter data_width = 32;

	reg [(data_width - 1):0] memory [(2**addr_width - 1):0];
	
	assign read_data1 = memory[read_addr1];
	assign read_data2 = memory[read_addr2];
	
	always @ (negedge clk)
	begin
		if ( pw1 ) memory [write_addr1] = write_data1;
		if ( pw2 ) memory [write_addr2] = write_data2;
	end
endmodule
