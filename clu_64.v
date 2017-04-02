`include "alu_64.v"
`include "regfile_64.v"

module clu_64(in1,in2,a,b,opcode,result,result1,cflag,zflag);
input [63:0]a,b;
input [31:0]opcode;
output cflag,zflag;
reg cflag,zflag;
output [63:0]result,result1,in1,in2;
reg [63:0]result,result1,in1,in2;

wire [63:0]busC,busD;
wire cf,zf;
reg [3:0]aluop;
reg [63:0]busA,busB,wbusA,wbusB;
wire [63:0]out;
reg [63:0]in;
reg [4:0]st;
reg [1:0]mode;
alu_64 alu0(busA,busB,busC,busD,aluop,cf,zf);//~#70 cycles
regfile_64 regfile0(in,out,mode,st);//~#30 cycles

always @(opcode)
begin
if(opcode[1:0]==2'b11)
begin
in=a;
mode=2'b11;
st=opcode[14:10];
end

else if(opcode[1:0]==2'b00)
begin
mode=2'b00;
st=opcode[14:10];
#1 wbusA=out;
in1=out;
end

if(opcode[3:2]==2'b11)
begin
in=b;
mode=2'b11;
st=opcode[19:15];
end

else if(opcode[3:2]==2'b00)
begin
mode=2'b00;
st=opcode[19:15];
#1 wbusB=out;
in2=out;
end

if(opcode[31]==1'b1)
begin
 aluop=opcode[9:6];
 busA=wbusA;
 busB=wbusB;

#15 result=busC;
result1=busD;
cflag=cf;
zflag=zf;
end
 

if(opcode[5:4]==2'b11)
begin
if(opcode[9:6]==4'b0111||opcode[9:6]==4'b1010)
begin
mode=2'b11;
in=result;
st=opcode[24:20];
#1
in=result1;
st=opcode[29:25];
end
else
begin
mode=2'b11;
in=result;
st=opcode[24:20];
end
end

end
endmodule






