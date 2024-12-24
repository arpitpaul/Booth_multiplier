`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2024 14:13:03
// Design Name: 
// Module Name: dreg
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


module dreg(
input data_in,clk,clr,
output reg data_out
    );
    
    always@(posedge clk)
    begin
     if(clr)
       data_out <= 1'b0;
     else
        data_out <= data_in;
    
    end
endmodule
