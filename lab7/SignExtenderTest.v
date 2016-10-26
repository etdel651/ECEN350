
`define STRLEN 15
module SignExtenderTest;

task passTest;
		input [3:0] actualOut, expectedOut;
		input [`STRLEN*8:0] testType;
		inout [7:0] passed;
	
		if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
		else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
	endtask
	
	task allPassed;
		input [7:0] passed;
		input [7:0] numTests;
		
		if(passed == numTests) $display ("All tests passed");
		else $display("Some tests failed");
	endtask
	
   reg [15:0] Imm16;     
   reg Ctrl;
   wire [31:0] BusImm;   
 reg [7:0] passed;

   SignExtender uut (
      .BusImm(BusImm), 
      .Imm16(Imm16), 
      .Ctrl(Ctrl));

   initial begin
      Imm16 = 0;
      Ctrl = 0;
      passed = 0;

                
    #10; Imm16 = -2; 	  Ctrl =0; #10; passTest(BusImm, -2, "Input", passed);
    #10; Imm16 = 4; 	  Ctrl =0; #10; passTest(BusImm, 4, "Input", passed);
    #10; Imm16 = 2; 	  Ctrl =1; #10; passTest(BusImm, 2, "Input", passed);
    #10; Imm16 = -4; 	  Ctrl =1; #10; passTest(BusImm, 65532 , "Input", passed);
   
   	
    		allPassed(passed, 4);
		
   end

endmodule
