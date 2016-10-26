`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joseph DeLeonardis
//
// Create Date:   10:13:28 03/03/2009
// Design Name:   RegisterFile
// Module Name:   E:/350/Lab7/RegisterFile/RegisterFileTest.v
// Project Name:  RegisterFile
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define STRLEN 32
module RegisterFileTest_v;


	task passTest;
		input [31:0] actualOut, expectedOut;
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

	// Inputs
	reg [31:0] BusW;
	reg [4:0] RA;
	reg [4:0] RB;
	reg [4:0] RW;
	reg RegWr;
	reg Clk;
	reg [7:0] passed;

	// Outputs
	wire [31:0] BusA;
	wire [31:0] BusB;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.BusA(BusA), 
		.BusB(BusB), 
		.BusW(BusW), 
		.RA(RA), 
		.RB(RB), 
		.RW(RW), 
		.RegWr(RegWr), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		BusW = 0;
		RA = 0;
		RB = 0;
		RW = 0;
		RegWr = 0;
		Clk = 1;
		passed = 0;
		
		#10;

		// Add stimulus here
		
		
		
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd0, 32'h0, 1'b0};
		passTest(BusA, 32'h0, "Initial $0 Check 1", passed);
		passTest(BusB, 32'h0, "Initial $0 Check 2", passed);
		#5; Clk = 0; #5; Clk = 1;
		
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd0, 32'h12345678, 1'b1};
		passTest(BusA, 32'h0, "Initial $0 Check 3", passed);
		passTest(BusB, 32'h0, "Initial $0 Check 4", passed);
		#5; Clk = 0; #5; Clk = 1;
		passTest(BusA, 32'h0, "$0 Stays 0 Check 1", passed);
		passTest(BusB, 32'h0, "$0 Stays 0 Check 2", passed);
		
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd0, 32'h0, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd1, 32'h1, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd2, 32'h2, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd3, 32'h3, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd4, 32'h4, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd5, 32'h5, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd6, 32'h6, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd7, 32'h7, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd8, 32'h8, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd9, 32'h9, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd10, 32'h10, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd11, 32'h11, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd12, 32'h12, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd13, 32'h13, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd14, 32'h14, 1'b1};#5; Clk = 0; #5; Clk = 1;
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd15, 32'h15, 1'b1};#5; Clk = 0; #5; Clk = 1;
		
//added the values from the lab `
		{RA, RB, RW, BusW, RegWr} = {5'd0, 5'd1, 5'd0, 32'h00000000, 1'b0};
		#10; Clk 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		{RA, RB, RW, BusW, RegWr} = {5'd2, 5'd3, 5'd1, 32'h00001000, 1'b0};
		#10; Clk= 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		{RA, RB, RW, BusW, RegWr} = {5'd4, 5'd5, 5'd0, 32'h00001000, 1'b1};
		#10; Clk= 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		{RA, RB, RW, BusW, RegWr} = {5'd6, 5'd7, 5'd10, 32'h00001010, 1'b1};
		#10; Clk= 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		{RA, RB, RW, BusW, RegWr} = {5'd8, 5'd9, 5'd11, 32'h00103000, 1'b1};
		#10; Clk= 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		{RA, RB, RW, BusW, RegWr} = {5'd10, 5'd11, 5'd12, 32'h00000000, 1'b0};
		#10; Clk= 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		{RA, RB, RW, BusW, RegWr} = {5'd12, 5'd13, 5'd13, 32'h0000ABCD, 1'b1};
		#10; Clk= 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		{RA, RB, RW, BusW, RegWr} = {5'd14, 5'd15, 5'd14, 32'h09080009, 1'b0};
		#10; Clk= 0; #10; Clk =1;
		$display("BusA: %h, BusB: %h", BusA, BusB);

		
	end
      
endmodule

