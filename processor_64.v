`include "clu_64.v"
`include "cache_l1.v"
`include "cache_l2.v"
module processor;
reg [63:0]in,a,b,in0,in1,in2,in3,a0,b0,a1,b1,a2,b2,a3,b3;
reg [31:0]opcode0,opcode1,opcode2,opcode3;
wire [63:0]res01,res02,in01,in02,res11,res12,in11,in12,res21,res22,in21,in22,res31,res32,in31,in32;
wire cf0,zf0,cf1,zf1,cf2,zf2,cf3,zf3;
wire [63:0]out;
reg [1:0]mode,mode0,mode1,mode2,mode3;
reg [31:0]st,st0,st1,st2,st3;
reg [1:0]proin;
reg ch;
wire [3:0]sprocinfo;
wire [63:0]out0,out1,out2,out3;
wire ch0,ch1,ch2,ch3;
clu_64 clu0(in01,in02,a0,b0,opcode0,res01,res02,cf0,zf0);
clu_64 clu1(in11,in12,a1,b1,opcode1,res11,res12,cf1,zf1);
clu_64 clu2(in21,in22,a2,b2,opcode2,res21,res22,cf2,zf2);
clu_64 clu3(in31,in32,a3,b3,opcode3,res31,res32,cf3,zf3);

cache_l1 cl0(in0,out0,mode0,st0,ch0);
cache_l1 cl1(in1,out1,mode1,st1,ch1);
cache_l1 cl2(in2,out2,mode2,st2,ch2);
cache_l1 cl3(in3,out3,mode3,st3,ch3);

cache_l2 c0(in,out,ch,mode,st,proin,sprocinfo);


always@(mode0 or mode1 or mode2 or mode3)
begin
/*the code here should be only those which involves dependencies among all the 4 processors with each other or between the processors and l2 cache*/
		if(proin==2'b00&&mode0==2'b00)//read from cache issued by processor 0
		begin
			#1
			if(out0==64'bx)//not found in l1 cache
			begin
				ch=ch0;
				mode=mode0;
				st=st0;
				#1 
				in0=out;//write into l1 cache
       			        mode0=2'b11;
                     	        st0=st;
				#1
				mode0=2'b00;  
			end
		end
		if(proin==2'b01&&mode1==2'b00)//read from cache issued by processor 1
		begin
			#1
			if(out1==64'bx)//not found in l1 cache
			begin
				ch=ch1;
				mode=mode1;
				st=st1;
				#1 
				in1=out;//write into l1 cache
       			        mode1=2'b11;
                     	        st1=st;
				#1
				mode1=2'b00; 
			end
		end
		if(proin==2'b10&&mode2==2'b00)//read from cache issued by processor 2
		begin
			#1
			if(out2==64'bx)//not found in l1 cache
			begin
				ch=ch2;
				mode=mode2;
				st=st2;
				#1 
				in2=out;//write into l1 cache
       			        mode2=2'b11;
                     	        st2=st;
				#1
				mode2=2'b00; 
			end
		end
		if(proin==2'b11&&mode3==2'b00)//read from cache issued by processor 3
		begin
			#1
			if(out3==64'bx)//not found in l1 cache
			begin
				ch=ch3;
				mode=mode3;
				st=st3;
				#1 
				in3=out;//write into l1 cache
       			        mode3=2'b11;
                     	        st3=st;
				#1
				mode3=2'b00;
			end
		end

		if(proin==2'b00&&mode0==2'b11)
		begin
			in=in0;//write through
			mode=mode0;
			st=st0;
			#1
			if(sprocinfo[1]==1'b1)//coherency
			begin
				in1=in;
				mode1=mode;
				st1=st;
			end
			if(sprocinfo[2]==1'b1)//coherency
			begin
				in2=in;
				mode2=mode;
				st2=st;
			end
			if(sprocinfo[3]==1'b1)//coherency
			begin
				in3=in;
				mode3=mode;
				st3=st;
			end
		end
		if(proin==2'b01&&mode==2'b11)
		begin
			in=in1;//write through
			mode=mode1;
			st=st1;
			#1
			if(sprocinfo[0]==1'b1)//coherency
			begin
				in0=in;
				mode0=mode;
				st0=st;
			end
			if(sprocinfo[2]==1'b1)//coherency
			begin
				in2=in;
				mode2=mode;
				st2=st;
			end
			if(sprocinfo[3]==1'b1)//coherency
			begin
				in3=in;
				mode3=mode;
				st3=st;
			end
		end
		if(proin==2'b10&&mode==2'b11)
		begin
			in=in2;//write through
			mode=mode2;
			st=st2;
			#1
			if(sprocinfo[0]==1'b1)//coherency
			begin
				in0=in;
				mode0=mode;
				st0=st;
			end
			if(sprocinfo[1]==1'b1)//coherency
			begin
				in1=in;
				mode1=mode;
				st1=st;
			end
			if(sprocinfo[3]==1'b1)//coherency
			begin
				in3=in;
				mode3=mode;
				st3=st;
			end
		end
		if(proin==2'b11&&mode==2'b11)
		begin
			in=in3;//write through
			mode=mode3;
			st=st3;
			#1
			if(sprocinfo[0]==1'b1)//coherency
			begin
				in0=in;
				mode0=mode;
				st0=st;
			end
			if(sprocinfo[1]==1'b1)//coherency
			begin
				in1=in;
				mode1=mode;
				st1=st;
			end
			if(sprocinfo[2]==1'b1)//coherency
			begin
				in2=in;
				mode2=mode;
				st2=st;
			end

		end

end

initial
begin
proin=2'b00;
in0=64'h0000_0000_0000_000f;
mode0=2'b11;
st0=32'h0000_1111;
#2
in0=64'h0000_0000_0000_000e;
st0=32'h1001_0010;
#2
mode0=2'b00;
st0=32'h0000_1111;
#2
a0=out0;
st0=32'h1001_0010;
#2
b0=out0;

opcode0=32'b00_00011_00010_00001_00000_0111_01_11_10;//wrt i2
#1 opcode0=32'b00_00011_00010_00001_00000_0111_01_10_11;//wrt i1
#1 opcode0=32'b10_00110_00000_00001_00000_0111_11_00_00;//rd i1 & i2-alu op add
#20 opcode0=32'b10_00110_00000_00001_00000_0101_10_00_00;//
mode0=2'b11;
st0=32'h0000_1110;
#450 $finish;
end
initial
$monitor($time,"\na=%d\nb=%d\nin1=%d\nin2=%d\nres1=%d\nres2=%d\ncf=%d\nzf=%d\nopcode=%b\n",a0,b0,in01,in02,res01,res02,cf0,zf0,opcode0);
endmodule
