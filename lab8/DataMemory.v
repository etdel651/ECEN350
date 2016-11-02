`timescale 1ns / 1ps
module DataMemory (ReadData, Address, WriteData, MemoryRead, MemoryWrite, Clock);
input [31:0] Address, WriteData;
input MemoryRead, MemoryWrite, Clock;
output reg [31:0] ReadData;
reg [31:0] memloc[63:0];   //memory locations

always @(negedge Clock)
begin 
if(MemoryWrite && !MemoryRead)
begin 
  memloc[Address>>2] <= #20 WriteData;

end
end
always @(posedge Clock)
begin
if(MemoryRead && !MemoryWrite)
begin
ReadData <= #20 memloc[Address>>2];

end
end
endmodule
