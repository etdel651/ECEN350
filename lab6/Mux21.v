
module Mux21(out, in, sel);
input [1:0] in;
input sel;
output out;
wire A, B, sel_n;

not Not1(sel_n, sel);
and And1(A, in[0], sel_n);
and And2(B, in[1], sel);
or Or1(out, A, B);

endmodule

