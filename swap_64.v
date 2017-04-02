//`include"dff.v"
module swap_64(a,b,out1,out2,clk);
input [63:0]a,b;
input clk;
output [63:0]out1,out2;
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


assign out1=a6;
assign out2=b6;
endmodule



/*
module s;
reg [63:0]a,b;
wire [63:0]out1,out2;

reg clk;
swap_64 aa(a,b,out1,out2,clk);
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
$monitor($time," a=%h b=%h  out1=%h  out2=%h\n",a,b,out1,out2);
endmodule*/
