`timescale 1ns / 1ps 

module NextPClogic(NextPC, CurrentPC, JumpField, SignExtImm32, Branch, ALUZero, Jump);
input [31:0] CurrentPC, SignExtImm32;
input [25:0] JumpField;
input Branch, ALUZero, Jump;
output reg [31:0] NextPC;
// reg [31:0] NextPC;  //make this reg because its referred to in the always statement
wire [31:0] BranchOffset,JumpAddress;
wire [31:0] JumpSource;



always @(*) begin 
$monitor("@ time=%0d NextPC=%b, CurrentPC=%b, JumpField=%b, SigExtImm32=%b, Branch=%b ALUZero=%b, Jump=%b", $time, CurrentPC, JumpField,SignExtImm32, Branch, ALUZero, Jump, NextPC );
NextPC = (CurrentPC + 4);

 if (Branch && ALUZero) begin NextPC <= #3 (CurrentPC + 4 + SignExtImm32*4); 
$display("@ time=%0d NextPC=%b, CurrentPC=%b, JumpField=%b, SigExtImm32=%b, Branch=%b ALUZero=%b, Jump=%b", $time, CurrentPC, JumpField,SignExtImm32, Branch, ALUZero, Jump, NextPC );
end

else if (Jump)  begin 

NextPC <= #3 {NextPC[31:28], JumpField, 2'b00};
$display("@ time=%0d NextPC=%b, CurrentPC=%b, JumpField=%b, SigExtImm32=%b, Branch=%b ALUZero=%b, Jump=%b", $time, CurrentPC, JumpField,SignExtImm32, Branch, ALUZero, Jump, NextPC );
end

  else begin NextPC <= #2 CurrentPC+32'd4;
$display("@ time=%0d NextPC=%b, CurrentPC=%b, JumpField=%b, SigExtImm32=%b, Branch=%b ALUZero=%b, Jump=%b", $time, CurrentPC, JumpField,SignExtImm32, Branch, ALUZero, Jump, NextPC );
  end
end
endmodule
