module regfile_64(in,out,mode,st);
input [63:0]in;
input [1:0]mode;
input [4:0]st;
output [63:0]out;
reg [63:0]out;
reg [64:0]register[0:32];
always @(mode or st)
begin

if(mode==2'b11)
begin
case (st)
5'b00000:register[0]=in;
5'b00001:register[1]=in;
5'b00010:register[2]=in;
5'b00011:register[3]=in;
5'b00100:register[4]=in;
5'b00101:register[5]=in;
5'b00110:register[6]=in;
5'b00111:register[7]=in;
5'b01000:register[8]=in;
5'b01001:register[9]=in;
5'b01010:register[10]=in;
5'b01011:register[11]=in;
5'b01100:register[12]=in;
5'b01101:register[13]=in;
5'b01110:register[14]=in;
5'b01111:register[15]=in;
5'b10000:register[16]=in;
5'b10001:register[17]=in;
5'b10010:register[18]=in;
5'b10011:register[19]=in;
5'b10100:register[20]=in;
5'b10101:register[21]=in;
5'b10110:register[22]=in;
5'b10111:register[23]=in;
5'b11000:register[24]=in;
5'b11001:register[25]=in;
5'b11010:register[26]=in;
5'b11011:register[27]=in;
5'b11100:register[28]=in;
5'b11101:register[29]=in;
5'b11110:register[30]=in;
5'b11111:register[31]=in;
endcase
end

else if(mode==2'b00)
begin
case (st)
5'b00000:out=register[0];
5'b00001:out=register[1];
5'b00010:out=register[2];
5'b00011:out=register[3];
5'b00100:out=register[4];
5'b00101:out=register[5];
5'b00110:out=register[6];
5'b00111:out=register[7];
5'b01000:out=register[8];
5'b01001:out=register[9];
5'b01010:out=register[10];
5'b01011:out=register[11];
5'b01100:out=register[12];
5'b01101:out=register[13];
5'b01110:out=register[14];
5'b01111:out=register[15];
5'b10000:out=register[16];
5'b10001:out=register[17];
5'b10010:out=register[18];
5'b10011:out=register[19];
5'b10100:out=register[20];
5'b10101:out=register[21];
5'b10110:out=register[22];
5'b10111:out=register[23];
5'b11000:out=register[24];
5'b11001:out=register[25];
5'b11010:out=register[26];
5'b11011:out=register[27];
5'b11100:out=register[28];
5'b11101:out=register[29];
5'b11110:out=register[30];
5'b11111:out=register[31];
endcase
end
end
endmodule
