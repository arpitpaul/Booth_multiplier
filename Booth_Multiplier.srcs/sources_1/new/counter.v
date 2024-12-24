`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2024 14:19:22
// Design Name: 
// Module Name: counter
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


module counter(
  output reg [3:0] data_out,
  input load,dec,clk
    );
    
    always @(posedge clk)
    begin
     if(load)
      data_out <= 4'd8;
      else if(dec)
       data_out <= data_out - 1;
    
    end
endmodule
