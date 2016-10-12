

module HalfAdd(A, B, Cout, Sum);

input A,B;
output Cout,Sum;
wire S1, S2, S3;

nand NAND1 (S3, A, B);
nand NAND2 (S1, A, S3);
nand NAND3 (S2, S3, Y);
nand NAND4 (Sum, S1, S2);
assign Cout=S3;

endmodule 
