module RegBank(
    input reset,
    input clk,
    input pw, //Permission to write
    input [4:0] write_addr,
    input [31:0] write_data,
    input [4:0] read_addr1, read_addr2,
    output[31:0] data1, data2
    );

    reg[31:0] data [19:0];
    integer i;

    assign data1=data[read_addr1];
    assign data2=data[read_addr2];

    always @(negedge clk)
    begin
        if (reset==1)
        begin
            for (i=0;i<=19;i=i+1)
            begin
                data[i]=0;
            end            
        end
        else if(pw==1 && (write_addr!=0)) data[write_addr]=write_data;
    end

endmodule
