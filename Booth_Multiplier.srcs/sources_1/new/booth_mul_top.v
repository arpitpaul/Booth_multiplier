`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mr. Arpit Paul
// 
// Create Date: 22.12.2024 23:24:08
// Design Name: 
// Module Name: booth_mul_top
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


module booth_mul_top(
input [7:0] data_in,
input clk,start,
output done,
output [15:0] data_out
    );
    
    wire ldA,sftA,clrA,ldQ,sftQ,clrQ,ldM,clrD,ldC,dec,addsub,qd,eqz;
    wire [7:0]q;
    
  
    booth B1(ldA,sftA,clrA,ldQ,sftQ,clrQ,ldM,clrD,ldC,dec,addsub,clk,data_in,qd,eqz,q,data_out);
    controller C1(start,clk,qd,eqz,ldA,sftA,clrA,ldQ,sftQ,clrQ,ldM,clrD,ldC,dec,addsub,done,q);
endmodule
