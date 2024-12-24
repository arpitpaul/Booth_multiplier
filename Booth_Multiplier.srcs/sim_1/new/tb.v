`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mr. Arpit Paul
// 
// Create Date: 24.12.2024 15:43:03
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();

reg [7:0] data_in;
reg clk,start;
wire done;
wire [15:0] data_out;

booth_mul_top dut(data_in,clk,start,done,data_out);
initial begin
clk=1;
data_in = 8'd16;

start = 0;
#7;
start =1;

#6;
start=0;

#4;
data_in = 8'd15;

end

always #5 clk = ~clk;
endmodule
