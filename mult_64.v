//`include "dff.v"
`include"fulladd_64.v"
module mult_64(a,b,outa,outb,clk);
input [63:0]a,b;
input clk;
output [63:0]outa,outb;
wire [63:0]a1[0:63];
wire [63:0]b1[0:63];
wire [63:0]out1[0:63];
wire [63:0]g[0:63];
wire [63:0]qn1;
wire c1[0:63],p[0:63];
wire [63:0]dx0,dx1,dx2,dx3,dx4,dx5,dx6;
wire [63:0]odx0,odx1,odx2,odx3,odx4,odx5,odx6;
wire qdx0,qdx1,qdx2,qdx3,qdx4,qdx5,qdx6;

//out1 b1 qn1
assign g[0]=({b[0],1'b0}==2'b01)?a:(({b[0],1'b0}==2'b10)?(~a+1):64'b0);
assign qn1[0]=b[0];
assign {p[0],out1[0][62:0],b1[0]}={g[0],b}>>1;
assign out1[0][63]=out1[0][62];

assign g[1]=({b1[0][0],qn1[0]}==2'b01)?a:(({b1[0][0],qn1[0]}==2'b10)?(~a+1):64'b0);
assign qn1[1]=b1[0][0];
fulladd_64 cla0(out1[0],g[1],a1[0],c1[0]);
assign {p[1],out1[1][62:0],b1[1]}={a1[0],b1[0]}>>1;
assign out1[1][63]=out1[1][62];

assign g[2]=({b1[1][0],qn1[1]}==2'b01)?a:(({b1[1][0],qn1[1]}==2'b10)?(~a+1):64'b0);
assign qn1[2]=b1[1][0];
fulladd_64 cla1(out1[1],g[2],a1[1],c1[1]);
assign {p[2],out1[2][62:0],b1[2]}={a1[1],b1[1]}>>1;
assign out1[2][63]=out1[2][62];


assign g[3]=({b1[2][0],qn1[2]}==2'b01)?a:(({b1[2][0],qn1[2]}==2'b10)?(~a+1):64'b0);
assign qn1[3]=b1[2][0];
fulladd_64 cla2(out1[2],g[3],a1[2],c1[2]);
assign {p[3],out1[3][62:0],b1[3]}={a1[2],b1[2]}>>1;
assign out1[3][63]=out1[3][62];

assign g[4]=({b1[3][0],qn1[3]}==2'b01)?a:(({b1[3][0],qn1[3]}==2'b10)?(~a+1):64'b0);
assign qn1[4]=b1[3][0];
fulladd_64 cla3(out1[3],g[4],a1[3],c1[3]);
assign {p[4],out1[4][62:0],b1[4]}={a1[3],b1[3]}>>1;
assign out1[4][63]=out1[4][62];

assign g[5]=({b1[4][0],qn1[4]}==2'b01)?a:(({b1[4][0],qn1[4]}==2'b10)?(~a+1):64'b0);
assign qn1[5]=b1[4][0];
fulladd_64 cla4(out1[4],g[5],a1[4],c1[4]);
assign {p[5],out1[5][62:0],b1[5]}={a1[4],b1[4]}>>1;
assign out1[5][63]=out1[5][62];

assign g[6]=({b1[5][0],qn1[5]}==2'b01)?a:(({b1[5][0],qn1[5]}==2'b10)?(~a+1):64'b0);
assign qn1[6]=b1[5][0];
fulladd_64 cla5(out1[5],g[6],a1[5],c1[5]);
assign {p[6],out1[6][62:0],b1[6]}={a1[5],b1[5]}>>1;
assign out1[6][63]=out1[6][62];

assign g[7]=({b1[6][0],qn1[6]}==2'b01)?a:(({b1[6][0],qn1[6]}==2'b10)?(~a+1):64'b0);
assign qn1[7]=b1[6][0];
fulladd_64 cla6(out1[6],g[7],a1[6],c1[6]);
assign {p[7],out1[7][62:0],b1[7]}={a1[6],b1[6]}>>1;
assign out1[7][63]=out1[7][62];

assign g[8]=({b1[7][0],qn1[7]}==2'b01)?a:(({b1[7][0],qn1[7]}==2'b10)?(~a+1):64'b0);
assign qn1[8]=b1[7][0];
fulladd_64 cla7(out1[7],g[8],a1[7],c1[7]);
assign {p[8],out1[8][62:0],b1[8]}={a1[7],b1[7]}>>1;
assign out1[8][63]=out1[8][62];

//
dff_64 dfb10(b1[8],dx0,clk);
dff_64 dfo10(out1[8],odx0,clk);
dff dffqn10(qn1[8],qdx0,clk);
//

assign g[9]=({dx0[0],qdx0}==2'b01)?a:(({dx0[0],qdx0}==2'b10)?(~a+1):64'b0);
assign qn1[9]=dx0[0];
fulladd_64 cla8(out1[8],g[9],a1[8],c1[8]);
assign {p[9],out1[9][62:0],b1[9]}={a1[8],dx0}>>1;
assign out1[9][63]=out1[9][62];

assign g[10]=({b1[9][0],qn1[9]}==2'b01)?a:(({b1[9][0],qn1[9]}==2'b10)?(~a+1):64'b0);
assign qn1[10]=b1[9][0];
fulladd_64 cla9(out1[9],g[10],a1[9],c1[9]);
assign {p[10],out1[10][62:0],b1[10]}={a1[9],b1[9]}>>1;
assign out1[10][63]=out1[10][62];

assign g[11]=({b1[10][0],qn1[10]}==2'b01)?a:(({b1[10][0],qn1[10]}==2'b10)?(~a+1):64'b0);
assign qn1[11]=b1[10][0];
fulladd_64 cla10(out1[10],g[11],a1[10],c1[10]);
assign {p[11],out1[11][62:0],b1[11]}={a1[10],b1[10]}>>1;
assign out1[11][63]=out1[11][62];

assign g[12]=({b1[11][0],qn1[11]}==2'b01)?a:(({b1[11][0],qn1[11]}==2'b10)?(~a+1):64'b0);
assign qn1[12]=b1[11][0];
fulladd_64 cla11(out1[11],g[12],a1[11],c1[11]);
assign {p[12],out1[12][62:0],b1[12]}={a1[11],b1[11]}>>1;
assign out1[12][63]=out1[12][62];

assign g[13]=({b1[12][0],qn1[12]}==2'b01)?a:(({b1[12][0],qn1[12]}==2'b10)?(~a+1):64'b0);
assign qn1[13]=b1[12][0];
fulladd_64 cla12(out1[12],g[13],a1[12],c1[12]);
assign {p[13],out1[13][62:0],b1[13]}={a1[12],b1[12]}>>1;
assign out1[13][63]=out1[13][62];

assign g[14]=({b1[13][0],qn1[13]}==2'b01)?a:(({b1[13][0],qn1[13]}==2'b10)?(~a+1):64'b0);
assign qn1[14]=b1[13][0];
fulladd_64 cla13(out1[13],g[14],a1[13],c1[13]);
assign {p[14],out1[14][62:0],b1[14]}={a1[13],b1[13]}>>1;
assign out1[14][63]=out1[14][62];

assign g[15]=({b1[14][0],qn1[14]}==2'b01)?a:(({b1[14][0],qn1[14]}==2'b10)?(~a+1):64'b0);
assign qn1[15]=b1[14][0];
fulladd_64 cla14(out1[14],g[15],a1[14],c1[14]);
assign {p[15],out1[15][62:0],b1[15]}={a1[14],b1[14]}>>1;
assign out1[15][63]=out1[15][62];

assign g[16]=({b1[15][0],qn1[15]}==2'b01)?a:(({b1[15][0],qn1[15]}==2'b10)?(~a+1):64'b0);
assign qn1[16]=b1[15][0];
fulladd_64 cla15(out1[15],g[16],a1[15],c1[15]);
assign {p[16],out1[16][62:0],b1[16]}={a1[15],b1[15]}>>1;
assign out1[16][63]=out1[16][62];

assign g[17]=({b1[16][0],qn1[16]}==2'b01)?a:(({b1[16][0],qn1[16]}==2'b10)?(~a+1):64'b0);
assign qn1[17]=b1[16][0];
fulladd_64 cla16(out1[16],g[17],a1[16],c1[16]);
assign {p[17],out1[17][62:0],b1[17]}={a1[16],b1[16]}>>1;
assign out1[17][63]=out1[17][62];

//
dff_64 dfb20(b1[17],dx1,clk);
dff_64 dfo20(out1[17],odx1,clk);
dff dffqn20(qn1[17],qdx1,clk);
//


assign g[18]=({dx1[0],qdx1}==2'b01)?a:(({dx1[0],qdx1}==2'b10)?(~a+1):64'b0);
assign qn1[18]=dx1[0];
fulladd_64 cla17(odx1,g[18],a1[17],c1[17]);
assign {p[18],out1[18][62:0],b1[18]}={a1[17],dx1}>>1;
assign out1[18][63]=out1[18][62];

assign g[19]=({b1[18][0],qn1[18]}==2'b01)?a:(({b1[18][0],qn1[18]}==2'b10)?(~a+1):64'b0);
assign qn1[19]=b1[18][0];
fulladd_64 cla18(out1[18],g[19],a1[18],c1[18]);
assign {p[19],out1[19][62:0],b1[19]}={a1[18],b1[18]}>>1;
assign out1[19][63]=out1[19][62];

assign g[20]=({b1[19][0],qn1[19]}==2'b01)?a:(({b1[19][0],qn1[19]}==2'b10)?(~a+1):64'b0);
assign qn1[20]=b1[19][0];
fulladd_64 cla19(out1[19],g[20],a1[19],c1[19]);
assign {p[20],out1[20][62:0],b1[20]}={a1[19],b1[19]}>>1;
assign out1[20][63]=out1[20][62];

assign g[21]=({b1[20][0],qn1[20]}==2'b01)?a:(({b1[20][0],qn1[20]}==2'b10)?(~a+1):64'b0);
assign qn1[21]=b1[20][0];
fulladd_64 cla20(out1[20],g[21],a1[20],c1[20]);
assign {p[21],out1[21][62:0],b1[21]}={a1[20],b1[20]}>>1;
assign out1[21][63]=out1[21][62];

assign g[22]=({b1[21][0],qn1[21]}==2'b01)?a:(({b1[21][0],qn1[21]}==2'b10)?(~a+1):64'b0);
assign qn1[22]=b1[21][0];
fulladd_64 cla21(out1[21],g[22],a1[21],c1[21]);
assign {p[22],out1[22][62:0],b1[22]}={a1[21],b1[21]}>>1;
assign out1[22][63]=out1[22][62];

assign g[23]=({b1[22][0],qn1[22]}==2'b01)?a:(({b1[22][0],qn1[22]}==2'b10)?(~a+1):64'b0);
assign qn1[23]=b1[22][0];
fulladd_64 cla22(out1[22],g[23],a1[22],c1[22]);
assign {p[23],out1[23][62:0],b1[23]}={a1[22],b1[22]}>>1;
assign out1[23][63]=out1[23][62];

assign g[24]=({b1[23][0],qn1[23]}==2'b01)?a:(({b1[23][0],qn1[23]}==2'b10)?(~a+1):64'b0);
assign qn1[24]=b1[23][0];
fulladd_64 cla23(out1[23],g[24],a1[23],c1[23]);
assign {p[24],out1[24][62:0],b1[24]}={a1[23],b1[23]}>>1;
assign out1[24][63]=out1[24][62];

assign g[25]=({b1[24][0],qn1[24]}==2'b01)?a:(({b1[24][0],qn1[24]}==2'b10)?(~a+1):64'b0);
assign qn1[25]=b1[24][0];
fulladd_64 cla24(out1[24],g[25],a1[24],c1[24]);
assign {p[25],out1[25][62:0],b1[25]}={a1[24],b1[24]}>>1;
assign out1[25][63]=out1[25][62];

assign g[26]=({b1[25][0],qn1[25]}==2'b01)?a:(({b1[25][0],qn1[25]}==2'b10)?(~a+1):64'b0);
assign qn1[26]=b1[25][0];
fulladd_64 cla25(out1[25],g[26],a1[25],c1[25]);
assign {p[26],out1[26][62:0],b1[26]}={a1[25],b1[25]}>>1;
assign out1[26][63]=out1[26][62];

//
dff_64 dfb30(b1[26],dx2,clk);
dff_64 dfo30(out1[26],odx2,clk);
dff dffqn30(qn1[26],qdx2,clk);
//

assign g[27]=({dx2[0],qdx2}==2'b01)?a:(({dx2[0],qdx2}==2'b10)?(~a+1):64'b0);
assign qn1[27]=dx2[0];
fulladd_64 cla26(odx2,g[27],a1[26],c1[26]);
assign {p[27],out1[27][62:0],b1[27]}={a1[26],dx2}>>1;
assign out1[27][63]=out1[27][62];

assign g[28]=({b1[27][0],qn1[27]}==2'b01)?a:(({b1[27][0],qn1[27]}==2'b10)?(~a+1):64'b0);
assign qn1[28]=b1[27][0];
fulladd_64 cla27(out1[27],g[28],a1[27],c1[27]);
assign {p[28],out1[28][62:0],b1[28]}={a1[27],b1[27]}>>1;
assign out1[28][63]=out1[28][62];

assign g[29]=({b1[28][0],qn1[28]}==2'b01)?a:(({b1[28][0],qn1[28]}==2'b10)?(~a+1):64'b0);
assign qn1[29]=b1[28][0];
fulladd_64 cla28(out1[28],g[29],a1[28],c1[28]);
assign {p[29],out1[29][62:0],b1[29]}={a1[28],b1[28]}>>1;
assign out1[29][63]=out1[29][62];

assign g[30]=({b1[29][0],qn1[29]}==2'b01)?a:(({b1[29][0],qn1[29]}==2'b10)?(~a+1):64'b0);
assign qn1[30]=b1[29][0];
fulladd_64 cla29(out1[29],g[30],a1[29],c1[29]);
assign {p[30],out1[30][62:0],b1[30]}={a1[29],b1[29]}>>1;
assign out1[30][63]=out1[30][62];

assign g[31]=({b1[30][0],qn1[30]}==2'b01)?a:(({b1[30][0],qn1[30]}==2'b10)?(~a+1):64'b0);
assign qn1[31]=b1[30][0];
fulladd_64 cla30(out1[30],g[31],a1[30],c1[30]);
assign {p[31],out1[31][62:0],b1[31]}={a1[30],b1[30]}>>1;
assign out1[31][63]=out1[31][62];

assign g[32]=({b1[31][0],qn1[31]}==2'b01)?a:(({b1[31][0],qn1[31]}==2'b10)?(~a+1):64'b0);
assign qn1[32]=b1[31][0];
fulladd_64 cla31(out1[31],g[32],a1[31],c1[31]);
assign {p[32],out1[32][62:0],b1[32]}={a1[31],b1[31]}>>1;
assign out1[32][63]=out1[32][62];

assign g[33]=({b1[32][0],qn1[32]}==2'b01)?a:(({b1[32][0],qn1[32]}==2'b10)?(~a+1):64'b0);
assign qn1[33]=b1[32][0];
fulladd_64 cla32(out1[32],g[33],a1[32],c1[32]);
assign {p[33],out1[33][62:0],b1[33]}={a1[32],b1[32]}>>1;
assign out1[33][63]=out1[33][62];

assign g[34]=({b1[33][0],qn1[33]}==2'b01)?a:(({b1[33][0],qn1[33]}==2'b10)?(~a+1):64'b0);
assign qn1[34]=b1[33][0];
fulladd_64 cla33(out1[33],g[34],a1[33],c1[33]);
assign {p[34],out1[34][62:0],b1[34]}={a1[33],b1[33]}>>1;
assign out1[34][63]=out1[34][62];

assign g[35]=({b1[34][0],qn1[34]}==2'b01)?a:(({b1[34][0],qn1[34]}==2'b10)?(~a+1):64'b0);
assign qn1[35]=b1[34][0];
fulladd_64 cla34(out1[34],g[35],a1[34],c1[34]);
assign {p[35],out1[35][62:0],b1[35]}={a1[34],b1[34]}>>1;
assign out1[35][63]=out1[35][62];

//
dff_64 dfb40(b1[35],dx3,clk);
dff_64 dfo40(out1[35],odx3,clk);
dff dffqn40(qn1[35],qdx3,clk);
//

assign g[36]=({dx3[0],qdx3}==2'b01)?a:(({dx3[0],qdx3}==2'b10)?(~a+1):64'b0);
assign qn1[36]=dx3[0];
fulladd_64 cla35(odx3,g[36],a1[35],c1[35]);
assign {p[36],out1[36][62:0],b1[36]}={a1[35],dx3}>>1;
assign out1[36][63]=out1[36][62];

assign g[37]=({b1[36][0],qn1[36]}==2'b01)?a:(({b1[36][0],qn1[36]}==2'b10)?(~a+1):64'b0);
assign qn1[37]=b1[36][0];
fulladd_64 cla36(out1[36],g[37],a1[36],c1[36]);
assign {p[37],out1[37][62:0],b1[37]}={a1[36],b1[36]}>>1;
assign out1[37][63]=out1[37][62];

assign g[38]=({b1[37][0],qn1[37]}==2'b01)?a:(({b1[37][0],qn1[37]}==2'b10)?(~a+1):64'b0);
assign qn1[38]=b1[37][0];
fulladd_64 cla37(out1[37],g[38],a1[37],c1[37]);
assign {p[38],out1[38][62:0],b1[38]}={a1[37],b1[37]}>>1;
assign out1[38][63]=out1[38][62];

assign g[39]=({b1[38][0],qn1[38]}==2'b01)?a:(({b1[38][0],qn1[38]}==2'b10)?(~a+1):64'b0);
assign qn1[39]=b1[38][0];
fulladd_64 cla38(out1[38],g[39],a1[38],c1[38]);
assign {p[38],out1[39][62:0],b1[39]}={a1[38],b1[38]}>>1;
assign out1[39][63]=out1[39][62];

assign g[40]=({b1[39][0],qn1[39]}==2'b01)?a:(({b1[39][0],qn1[39]}==2'b10)?(~a+1):64'b0);
assign qn1[40]=b1[39][0];
fulladd_64 cla39(out1[39],g[40],a1[39],c1[39]);
assign {p[40],out1[40][62:0],b1[40]}={a1[39],b1[39]}>>1;
assign out1[40][63]=out1[40][62];

assign g[41]=({b1[40][0],qn1[40]}==2'b01)?a:(({b1[40][0],qn1[40]}==2'b10)?(~a+1):64'b0);
assign qn1[41]=b1[40][0];
fulladd_64 cla40(out1[40],g[41],a1[40],c1[40]);
assign {p[41],out1[41][62:0],b1[41]}={a1[40],b1[40]}>>1;
assign out1[41][63]=out1[41][62];

assign g[42]=({b1[41][0],qn1[41]}==2'b01)?a:(({b1[41][0],qn1[41]}==2'b10)?(~a+1):64'b0);
assign qn1[42]=b1[41][0];
fulladd_64 cla41(out1[41],g[42],a1[41],c1[41]);
assign {p[42],out1[42][62:0],b1[42]}={a1[41],b1[41]}>>1;
assign out1[42][63]=out1[42][62];

assign g[43]=({b1[42][0],qn1[42]}==2'b01)?a:(({b1[42][0],qn1[42]}==2'b10)?(~a+1):64'b0);
assign qn1[43]=b1[42][0];
fulladd_64 cla42(out1[42],g[43],a1[42],c1[42]);
assign {p[43],out1[43][62:0],b1[43]}={a1[42],b1[42]}>>1;
assign out1[43][63]=out1[43][62];

assign g[44]=({b1[43][0],qn1[43]}==2'b01)?a:(({b1[43][0],qn1[43]}==2'b10)?(~a+1):64'b0);
assign qn1[44]=b1[43][0];
fulladd_64 cla43(out1[43],g[44],a1[43],c1[43]);
assign {p[44],out1[44][62:0],b1[44]}={a1[43],b1[43]}>>1;
assign out1[44][63]=out1[44][62];

//
dff_64 dfb50(b1[44],dx4,clk);
dff_64 dfo50(out1[44],odx4,clk);
dff dffqn50(qn1[44],qdx4,clk);
//

assign g[45]=({dx4[0],qdx4}==2'b01)?a:(({dx4[0],qdx4}==2'b10)?(~a+1):64'b0);
assign qn1[45]=dx4[0];
fulladd_64 cla44(odx4,g[45],a1[44],c1[44]);
assign {p[45],out1[45][62:0],b1[45]}={a1[44],dx4}>>1;
assign out1[45][63]=out1[45][62];

assign g[46]=({b1[45][0],qn1[45]}==2'b01)?a:(({b1[45][0],qn1[45]}==2'b10)?(~a+1):64'b0);
assign qn1[46]=b1[45][0];
fulladd_64 cla45(out1[45],g[46],a1[45],c1[45]);
assign {p[46],out1[46][62:0],b1[46]}={a1[45],b1[45]}>>1;
assign out1[46][63]=out1[46][62];

assign g[47]=({b1[46][0],qn1[46]}==2'b01)?a:(({b1[46][0],qn1[46]}==2'b10)?(~a+1):64'b0);
assign qn1[47]=b1[46][0];
fulladd_64 cla46(out1[46],g[47],a1[46],c1[46]);
assign {p[47],out1[47][62:0],b1[47]}={a1[46],b1[46]}>>1;
assign out1[47][63]=out1[47][62];

assign g[48]=({b1[47][0],qn1[47]}==2'b01)?a:(({b1[47][0],qn1[47]}==2'b10)?(~a+1):64'b0);
assign qn1[48]=b1[47][0];
fulladd_64 cla47(out1[47],g[48],a1[47],c1[47]);
assign {p[48],out1[48][62:0],b1[48]}={a1[47],b1[47]}>>1;
assign out1[48][63]=out1[48][62];

assign g[49]=({b1[48][0],qn1[48]}==2'b01)?a:(({b1[48][0],qn1[48]}==2'b10)?(~a+1):64'b0);
assign qn1[49]=b1[48][0];
fulladd_64 cla48(out1[48],g[49],a1[48],c1[48]);
assign {p[49],out1[49][62:0],b1[49]}={a1[48],b1[48]}>>1;
assign out1[49][63]=out1[49][62];

assign g[50]=({b1[49][0],qn1[49]}==2'b01)?a:(({b1[49][0],qn1[49]}==2'b10)?(~a+1):64'b0);
assign qn1[50]=b1[49][0];
fulladd_64 cla49(out1[49],g[50],a1[49],c1[49]);
assign {p[50],out1[50][62:0],b1[50]}={a1[49],b1[49]}>>1;
assign out1[50][63]=out1[50][62];

assign g[51]=({b1[50][0],qn1[50]}==2'b01)?a:(({b1[50][0],qn1[50]}==2'b10)?(~a+1):64'b0);
assign qn1[51]=b1[50][0];
fulladd_64 cla50(out1[50],g[51],a1[50],c1[50]);
assign {p[51],out1[51][62:0],b1[51]}={a1[50],b1[50]}>>1;
assign out1[51][63]=out1[51][62];

assign g[52]=({b1[51][0],qn1[51]}==2'b01)?a:(({b1[51][0],qn1[51]}==2'b10)?(~a+1):64'b0);
assign qn1[52]=b1[51][0];
fulladd_64 cla51(out1[51],g[52],a1[51],c1[51]);
assign {p[52],out1[52][62:0],b1[52]}={a1[51],b1[51]}>>1;
assign out1[52][63]=out1[52][62];

assign g[53]=({b1[52][0],qn1[52]}==2'b01)?a:(({b1[52][0],qn1[52]}==2'b10)?(~a+1):64'b0);
assign qn1[53]=b1[52][0];
fulladd_64 cla52(out1[52],g[53],a1[52],c1[52]);
assign {p[53],out1[53][62:0],b1[53]}={a1[52],b1[52]}>>1;
assign out1[53][63]=out1[53][62];

//
dff_64 dfb60(b1[53],dx5,clk);
dff_64 dfo60(out1[53],odx5,clk);
dff dffqn60(qn1[53],qdx5,clk);
//

assign g[54]=({dx5[0],qdx5}==2'b01)?a:(({dx5[0],qdx5}==2'b10)?(~a+1):64'b0);
assign qn1[54]=dx5[0];
fulladd_64 cla53(odx5,g[54],a1[53],c1[53]);
assign {p[54],out1[54][62:0],b1[54]}={a1[53],dx5}>>1;
assign out1[54][63]=out1[54][62];

assign g[55]=({b1[54][0],qn1[54]}==2'b01)?a:(({b1[54][0],qn1[54]}==2'b10)?(~a+1):64'b0);
assign qn1[55]=b1[54][0];
fulladd_64 cla54(out1[54],g[55],a1[54],c1[54]);
assign {p[55],out1[55][62:0],b1[55]}={a1[54],b1[54]}>>1;
assign out1[55][63]=out1[55][62];

assign g[56]=({b1[55][0],qn1[55]}==2'b01)?a:(({b1[55][0],qn1[55]}==2'b10)?(~a+1):64'b0);
assign qn1[56]=b1[55][0];
fulladd_64 cla55(out1[55],g[56],a1[55],c1[55]);
assign {p[56],out1[56][62:0],b1[56]}={a1[55],b1[55]}>>1;
assign out1[56][63]=out1[56][62];

assign g[57]=({b1[56][0],qn1[56]}==2'b01)?a:(({b1[56][0],qn1[56]}==2'b10)?(~a+1):64'b0);
assign qn1[57]=b1[56][0];
fulladd_64 cla56(out1[56],g[57],a1[56],c1[56]);
assign {p[57],out1[57][62:0],b1[57]}={a1[56],b1[56]}>>1;
assign out1[57][63]=out1[57][62];

assign g[58]=({b1[57][0],qn1[57]}==2'b01)?a:(({b1[57][0],qn1[57]}==2'b10)?(~a+1):64'b0);
assign qn1[58]=b1[57][0];
fulladd_64 cla57(out1[57],g[58],a1[57],c1[57]);
assign {p[58],out1[58][62:0],b1[58]}={a1[57],b1[57]}>>1;
assign out1[58][63]=out1[58][62];

assign g[59]=({b1[58][0],qn1[58]}==2'b01)?a:(({b1[58][0],qn1[58]}==2'b10)?(~a+1):64'b0);
assign qn1[59]=b1[58][0];
fulladd_64 cla558(out1[58],g[59],a1[58],c1[55]);
assign {p[59],out1[59][62:0],b1[59]}={a1[58],b1[58]}>>1;
assign out1[59][63]=out1[59][62];

assign g[60]=({b1[59][0],qn1[59]}==2'b01)?a:(({b1[59][0],qn1[59]}==2'b10)?(~a+1):64'b0);
assign qn1[60]=b1[59][0];
fulladd_64 cla59(out1[59],g[60],a1[59],c1[59]);
assign {p[60],out1[60][62:0],b1[60]}={a1[59],b1[59]}>>1;
assign out1[60][63]=out1[60][62];

assign g[61]=({b1[60][0],qn1[60]}==2'b01)?a:(({b1[60][0],qn1[60]}==2'b10)?(~a+1):64'b0);
assign qn1[61]=b1[60][0];
fulladd_64 cla60(out1[60],g[61],a1[60],c1[60]);
assign {p[61],out1[61][62:0],b1[61]}={a1[60],b1[60]}>>1;
assign out1[61][63]=out1[61][62];

//
dff_64 dfb70(b1[61],dx6,clk);
dff_64 dfo70(out1[61],odx6,clk);
dff dffqn70(qn1[61],qdx6,clk);
//

assign g[62]=({dx6[0],qdx6}==2'b01)?a:(({dx6[0],qdx6}==2'b10)?(~a+1):64'b0);
assign qn1[62]=dx6[0];
fulladd_64 cla61(odx6,g[62],a1[61],c1[61]);
assign {p[62],out1[62][62:0],b1[62]}={a1[61],dx6}>>1;
assign out1[62][63]=out1[62][62];

assign g[63]=({b1[62][0],qn1[62]}==2'b01)?a:(({b1[62][0],qn1[62]}==2'b10)?(~a+1):64'b0);
assign qn1[63]=b1[62][0];
fulladd_64 cla62(out1[62],g[63],a1[62],c1[62]);
assign {p[63],out1[63][62:0],b1[63]}={a1[62],b1[62]}>>1;
assign out1[63][63]=out1[63][62];

assign {outa,outb}={out1[63],b1[63]};
endmodule


/*
module  s;
reg[63:0] a,b;
wire[63:0] proda,prodb;
reg [127:0]product;
reg clk;
mult_64 cs(a,b,proda,prodb,clk);
initial
clk=1'b1;
always
#1 clk=~clk;
initial
begin
a=64'h0000_0000_0000_00ff;
b=64'h0000_0000_0000_00ff;
#100 $finish;
end
always@(proda or prodb)
product={proda,prodb};
initial
$monitor($time," clk=%b a=%h\nb=%h\nprod=%h\n",clk,a,b,product);
endmodule*/
