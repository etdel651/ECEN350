

module HalfAdd(Cout, Sum, A, B);

input A,B;
output Cout,Sum;

xor xor1(Sum, A, B);
and and1(Cout, A, B);



endmodule 
