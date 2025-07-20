`define true 1'b1
`define false 1'b0

`define y2r 3
`define r2g 2
module TSC(
    input x,
    input clear,
    input clk,
    output reg[1:0] hwy,
    output reg[1:0] cntry
    );

reg [1:0] count;

parameter red=2'd0,
yellow=2'd1,
green=2'd2;

parameter s0=3'd0,
s1=3'd1,
s2=3'd2,
s3=3'd3,
s4=3'd4;

reg [2:0] state;
reg [2:0] nxt_state;

always@(posedge clk)
if(clear)
state<=s0;
else
state<=nxt_state;

always@(state)
begin 
hwy=green;
cntry=red;
case(state)
s0: ;
s1:hwy=yellow;
s2:hwy=red;
s3:begin
hwy=red;
cntry=green;
end
s4: begin
hwy=red;
cntry=yellow;
end
endcase
end

always@(state,x)
begin
case(state)
s0: if(x)
nxt_state=s1;
else
nxt_state=s0;

s1: if(count==2'd3)
nxt_state=s1;
else
nxt_state=s2;

s2: if(count==2'd2)
nxt_state=s2;
else
nxt_state=s3;

s3:if(x)
nxt_state=s3;
else
nxt_state=s4;

s4:if(count==2'd2)
nxt_state=s4;
else
nxt_state=s0;
endcase
end
endmodule
