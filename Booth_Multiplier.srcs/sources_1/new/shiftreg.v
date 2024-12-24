`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mr. Arpit Paul
// 
// Create Date: 21.12.2024 14:00:13
// Design Name: 
// Module Name: shiftreg
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


module shiftreg(
input [7:0] data_in,
input load, clr, sft, sin,clk,
output reg [7:0] data_out 
    );
    
    always@(posedge clk)
    begin
     if(load)
      data_out <= data_in;
     else if(clr)
      data_out <= 8'd0;
     else if(sft)
       data_out <= {sin, data_out[7:1]};
    end
endmodule
