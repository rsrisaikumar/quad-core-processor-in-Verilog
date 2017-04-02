module fulladd_16(a,b,cin,sum,cout);
input [15:0]a,b;
output [15:0]sum;
output cout;
input cin;
wire [14:0]c;
assign c[0]=(a[0]&b[0])|(cin&b[0])|(a[0]&cin);
assign sum[0]=a[0]^b[0]^cin;
assign c[1]=(a[1]&b[1])|(c[0]&b[1])|(a[1]&c[0]);
assign sum[1]=a[1]^b[1]^c[0];
assign c[2]=(a[2]&b[2])|(c[1]&b[2])|(a[2]&c[1]);
assign sum[2]=a[2]^b[2]^c[1];
assign c[3]=(a[3]&b[3])|(c[2]&b[3])|(a[3]&c[2]);
assign sum[3]=a[3]^b[3]^c[2];
assign c[4]=(a[4]&b[4])|(c[3]&b[4])|(a[4]&c[3]);
assign sum[4]=a[4]^b[4]^c[3];
assign c[5]=(a[5]&b[5])|(c[4]&b[5])|(a[5]&c[4]);
assign sum[5]=a[5]^b[5]^c[4];
assign c[6]=(a[6]&b[6])|(c[5]&b[6])|(a[6]&c[5]);
assign sum[6]=a[6]^b[6]^c[5];
assign c[7]=(a[7]&b[7])|(c[6]&b[7])|(a[7]&c[6]);
assign sum[7]=a[7]^b[7]^c[6];
assign c[8]=(a[8]&b[8])|(c[7]&b[8])|(a[8]&c[7]);
assign sum[8]=a[8]^b[8]^c[7];
assign c[9]=(a[9]&b[9])|(c[8]&b[9])|(a[9]&c[8]);
assign sum[9]=a[9]^b[9]^c[8];
assign c[10]=(a[10]&b[10])|(c[9]&b[10])|(a[10]&c[9]);
assign sum[10]=a[10]^b[10]^c[9];
assign c[11]=(a[11]&b[11])|(c[10]&b[11])|(a[11]&c[10]);
assign sum[11]=a[11]^b[11]^c[10];
assign c[12]=(a[12]&b[12])|(c[11]&b[12])|(a[12]&c[11]);
assign sum[12]=a[12]^b[12]^c[11];
assign c[13]=(a[13]&b[13])|(c[12]&b[13])|(a[13]&c[12]);
assign sum[13]=a[13]^b[13]^c[12];
assign c[14]=(a[13]&b[14])|(c[13]&b[14])|(a[14]&c[13]);
assign sum[14]=a[14]^b[14]^c[13];
assign cout=(a[15]&b[15])|(c[14]&b[15])|(a[15]&c[14]);
assign sum[15]=a[15]^b[15]^c[14];
endmodule




module fulladd_64(a,b,out,cout);
input [63:0]a,b;
output[63:0]out;
output cout;
wire c0,c1,c2;
assign c0=1'b0;
fulladd_16 f0(a[15:0],b[15:0],c0,out[15:0],c1);
fulladd_16 f1(a[31:16],b[31:16],c1,out[31:16],c2);
fulladd_16 f2(a[47:32],b[47:32],c2,out[47:32],c3);
fulladd_16 f3(a[63:48],b[63:48],c3,out[63:48],cout);
endmodule


/*
module stimulus;
reg[63:0] a,b;
wire[63:0] sum;
wire cout;
fulladd_64 full0(a,b,sum,cout);
initial
begin
a=64'h0000_0000_0000_00ee;
b=64'h0000_0000_0000_00ff;
end
initial
$monitor($time," a=%d\nb=%d\nsum=%d\ncout=%d\n",a,b,sum,cout);
endmodule*/
