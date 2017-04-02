//`include"dff.v"
module xor_64(a,b,out,clk);
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
dff_64 dff11(b0,b1,clk);
dff_64 dff22(b1,b2,clk);
dff_64 dff33(b2,b3,clk);
dff_64 dff44(b3,b4,clk);
dff_64 dff55(b4,b5,clk);
dff_64 dff66(b5,b6,clk);


assign out=a6^b6;
endmodule


/*
module s;
reg [63:0]a,b;
wire [63:0]out;

reg clk;
xor_64 aa(a,b,out,clk);
initial
clk=1'b1;
always
#1 clk=~clk;
initial
begin
a=64'h1111111111111111;
b=64'h1111111111111111;
#20 $finish;
end
initial
$monitor($time," a=%h b=%h  out=%h\n",a,b,out);
endmodule*/
