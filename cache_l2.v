module cache_l2(in,out,ch,mode,st,procinfo,sprocinfo);
	input [63:0]in;
	input [1:0]mode;
	input [31:0]st;
	input ch;
	input [1:0]procinfo;
	output reg [3:0]sprocinfo;//store the procinfo whenever read
	reg [3:0]proc[0:1023];
	output [63:0]out;
	reg [63:0]out;
	reg [64*16-1:0]mem[0:1023];
	integer i,row;
	reg c[0:1];
	always@(mode or st)
	begin
		if(mode==2'b11)//write
		begin
			for(i=0;i<1024;i=i+1)
				if(i==st[13:4])
					row=i;
			case(st[3:0])
				4'b0000:mem[row][63:0]=in;
				4'b0001:mem[row][127:64]=in;
				4'b0010:mem[row][191:128]=in;
				4'b0011:mem[row][255:192]=in;
				4'b0100:mem[row][319:256]=in;
				4'b0101:mem[row][383:320]=in;
				4'b0110:mem[row][447:384]=in;
				4'b0111:mem[row][511:448]=in;
				4'b1000:mem[row][575:512]=in;
				4'b1001:mem[row][639:576]=in;
				4'b1010:mem[row][703:640]=in;
				4'b1011:mem[row][767:704]=in;
				4'b1100:mem[row][831:768]=in;
				4'b1101:mem[row][895:832]=in;
				4'b1110:mem[row][959:896]=in;
				4'b1111:mem[row][1023:960]=in;
			endcase
			if(procinfo==2'b00)//processor 0 wants to write
			begin
				sprocinfo={proc[row][3:1],1'b0};
			end
			else if(procinfo==2'b01)//processor 1 wants to write
			begin
				sprocinfo={proc[row][3:2],1'b0,proc[row][0]};
			end
			else if(procinfo==2'b10)//processor 2 wants to write
			begin
				sprocinfo={proc[row][3],1'b0,proc[row][1:0]};
			end
			else if(procinfo==2'b11)//processor 3 wants to write
			begin
				sprocinfo={1'b0,proc[row][2:0]};
			end

		end
		else if(mode==2'b00)//read
		begin
			if(ch==1'b0)
			begin
				for(i=0;i<1024;i=i+1)
					if(i==st[13:4])
						row=i;
				case(st[3:0])
					4'b0000:out=mem[row][63:0];
					4'b0001:out=mem[row][127:64];
					4'b0010:out=mem[row][191:128];
					4'b0011:out=mem[row][255:192];
					4'b0100:out=mem[row][319:256];
					4'b0101:out=mem[row][383:320];
					4'b0110:out=mem[row][447:384];
					4'b0111:out=mem[row][511:448];
					4'b1000:out=mem[row][575:512];
					4'b1001:out=mem[row][639:576];
					4'b1010:out=mem[row][703:640];
					4'b1011:out=mem[row][767:704];
					4'b1100:out=mem[row][831:768];
					4'b1101:out=mem[row][895:832];
					4'b1110:out=mem[row][959:896];
					4'b1111:out=mem[row][1023:960];
				endcase
				if(procinfo==2'b00)//processor 0 wants to read
					proc[row][0]=1'b1;
				else if(procinfo==2'b01)//processor 1 wants to read
					proc[row][1]=1'b1;
				else if(procinfo==2'b10)//processor 2 wants to read
					proc[row][2]=1'b1;
				else if(procinfo==2'b11)//processor 3 wants to read
					proc[row][3]=1'b1;
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
	cache_l2 c0(a,b,mode,st);
	initial
		begin
			a=64'h1111_1111_1111_1111;
			mode=2'b11;
			st=32'h1111_0011;
			#1
			a=64'h1111_0000_1111_1111;
			mode=2'b11;
			st=32'h1111_0001;
			#1
			mode=2'b00;
			st=32'h1111_0001;
			#1
			mode=2'b00;
			st=32'h1111_0011;
			
		end
	initial
		$monitor($time," a=%b  b=%b  mode=%b st=%b\n",a,b,mode,st[10:0]);
endmodule
*/

