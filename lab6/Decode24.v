module Decode24(out, in);
input [1:0] in;
output reg [3:0] out;
wire [1:0] in;

always @ (in) begin
case (in)

0: out = 8;
1: out = 4;
2: out = 2;
default: out= 1;
endcase 
end

endmodule
