module v(c,b,d);
input [1:0]b;
input [1:0]d;
output reg[1:0]c;

reg [1:0]a[0:1];
always@(b)
begin
a[b]=2'b00;
c=b;
$display("%b a",a[b]);
end
always@(d)
begin
a[d]=2'b11;
c=d;
$display("%b a",a[d]);
end
endmodule


module s;
reg [1:0]b,d;
wire [1:0]c;
reg f;
v v0(c,b,d);
initial
begin
b=2'b01;
#2 b=2'b00;
#1 d=2'b11;
end
initial
$monitor("%b  %b %b %b",c,b,d,f);

endmodule
