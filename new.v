`include "alu_64.v"
`include "regfile_64.v"
module clu_64(a,b,opcode,out1,out2,cf,zf);
input [63:0]a,b;
input [31:0]opcode;
output [63:0]out1,out2;
output cf,zf;
wire [63:0]in1,in2,in3,in4;
regfile_64 rf0(a,in1,opcode[1:0],opcode[14:10]);
regfile_64 rf0(b,in2,opcode[3:2],opcode[19:15]);

regfile_64 rf0(out1,in3,2'b11,opcode[24:20]);
regfile_64 rf0(out2,in4,2'b11,opcode[29:25]);
endmodule

