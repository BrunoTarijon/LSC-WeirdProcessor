module Alu (
    input [4:0]op_code,
    input [31:0]data1, 
    input [31:0]data2,
    output [31:0]result
    );
    reg [31:0]result_reg;
    
    //Definitions
    localparam [4 : 0]
        ADD  = 'h0,
        SUB  = 'h1,  
        OR   = 'h2,
        AND  = 'h3,
        SG   = 'h4,
        SL   = 'h5,
        SE   = 'h6,
        MULT = 'h7,
        DIV  = 'h8,
        MOD  = 'h9,
        NOT  = 'h10,
        SW   = 'h19,
        JL   = 'h12;
    //END Definition

    always @(*)
    begin
        case (op_code)
		ADD:result_reg=data1+data2;			
		SUB:result_reg=data1-data2;			
		OR: result_reg=data1 || data2;			
		AND:result_reg=data1 & data2;
		
		SG://Set great
		begin
			if(data1>data2) result_reg=1;
			else result_reg=0;
		end
		
		SL://Set less
		begin
			if(data1<data2) result_reg=1;
			else result_reg=0;
		end
		
		SE://Set equal
		begin
			if(data1==data2) result_reg=1;
			else result_reg=0;
		end
		
		MULT:result_reg=data1*data2;			
		DIV:result_reg=data1/data2;			
		MOD:result_reg=data1%data2;					
		NOT:result_reg=!data1;
		SW: result_reg=data2;
		default:result_reg=0;
        endcase
    end
    assign result= result_reg;

endmodule
