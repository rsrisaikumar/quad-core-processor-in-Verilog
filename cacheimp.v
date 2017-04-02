`include "cache_l1.v"
`include "cache_l2.v"
module cache(in,out,mode,st,proin);
	input [63:0]in;
	input [1:0]mode;
	input [31:0]st;
	output reg [63:0]out;
	input [1:0]proin;
	reg [1:0]procinfo;
	wire [3:0]sprocinfo;
	reg [1:0]mode0,mode1,mode2,mode3,modee;
	reg [31:0]st0,st1,st2,st3,stt;
	reg [63:0]in0,in1,in2,in3,inn;
	wire [63:0]out0,out1,out2,out3,outt;
	wire ch0,ch1;
	reg chh;
	cache_l2 cl(inn,outt,chh,modee,stt,procinfo,sprocinfo);
	cache_l1 cl0(in0,out0,mode0,st0,ch0);
	cache_l1 cl1(in1,out1,mode1,st1,ch1);
	cache_l1 cl2(in2,out2,mode2,st2,ch2);
	cache_l1 cl3(in3,out3,mode3,st3,ch3);
	always@(mode or st)
	begin
		if(proin==2'b00&&mode==2'b00)//read from cache issued by processor 0
		begin
			mode0=mode;
			st0=st;
			#1
			out=out0; 
			if(out0==64'bx)//not found in l1 cache
			begin
				chh=ch0;
				procinfo=2'b00;
				modee=mode;
				stt=st;
				#1 
				out=outt;//to be outputted
				#1
				in0=outt;//write into l1 cache
       			        mode0=2'b11;
                     	        st0=st;  
			end
			$display("out data:%d %b %b",out0,mode,st);
		end
		else if(proin==2'b01&&mode==2'b00)//read from cache issued by processor 1
		begin
			mode1=mode;
			st1=st;
			#1
			out=out1; 
			if(out1==64'bx)//not found in l1 cache
			begin
				procinfo=2'b01;
				chh=ch1;
				modee=mode;
				stt=st;
				#1
				out=outt;//to be outputted
				#1
				in1=outt;//write into l1 cache
			        mode1=2'b11;
				st1=st;  
			end
		end
		else if(proin==2'b10&&mode==2'b00)//read from cache issued by processor 2
		begin
			mode2=mode;
			st2=st;
			#1
			out=out2; 
			if(out2==64'bx)//not found in l1 cache
			begin
				procinfo=2'b10;
				chh=ch2;
				modee=mode;
				stt=st;
				#1
				out=outt;//to be outputted
				#1
				in2=outt;//write into l1 cache
			        mode2=2'b11;
				st2=st;  
			end
		end
		else if(proin==2'b11&&mode==2'b00)//read from cache issued by processor 1
		begin
			mode3=mode;
			st3=st;
			#1
			out=out3; 
			if(out3==64'bx)//not found in l1 cache
			begin
				procinfo=2'b11;
				chh=ch3;
				modee=mode;
				stt=st;
				#1
				out=outt;//to be outputted
				#1
				in3=outt;//write into l1 cache
			        mode3=2'b11;
				st3=st;  
			end
		end
	
		if(proin==2'b00&&mode==2'b11)
		begin
			in0=in;
			mode0=mode;
			st0=st;
			$display("in data:%d %b %b",in,mode,st);
			inn=in;//write through
			modee=mode;
			stt=st;
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
		else if(proin==2'b01&&mode==2'b11)
		begin
			in1=in;
			mode1=mode;
			st1=st;
			inn=in;//write through
			modee=mode;
			stt=st;
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
		else if(proin==2'b10&&mode==2'b11)
		begin
			in2=in;
			mode2=mode;
			st2=st;
			$display("in data:%d %b %b",in,mode,st);
			inn=in;//write through
			modee=mode;
			stt=st;
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
		else if(proin==2'b11&&mode==2'b11)
		begin
			in3=in;
			mode3=mode;
			st3=st;
			inn=in;//write through
			modee=mode;
			stt=st;
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
endmodule



/*
module s;
	reg[63:0]a;
	wire [63:0]b;
	reg [1:0]mode;
	reg [31:0]st;
	reg proin;
	cache c0(a,b,mode,st,proin);
	initial
		begin
			proin=1'b0;
			a=64'h1111_1111_1111_1111;
			mode=2'b11;
			st=32'h1111_0011;
			#12
			a=64'h1111_0000_1111_1111;
			mode=2'b11;
			st=32'h1111_0001;
			#12
			mode=2'b00;
			st=32'h1111_0001;
			#12
			mode=2'b00;
			st=32'h1111_0011;
			
		end
	initial
		$monitor($time," a=%b  b=%b  mode=%b st=%b\n",a,b,mode,st);
endmodule
*/


