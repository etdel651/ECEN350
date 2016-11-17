`timescale 1ns / 1ps
`define AND 4'b0000
`define OR 4'b0001
`define ADD 4'b0010
`define SLL 4'b0011
`define SRL 4'b0100
`define SUB 4'b0110
`define SLT 4'b0111
`define ADDU 4'b1000
`define SUBU 4'b1001
`define XOR 4'b1010
`define SLTU 4'b1011
`define NOR 4'b1100
`define SRA 4'b1101
`define LUI 4'b1110

module ALU(BusW, Zero, BusA, BusB, ALUCtrl);
    
    parameter n = 32;

    output  [n-1:0] BusW;
    input   [n-1:0] BusA, BusB;
    input   [3:0] ALUCtrl;
    output  Zero;
	 wire [31:0] BusA_cmp,BusB_cmp;
	 
    assign BusA_cmp = {~(BusA[31]),BusA[30:0]};
	 assign BusB_cmp = {~(BusB[31]),BusB[30:0]};
    reg     [n-1:0] BusW;
    
    always @(ALUCtrl or BusA or BusB) begin
        case(ALUCtrl)
         `AND: begin BusW <= #20 BusA & BusB; end
         `OR: begin BusW <= #20 BusA | BusB;  end
	`ADD: begin BusW <= #20 BusA + BusB; end
	`SLL: begin BusW <= #20 BusA << BusB; end
	`SRL: begin BusW <= #20 BusA >> BusB; end
	`SUB: begin BusW <= #20 BusA - BusB; end
	`SLT: begin BusW <= #20 (BusA_cmp < BusB_cmp) ? 1 : 0; end
	`ADDU: begin BusW <= #20 BusA + BusB; end
	`SUBU: begin BusW <= #20 BusA - BusB; end
	`XOR: begin BusW <= #20 BusA ^ BusB; end
	`SLTU: begin BusW <= #20 (BusA < BusB) ? 1 : 0; end
	`NOR: begin BusW <= #20 ~(BusA | BusB); end
	`SRA: begin BusW <= #20 $signed(BusA) >>> BusB; end
	`LUI: begin BusW [31:16] <= BusB [15:0];
		BusW [15:0] <= 16'b0; end
        endcase
    end
	assign #1 Zero = (BusW==32'b0) ? 1: 0;
endmodule
