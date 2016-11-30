`timescale 1ns / 1ps
module ALUControl(ALUCtrl, ALUop, FuncCode);
input [3:0] ALUop;
input [5:0] FuncCode;
output reg [3:0] ALUCtrl;
	

always @ (*)
begin
if(ALUop==4'b1111)
	begin


		
		//values from the table in the lab that are R instructions 
		if (FuncCode == 6'b000000)begin ALUCtrl = #2 4'b0011; end //SLL
		if (FuncCode == 6'b000010) begin ALUCtrl = #2 4'b0100; end  //SRL
		if (FuncCode == 6'b100000) begin  ALUCtrl = #2 4'b0010; end  //ADD
		if (FuncCode == 6'b100010) begin  ALUCtrl = #2 4'b0110; end  //SUB
		if (FuncCode == 6'b100101)begin ALUCtrl = #2 4'b0001; end //OR
		if (FuncCode == 6'b100100) begin ALUCtrl = #2 4'b0000; end  //AND
		if (FuncCode == 6'b101010) begin ALUCtrl = #2 4'b0111; end //SLT
		
		
		//values from the test bench 
		if (FuncCode == 6'b111000) begin ALUCtrl = #2 4'b0101; end //MULA
		if (FuncCode == 6'b100001) begin ALUCtrl = #2 4'b1000;end //ADDU
		if (FuncCode == 6'b100011) begin  ALUCtrl = #2 4'b1001;end //SUBU
		if (FuncCode == 6'b100110) begin ALUCtrl = #2 4'b1010; end //XOR
		if (FuncCode == 6'b101011) begin ALUCtrl = #2 4'b1011; end  //SLTU
		if (FuncCode == 6'b100111) begin ALUCtrl = #2 4'b1100; end  //NOR
		if (FuncCode == 6'b000011) begin ALUCtrl = #2 4'b1101; end //SRA
		



end
//else statement for i type instructions 
else

  ALUCtrl = #2 ALUop;



end
	
endmodule




