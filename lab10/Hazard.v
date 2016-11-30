`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:     
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
//
//
//////////////////////////////////////////////////////////////////////////////////x
`define Jump0    3'b000
`define NoHazard 3'b001
`define Bubble0  3'b010
`define Bubble1 3'b011
`define Branch0 3'b100
`define Branch1  3'b101
`define Branch2 3'b110

module Hazard(PCWrite, IFWrite, Bubble, Branch, ALUZero4, Jump, rw, rs, rt, Reset_L, CLK);
	input			Branch;
	input			ALUZero4;
	input			Jump;
	input	[4:0]	rw;
	input	[4:0]	rs;
	input	[4:0]	rt;
	input			Reset_L;
	input			CLK;
	output reg		PCWrite;
	output reg		IFWrite;
	output reg		Bubble;
	
	/*state definition for FSM*/
	parameter NoHazard_state = 	3'b000, 
			Bubble0_state = 3'b010,  
			Bubble1_state = 3'b011,  
			Jump0_state = 	3'b001, 
			Branch2_state = 3'b110,  
			Branch1_state = 3'b101,  
			Branch0_state = 3'b100;				 
	
	/*internal signals*/
	wire cmp1, cmp2, cmp3;
	
	/*internal state*/
	reg [2:0] FSM_state, FSM_nxt_state;
	reg [4:0] rw1,rw2,rw3; //rw history registers
	
	/*create compare logic*/
	assign  cmp1 = (((rs==rw1)||(rt==rw1))&&(rw1!= 0)) ? 1:0;
	assign  cmp2 = (((rs==rw2)||(rt==rw2))&&(rw2!= 0)) ? 1:0;
	assign  cmp3 = (((rs==rw3)||(rt==rw3))&&(rw3!= 0)) ? 1:0;


	/*keep track of rw*/
	always @(negedge CLK) begin
		if(Reset_L ==  0) begin
			rw1 <= #1  0;
			rw2 <= #1 0;
			rw3 <= #1  0;
		end
		else begin
			rw1 <= Bubble?0:rw;//if bubble, clear, else, procede
			rw2 <= rw1;//are always conserved for running instruction
			rw3 <= rw2;//are always conserved for running instruction
		end
	end
	
		
	/*FSM state register*/
	always @(negedge CLK) begin
		if(Reset_L == 0) 
			FSM_state <= 0;
		else
			FSM_state <= FSM_nxt_state;
	end
	
	/*FSM next state and output logic*/
	always @(*) begin //combinatory logic
		case(FSM_state)
			NoHazard_state: begin 
				if(Jump== 1) begin //prioritize jump
				  	FSM_nxt_state <= #2 Jump0_state;
			  		PCWrite <= #2 1; 
			  		IFWrite <= #2 0;
                          		Bubble <= #2 1'bx; 	
					end
				else if(Jump==0 && Branch== 1 && cmp1==0 && cmp2==0 && cmp3==0)begin
					FSM_nxt_state <= #2 Branch0_state;
			  		PCWrite <= #2 0; 
			  		IFWrite <= #2 0;
                          		Bubble <= #2 0; 
				end
				else if(Jump==0 && cmp1== 1) begin //3-delay data hazard
					FSM_nxt_state <= #2 Bubble0_state;
			  		PCWrite <= #2 0; 
			  		IFWrite <= #2 0;
                          		Bubble <= #2 1; 
				end
				else if(Jump==0 && cmp1== 0 && cmp2== 1) begin
					FSM_nxt_state <= #2 Bubble1_state;
			  		PCWrite <= #2 0; 
			  		IFWrite <= #2 0;
                          		Bubble <= #2 1; 
				end
				else if(Jump==0 && cmp1==0 && cmp2==0 && cmp3==1)begin
					FSM_nxt_state <= #2 NoHazard_state;
			  		PCWrite <= #2 0; 
			  		IFWrite <= #2 0;
                          		Bubble <= #2 1; 
				end 

				else begin
					FSM_nxt_state <= #2 NoHazard_state;
			  		PCWrite <= #2 1; 
			  		IFWrite <= #2 1;
                          		Bubble <= #2 0;  
				end 
				
			end

			Jump0_state: begin
				FSM_nxt_state <= #2 NoHazard_state;
				PCWrite <= #2 1; 
				IFWrite <= #2 1;
		                Bubble <= #2 1'bx; 
			end
 
			Bubble0_state: begin
				FSM_nxt_state <= #2 Bubble1_state;
				PCWrite <= #2 0; 
				IFWrite <= #2 0;
		                Bubble <= #2 1; 
			end
			
			Bubble1_state:begin
				FSM_nxt_state <= #2 NoHazard_state;
				PCWrite <= #2 0; 
				IFWrite <= #2 0;
		                Bubble <= #2 1; 
			end
			
			Branch0_state:begin
				FSM_nxt_state <= #2 Branch1_state;
				PCWrite <= #2 0; 
				IFWrite <= #2 0;
		        	Bubble <= #2 1; 
			end
			
			Branch1_state:begin
				if(ALUZero4)begin //branch taken
				  FSM_nxt_state <= #2 Branch2_state;
				  PCWrite <= #2 1; 
				  IFWrite <= #2 0;
		                  Bubble <= #2 1; 
				end
				else begin  //branch not taken
				  FSM_nxt_state <= #2 NoHazard_state;
				  PCWrite <= #2 1; 
				  IFWrite <= #2 1;
		                  Bubble <= #2 1; 
				end 
			end 

			Branch2_state:begin
				  FSM_nxt_state <= #2 NoHazard_state;
				  PCWrite <= #2 1; 
				  IFWrite <= #2 1;
		                  Bubble <= #2 1; 
				end 
			
			default: begin
				FSM_nxt_state <= #2 NoHazard_state;
				PCWrite <= #2 1'bx;
				IFWrite <= #2 1'bx;
				Bubble  <= #2 1'bx;
			end
		endcase
	end
endmodule



				

