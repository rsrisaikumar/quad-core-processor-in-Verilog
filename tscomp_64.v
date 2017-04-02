//`include"dff.v"
module tscomp_64(a,out,clk);
input [63:0]a;
input clk;
output [63:0]out;
wire [63:0]a0,a1,a2,a3,a4,a5,a6;
dff_64 dff0(a,a0,clk);
dff_64 dff1(a0,a1,clk);
dff_64 dff2(a1,a2,clk);
dff_64 dff3(a2,a3,clk);
dff_64 dff4(a3,a4,clk);
dff_64 dff5(a4,a5,clk);
dff_64 dff6(a5,a6,clk);

assign out=~a6+1;

endmodule

/*
module s;
reg [63:0]a;
wire [63:0]b;
reg clk;
tscomp_64 aa(a,b,clk);
initial
clk=1'b1;
always
#1 clk=~clk;
initial
begin
a=64'h1111111111111111;
#20 $finish;
end
initial
$monitor($time," a=%h b=%h\n",a,b);
endmodule*/
