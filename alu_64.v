`include "and_64.v" //and
`include "or_64.v"  //or
`include "xor_64.v" //xor
`include "not_64.v" //not*/
`include "tscomp_64.v"  //2s comp
`include "cla_64.v" //adder/subtractor
`include "mult_64.v" //multiplication
`include "fpadd_64.v" //floating point adder/subtractor
`include "fmult_64.v" //floating point multiplication
`include "shift_64.v" //shift
`include "mov_64.v" //move
`include "swap_64.v" //swap
`include "equal_64.v" //comparison
//`include "dff.v"
module alu_64(a,b,out,out1,opcode,cf,zf);
input [63:0]a,b; //input
input [3:0]opcode; //opcode
output [63:0]out; //output 1 (primary)
output [63:0]out1; //output 2
output cf,zf; //flags
reg [63:0]out; 
reg [63:0]out1;
reg cf,zf;
reg [63:0]k1,k2;
wire [63:0]k3[0:16];
wire [63:0]k5;
wire [127:0]k4;
wire cout;
reg clk;
wire [3:0]opcode0,opcode1,opcode2,opcode3,opcode4,opcode5,opcode6;
and_64 and0(a,b,k3[0],clk);
or_64 or0(a,b,k3[1],clk);
xor_64 xor0(a,b,k3[2],clk);
not_64 not0(a,k3[3],clk);
tscomp_64 tscomp0(a,k3[4],clk);
cla_64 cla0(a,b,k3[5],cout,clk);
cla_64 cla1(a,~b+1,k3[6],cout,clk);
mult_64 mult0(a,b,k3[7],k3[8],clk);//
shift_64 shift0(a,b,k3[9],clk);
mov_64 mov0(a,k3[10],clk);
swap_64 swap0(a,b,k3[11],k5,clk);
equal_64 equal0(a,b,k3[12],clk);
//fpadd_64 fpadd0(k1,k2,k3[15],clk);
//fpadd_64 fpadd1(k1,k2,k3[16],clk);
fmult_64 fmul0(a,b,k3[13],k3[14],clk);//

dff_4 dff0(opcode,opcode0,clk);
dff_4 dff1(opcode0,opcode1,clk);
dff_4 dff2(opcode1,opcode2,clk);
dff_4 dff3(opcode2,opcode3,clk);
dff_4 dff4(opcode3,opcode4,clk);
dff_4 dff5(opcode4,opcode5,clk);
dff_4 dff6(opcode5,opcode6,clk);
initial
clk=1'b0;
always
#1 clk=~clk;
always@ (*)
begin
cf=1'b0;
zf=1'b0;
out=64'b0;
out1=127'b0;

case (opcode6)
//and
4'b0000:
begin
out=k3[0];
if(out==64'b0)
zf=1'b1;
end
//or
4'b0001:
begin
out=k3[1];
if(out==64'b0)
zf=1'b1;
end
//xor
4'b0010:
begin
out=k3[2];
if(out==64'b0)
zf=1'b1;
end
//not
4'b0011:
begin
out=k3[3];
if(out==64'b0)
zf=1'b1;
end
//2's complement
4'b0100:
begin
out=k3[4];
if(out==64'b0)
zf=1'b1;
end
//addition
4'b0101:
begin
out=k3[5];
cf=cout;
if(out==64'b0)
zf=1'b1;
end
//subtraction
4'b0110:
begin
out=k3[6];
cf=cout;
if(out==64'b0)
zf=1'b1;
end
//multiplication
4'b0111:
begin
{out1,out}={k3[7],k3[8]};
if({out1,out}==127'b0)
zf=1'b1;
end
//floating point addition
4'b1000:
begin
out=k3[15];
if(out==64'b0)
zf=1'b1;
end
//floating point subtraction
4'b1001:
begin
out=k3[16];
if(out==64'b0)
zf=1'b1;
end
//floating point multiplication
4'b1010:
begin
{out1,out}={k3[13],k3[14]};
if({out1,out}==127'b0)
zf=1'b1;
end
//shift
4'b1011:
begin
out=k3[9];
if(out==64'b0)
zf=1'b1;
end
//move
4'b1100:
begin
out=k3[10];
if(out==64'b0)
zf=1'b1;
end
//swap
4'b1101:
begin
out=k3[11];
out1=k5;
if(out==64'b0)
zf=1'b1;
end
//equality
4'b1110:
begin
out=k3[12];
if(out==64'b0)
zf=1'b1;
end
//no operation
4'b1111:
begin
out=64'b0;
zf=1'b1;
end
endcase
end
endmodule




/*
module stimulus;
reg [63:0]a,b;
wire [63:0]out1;
wire [63:0]out2;
reg [3:0]opcode;
wire cf,zf;
reg clk;
alu_64 alu1(a,b,out1,out2,opcode,cf,zf);
initial
begin
a=64'h0000_0000_0000_444f;
b=64'h0000_0000_0000_fffe;
opcode=4'b0111;
#2
opcode=4'b0000;
#100 $finish;
end
initial
$monitor($time,"\na=%d\nb=%d\nopcode=%b\nout1=%d\n\nout2=%d\nzf=%b\tcf=%b\n",a,b,opcode,out1,out2,zf,cf);
endmodule*/
