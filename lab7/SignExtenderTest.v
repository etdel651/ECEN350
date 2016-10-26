

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
      Ctrl =0;           //Sign Extension
      #10 Imm16 = 16'hffff;
      #10 Imm16 = 16'h0fff;
      Ctrl = 1;          //Zero Extension
     #10 Imm16 = 16'hffff;
     #10 Imm16 = 16'h0fff;
   end

endmodule
