# WeirdProcessor

## Architecture

WeirdProcessor works with 32 bits and is based on MIPS.

## ISA

|Formato da instrução | OPCode | Obs     |
|---------------------|--------|---------|
| ADD A,B,C           | 6'b000000        | A<-B+C |
| SUB A,B,C           | 6'b000010        | A<-B-C |
| OR A,B,C            | 6'b000100        | A<-B or C |
| AND A,B,C           | 6'b000110        | A<-B and C|
| SG A,B,C            | 6'b001000        | Set Great |
| SL A,B,C            | 6'b001010        | Set Less  |
| SE A,B,C            | 6'b001100        | Set Equal |
| MULT A,B,C          | 6'b001110        | A<-B*C |
| DIV A,B,C           | 6'b010000        | A<-B/C |
| MOD A,B,C           | 6'b010010        | A<-B%C |
| NOP                 | 6'b100000        | - |
| NOT A, B            | 6'b100010        | A<-!B |
| BZ I                | 6'b100110        | Branch Zero; Branch use the (10011) register to compare |
| B I                 | 6'b101000        | Branch; Branch use the (10011) register to compare |
| J I                 | 6'b101010        | Jump to I address |
| LW A,B              | 6'b110000        | Load A addr B value |
| SW A,B              | 6'b110010        | Store A addr B value (Can use immediate)|

You can change (to 1) the final bit, left->right, of the OPCode to use immediate.

## Instruction Types

|  Type | Reg1 		   |       Reg2		 | 	Reg3		| Immediate |
|-------|------------------|---------------------|----------------------|-----------|
|  ULA	|Writing reg[25:21]|Operation reg1[20:16]|Operation reg2[15:11] |  [15:0]   |
|  NOP	| NULL		   |NULL		 |	NULL		|NULL	    |
|  NOT	|Writing reg[25:21]|Operation reg[20:16] |NULL			|NULL	    |
| Jump	|NULL		   |Branch reg 10011	 |NULL			|[24:0]	    |
| Memory|Writing reg[25:21]|RAM addr[20:16]	 |Data reg[15:11]	|NULL	    |

## Register Bank

The bank have 20 registers
| TAG          | Number   | Addr     |
|--------------|------------|-----------------------|
| \$zero       | 1          | 5'b00000              |
| General      | 19         | \[5'b00001,5'b10011\] |
