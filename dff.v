module dff(in,out,clk);
input in;
input clk;
output out;
reg out;
always@(negedge clk)
out=in;
endmodule

module dff_4(in,out,clk);
input [3:0]in;
input clk;
output [3:0]out;
dff dff0(in[0],out[0],clk);
dff dff1(in[1],out[1],clk);
dff dff2(in[2],out[2],clk);
dff dff3(in[3],out[3],clk);
endmodule

module dff_64(in,out,clk);
input [63:0]in;
input clk;
output [63:0]out;
dff dff0(in[0],out[0],clk);
dff dff1(in[1],out[1],clk);
dff dff2(in[2],out[2],clk);
dff dff3(in[3],out[3],clk);
dff dff4(in[4],out[4],clk);
dff dff5(in[5],out[5],clk);
dff dff6(in[6],out[6],clk);
dff dff7(in[7],out[7],clk);
dff dff8(in[8],out[8],clk);
dff dff9(in[9],out[9],clk);
dff dff10(in[10],out[10],clk);
dff dff11(in[11],out[11],clk);
dff dff12(in[12],out[12],clk);
dff dff13(in[13],out[13],clk);
dff dff14(in[14],out[14],clk);
dff dff15(in[15],out[15],clk);
dff dff16(in[16],out[16],clk);
dff dff17(in[17],out[17],clk);
dff dff18(in[18],out[18],clk);
dff dff19(in[19],out[19],clk);
dff dff20(in[20],out[20],clk);
dff dff21(in[21],out[21],clk);
dff dff22(in[22],out[22],clk);
dff dff23(in[23],out[23],clk);
dff dff24(in[24],out[24],clk);
dff dff25(in[25],out[25],clk);
dff dff26(in[26],out[26],clk);
dff dff27(in[27],out[27],clk);
dff dff28(in[28],out[28],clk);
dff dff29(in[29],out[29],clk);
dff dff30(in[30],out[30],clk);
dff dff31(in[31],out[31],clk);
dff dff32(in[32],out[32],clk);
dff dff33(in[33],out[33],clk);
dff dff34(in[34],out[34],clk);
dff dff35(in[35],out[35],clk);
dff dff36(in[36],out[36],clk);
dff dff37(in[37],out[37],clk);
dff dff38(in[38],out[38],clk);
dff dff39(in[39],out[39],clk);
dff dff40(in[40],out[40],clk);
dff dff41(in[41],out[41],clk);
dff dff42(in[42],out[42],clk);
dff dff43(in[43],out[43],clk);
dff dff44(in[44],out[44],clk);
dff dff45(in[45],out[45],clk);
dff dff46(in[46],out[46],clk);
dff dff47(in[47],out[47],clk);
dff dff48(in[48],out[48],clk);
dff dff49(in[49],out[49],clk);
dff dff50(in[50],out[50],clk);
dff dff51(in[51],out[51],clk);
dff dff52(in[52],out[52],clk);
dff dff53(in[53],out[53],clk);
dff dff54(in[54],out[54],clk);
dff dff55(in[55],out[55],clk);
dff dff56(in[56],out[56],clk);
dff dff57(in[57],out[57],clk);
dff dff58(in[58],out[58],clk);
dff dff59(in[59],out[59],clk);
dff dff60(in[60],out[60],clk);
dff dff61(in[61],out[61],clk);
dff dff62(in[62],out[62],clk);
dff dff63(in[63],out[63],clk);
endmodule

module dff_11(in,out,clk);
input [10:0]in;
input clk;
output [10:0]out;
dff dff0(in[0],out[0],clk);
dff dff1(in[1],out[1],clk);
dff dff2(in[2],out[2],clk);
dff dff3(in[3],out[3],clk);
dff dff4(in[4],out[4],clk);
dff dff5(in[5],out[5],clk);
dff dff6(in[6],out[6],clk);
dff dff7(in[7],out[7],clk);
dff dff8(in[8],out[8],clk);
dff dff9(in[9],out[9],clk);
dff dff10(in[10],out[10],clk);
endmodule


module dff_53(in,out,clk);
input [52:0]in;
input clk;
output [52:0]out;
dff dff0(in[0],out[0],clk);
dff dff1(in[1],out[1],clk);
dff dff2(in[2],out[2],clk);
dff dff3(in[3],out[3],clk);
dff dff4(in[4],out[4],clk);
dff dff5(in[5],out[5],clk);
dff dff6(in[6],out[6],clk);
dff dff7(in[7],out[7],clk);
dff dff8(in[8],out[8],clk);
dff dff9(in[9],out[9],clk);
dff dff10(in[10],out[10],clk);
dff dff11(in[11],out[11],clk);
dff dff12(in[12],out[12],clk);
dff dff13(in[13],out[13],clk);
dff dff14(in[14],out[14],clk);
dff dff15(in[15],out[15],clk);
dff dff16(in[16],out[16],clk);
dff dff17(in[17],out[17],clk);
dff dff18(in[18],out[18],clk);
dff dff19(in[19],out[19],clk);
dff dff20(in[20],out[20],clk);
dff dff21(in[21],out[21],clk);
dff dff22(in[22],out[22],clk);
dff dff23(in[23],out[23],clk);
dff dff24(in[24],out[24],clk);
dff dff25(in[25],out[25],clk);
dff dff26(in[26],out[26],clk);
dff dff27(in[27],out[27],clk);
dff dff28(in[28],out[28],clk);
dff dff29(in[29],out[29],clk);
dff dff30(in[30],out[30],clk);
dff dff31(in[31],out[31],clk);
dff dff32(in[32],out[32],clk);
dff dff33(in[33],out[33],clk);
dff dff34(in[34],out[34],clk);
dff dff35(in[35],out[35],clk);
dff dff36(in[36],out[36],clk);
dff dff37(in[37],out[37],clk);
dff dff38(in[38],out[38],clk);
dff dff39(in[39],out[39],clk);
dff dff40(in[40],out[40],clk);
dff dff41(in[41],out[41],clk);
dff dff42(in[42],out[42],clk);
dff dff43(in[43],out[43],clk);
dff dff44(in[44],out[44],clk);
dff dff45(in[45],out[45],clk);
dff dff46(in[46],out[46],clk);
dff dff47(in[47],out[47],clk);
dff dff48(in[48],out[48],clk);
dff dff49(in[49],out[49],clk);
dff dff50(in[50],out[50],clk);
dff dff51(in[51],out[51],clk);
dff dff52(in[52],out[52],clk);
endmodule

module dff_130(in,out,clk);
input [129:0]in;
input clk;
output [129:0]out;
dff_64 dff0(in[63:0],out[63:0],clk);
dff_64 dff1(in[127:64],out[127:64],clk);
dff dff_0(in[128],out[128],clk);
dff dff_1(in[129],out[129],clk);
endmodule
/*
module s;
reg [129:0]a;
reg clk;
wire [129:0]b;
dff_130 dff0(a,b,clk);
initial
clk=1'b1;
always
#1 clk=~clk;
initial
begin
a=130'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
#8 $finish;
end
initial
$monitor($time," a=%h b=%h clk=%b\n",a,b,clk);  
endmodule*/
