//`include "dff.v"
`include "kgp_64.v"
module cla_64(a,b,sum,cout,clk);
input[63:0] a,b;
input clk;
output[63:0] sum;
output cout;
wire[129:0] x0,x1,x2,x3,x4,x5,x6,dx0,dx1,dx2,dx3,dx4,dx5,dx6;
wire [63:0]a0,a1,a2,a3,a4,a5,a6,b0,b1,b2,b3,b4,b5,b6,b7;
wire[63:0]sum1;
wire cout1;
wire[1:0] g,p,k;
integer i;
assign g=2'b11;
assign p=2'b10;
assign k=2'b00;

padd padd_0(a,b,x0);

dff_130 dff0(x0,dx0,clk);//

padd1 padd1_0(dx0,x1);

dff_130 dff1(x1,dx1,clk);//

padd2 padd2_0(dx1,x2);

dff_130 dff2(x2,dx2,clk);//

padd3 padd3_0(dx2,x3);

dff_130 dff3(x3,dx3,clk);//

padd4 padd4_0(dx3,x4);

dff_130 dff4(x4,dx4,clk);//

padd5 padd5_0(dx4,x5);
 
dff_130 dff5(x5,dx5,clk);//

padd6 padd6_0(dx5,x6);

dff_130 dff6(x6,dx6,clk);//


dff_64 dffa0(a,a0,clk);//
dff_64 dffb0(b,b0,clk);//

dff_64 dffa1(a0,a1,clk);//
dff_64 dffb1(b0,b1,clk);//

dff_64 dffa2(a1,a2,clk);//
dff_64 dffb2(b1,b2,clk);//

dff_64 dffa3(a2,a3,clk);//
dff_64 dffb3(b2,b3,clk);//

dff_64 dffa4(a3,a4,clk);//
dff_64 dffb4(b3,b4,clk);//

dff_64 dffa5(a4,a5,clk);//
dff_64 dffb5(b4,b5,clk);//

dff_64 dffa6(a5,a6,clk);//
dff_64 dffb6(b5,b6,clk);//


findxor find1(a6,b6,dx6,sum1,cout1);
assign sum=sum1;
assign cout=cout1;
endmodule

/*

module stimulus;
reg[63:0] a,b;
reg clk,cin;
wire[63:0] sum;
wire cout;
cla_64 cla0(a,b,sum,cout,clk);
initial
clk=1'b1;
always
#1 clk=~clk;

initial
begin
a=64'h0000_0000_0000_000e;
b=64'h0000_0000_0000_000f;
#20
//b=64'h0000_0000_0000_00ff;
#100 $finish;
end
initial
$monitor($time," a=%d\nb=%d\nsum=%d\ncout=%d\n",a,b,sum,cout);
endmodule*/
