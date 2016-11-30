`timescale 1ns / 1ps 

module NextPClogic(NextPC, CurrentPC, JumpField, SignExtImm32, Branch, ALUZero, Jump);
input [31:0] CurrentPC, SignExtImm32;
input [25:0] JumpField;
input Branch, ALUZero, Jump;
output reg [31:0] NextPC;
reg [31:0] NextPC;  //make this reg because its referred to in the always statement
wire [31:0] BranchOffset,JumpAddress;
wire [31:0] JumpSource;

assign JumpSource = CurrentPC+32'd4;
assign BranchOffset = SignExtImm32<<2;
assign JumpAddress = {JumpSource[31:28], JumpField, 2'b00};

always @(*) begin 

 if (Branch && ALUZero) NextPC <= #3 (CurrentPC + 32'd4 + BranchOffset); 

else 
 if (Jump)  NextPC <= #3 JumpAddress;

  else NextPC <= #2 CurrentPC+32'd4;

  end
endmodule
