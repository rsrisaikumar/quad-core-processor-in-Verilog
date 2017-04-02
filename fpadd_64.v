`include "dff.v"
module Cmp_shift(exx,eyy,mxx,myy,e11,e22,m11,m22);
input [10:0] exx,eyy;
input [52:0] mxx,myy;

output [10:0] e11,e22;
output [52:0] m11,m22;

wire [10:0] diff;

assign diff=((exx>eyy)||(exx==eyy))?exx-eyy:eyy-exx;

assign e11=((exx>eyy)||(exx==eyy))?exx:eyy;
assign e22=((exx>eyy)||(exx==eyy))?exx:eyy;

assign m11=((exx>eyy)||(exx==eyy))?mxx:mxx>>diff;
assign m22=((exx>eyy)||(exx==eyy))?myy>>diff:myy;

endmodule



module Result_add(ef,es,mf,ms,sf,ss,res);
input [10:0] ef,es;
input [52:0] mf,ms;
input sf,ss;

output [63:0] res;

wire cary;
wire cary_in;
wire [52:0] temp_m1;
wire [52:0] temp_m2;

wire [10:0] temp_e;
wire [51:0] temp;
wire sign;

assign sign=(~(sf^ss))?sf:((mf>ms)?sf:ss);
assign cary_in=1'b0;
assign {cary,temp_m1}=mf+ms+cary_in;
assign temp_m2=(cary==1'b1)?(temp_m1>>1):temp_m1;
assign temp_e=(cary==1'b1)?(ef+1):ef;
assign temp=temp_m2[51:0];
assign res=((sf^ss)&&(mf==ms))?64'b0:{sign,temp_e,temp};

endmodule


module fpadd_64(in1,in2,out,clk);
input [63:0] in1,in2;
input clk;
output [63:0] out;
wire [10:0]e1,e2;
wire [52:0]m1,m2;
wire [63:0]dx11,dx21;
wire [10:0]edx11,edx12,edx21,edx22,edx13,edx23;
wire [52:0]mdx11,mdx12,mdx21,mdx22,mdx13,mdx23;
wire [63:0]out0,out1,out2;
dff_64 dff0(in1,dx11,clk);
dff_64 dff1(in2,dx21,clk);
Cmp_shift cs1(dx11[62:52],dx21[62:52],{1'b1,dx11[51:0]},{1'b1,dx21[51:0]},e1,e2,m1,m2);

dff_11 dff10(e1,edx11,clk);
dff_11 dff11(e2,edx21,clk);
dff_53 dff12(m1,mdx11,clk);
dff_53 dff13(m2,mdx21,clk);

dff_11 dff20(edx11,edx12,clk);
dff_11 dff21(edx21,edx22,clk);
dff_53 dff22(mdx11,mdx12,clk);
dff_53 dff23(mdx21,mdx22,clk);

dff_11 dff30(edx12,edx13,clk);
dff_11 dff31(edx22,edx23,clk);
dff_53 dff32(mdx12,mdx13,clk);
dff_53 dff33(mdx22,mdx23,clk);

Result_add r1(edx13[62:52],edx23[62:52],mdx13[52:0],mdx23[52:0],in1[31],in2[31],out0);


dff_64 dffo0(out0,out1,clk);
dff_64 dffo1(out1,out2,clk);
dff_64 dffo2(out2,out,clk);

endmodule














/*
module s;
reg [63:0] a,b;

wire [63:0] result;

fpadd_64 fa(a,b,result,clk);

initial
  begin
      a=64'b0_11010111010_1110011101000001100001111100111010000011000011111111;
      b=64'b0_11010111101_0001110010111110001110011100111010000011000011111001;
  end

initial
$monitor($time,"a=%b\nb=%b\nr=%b\n",a,b,result);

endmodule*/
