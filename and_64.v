//`include "dff.v"
module and_64(a,b,out,clk);
input [63:0]a,b;
input clk;
output [63:0]out;
wire [63:0]a0,a1,a2,a3,a4,a5,a6;
wire [63:0]b0,b1,b2,b3,b4,b5,b6;

dff_64 dff0(a,a0,clk);
dff_64 dff1(a0,a1,clk);
dff_64 dff2(a1,a2,clk);
dff_64 dff3(a2,a3,clk);
dff_64 dff4(a3,a4,clk);
dff_64 dff5(a4,a5,clk);
dff_64 dff6(a5,a6,clk);


dff_64 dff00(b,b0,clk);
dff_64 dff10(b0,b1,clk);
dff_64 dff20(b1,b2,clk);
dff_64 dff30(b2,b3,clk);
dff_64 dff40(b3,b4,clk);
dff_64 dff50(b4,b5,clk);
dff_64 dff60(b5,b6,clk);

assign out=a6&b6;
endmodule

/*
module s;
reg [63:0]a,b;
wire [63:0]out;

reg clk;
and_64 aa(a,b,out,clk);
initial
clk=1'b1;
always
#1 clk=~clk;
initial
begin
a=64'h0000_0000_0000_444f;
b=64'h0000_0000_0000_fffe;
#20 $finish;
end
initial
$monitor($time," a=%d b=%d  out=%d\n",a,b,out);
endmodule*/
