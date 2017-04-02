//`include "dff.v"
//`include "mult_64.v"
module fulladd_11(a,b,out);
input [10:0]a,b;
output[10:0] out;
wire [10:0]out1;
wire [10:0]c;
assign c[0]=(a[0]&b[0])|(1'b0&b[0])|(a[0]&1'b0);
assign out1[0]=a[0]^b[0]^1'b0;
assign c[1]=(a[1]&b[1])|(c[0]&b[1])|(a[1]&c[0]);
assign out1[1]=a[1]^b[1]^c[0];
assign c[2]=(a[2]&b[2])|(c[1]&b[2])|(a[2]&c[1]);
assign out1[2]=a[2]^b[2]^c[1];
assign c[3]=(a[3]&b[3])|(c[2]&b[3])|(a[3]&c[2]);
assign out1[3]=a[3]^b[3]^c[2];
assign c[4]=(a[4]&b[4])|(c[3]&b[4])|(a[4]&c[3]);
assign out1[4]=a[4]^b[4]^c[3];
assign c[5]=(a[5]&b[5])|(c[4]&b[5])|(a[5]&c[4]);
assign out1[5]=a[5]^b[5]^c[4];
assign c[6]=(a[6]&b[6])|(c[5]&b[6])|(a[6]&c[5]);
assign out1[6]=a[6]^b[6]^c[5];
assign c[7]=(a[7]&b[7])|(c[6]&b[7])|(a[7]&c[6]);
assign out1[7]=a[7]^b[7]^c[6];
assign c[8]=(a[8]&b[8])|(c[7]&b[8])|(a[8]&c[7]);
assign out1[8]=a[8]^b[8]^c[7];
assign c[9]=(a[9]&b[9])|(c[8]&b[9])|(a[9]&c[8]);
assign out1[9]=a[9]^b[9]^c[8];
assign c[10]=(a[10]&b[10])|(c[9]&b[10])|(a[10]&c[9]);
assign out1[10]=a[10]^b[10]^c[9];
assign out=(c[10]==1'b0)?out1:11'bx;
endmodule


module fmult_64(a,b,out1,out2,clk);
input [63:0]a,b;
input clk;
output [63:0]out1,out2;
wire [10:0]g,h0,h1,h2,h3,h4,h5,h6;
wire clk;
wire [63:0]t1,t2;
fulladd_11 f0(a[62:52],b[62:52],g);
fulladd_11 f1(g,11'b00000000001,h0);
dff_11 df0(h0,h1,clk);
dff_11 df1(h1,h2,clk);
dff_11 df2(h2,h3,clk);
dff_11 df3(h3,h4,clk);
dff_11 df4(h4,h5,clk);
dff_11 df5(h5,h6,clk);
mult_64 m0({12'b0,a[51:0]},{12'b0,b[51:0]},t1,t2,clk);
assign out1[63]=a[63]^b[63];
assign {out1[62:0],out2}=(a==64'b0||b==64'b0)?127'b0:((t1[51]==1'b0)?{h6-11'b00000000001,{t1[51:0],t2}<<1}:{h6,t1[51:0],t2});
endmodule


/*
module s;
reg [63:0]a,b;
wire [63:0]out1,out2;
reg clk;
fmult_64 fm0(a,b,out1,out2,clk);
initial
clk=1'b1;
always
#1 clk=~clk;
initial
begin
a=64'h0ff0_0000_0000_0002;
b=64'h0000_0000_0000_0006;
#20 $finish;
end
initial
$monitor($time,"\nas=%d a=%d A=%d\nbs=%d b=%d B=%d\nout1=%b  out2=%b\n",a[63],a[62:52],a[51:0],b[63],b[62:52],b[51:0],out1[63:0],out2[63:0]);
endmodule*/
