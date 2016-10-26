module SignExtender(BusImm, Imm16, Ctrl);
output [31:0] BusImm;
input [15:0] Imm16;
input Ctrl;

wire lastBit;
assign #1 lastBit = (Ctrl ? 1'b0 : Imm16[15]);
assign BusImm = {{16{lastBit}}, Imm16};

endmodule