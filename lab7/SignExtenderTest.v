

module SignExtenderTest;

   reg [15:0] Imm16;     
   reg Ctrl;
   wire [31:0] BusImm;   
 
   SignExtender uut (
      .BusImm(BusImm), 
      .Imm16(Imm16), 
      .Ctrl(Ctrl));

   initial begin
      Imm16 = 0;
      Ctrl = 0;
      Ctrl =0;           //Sign Extension
      #10 Imm16 = 16'hffff;
      #10 Imm16 = 16'h0000;
      Ctrl = 1;          //Zero Extension
     #10 Imm16 = 16'hffff;
     #10 Imm16 = 16'h0000;
   end

endmodule
