`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2024 14:37:58
// Design Name: 
// Module Name: opaddsub
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


module opaddsub(
output reg [7:0] data_out,
input [7:0] a,b,
input addsub
    );
    
    always@(*)
    begin
    if(addsub)
     data_out = a+b;
     else
      data_out = a-b;
    
    end
endmodule
