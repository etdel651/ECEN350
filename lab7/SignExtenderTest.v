`timescale 1ns / 1ps

module SignExtenderTest;

   reg [15:0] Imm16;     // Inputs
   reg Ctrl;
   wire [31:0] BusImm;   // Outputs
 
   SignExtender uut (
      .BusImm(BusImm), 
      .Imm16(Imm16), 
      .Ctrl(Ctrl));

   initial begin
      Imm16 = 0;
      Ctrl = 0;
      #100;              // Wait 100 ns
      Ctrl =0;           //Sign Extension
      Imm16 = 16'hffff;
      #10 
      Imm16 = 16'h0fff;
      #5 
      Ctrl = 1;          //Zero Extension
      Imm16 = 16'hffff;
      #10 
      Imm16 = 16'h0fff;
   end

endmodule
