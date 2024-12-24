`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2024 14:45:08
// Design Name: 
// Module Name: booth
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


module booth(
input ldA,sftA,clrA,ldQ,sftQ,clrQ,ldM,clrD,ldC,dec,addsub,clk,
input [7:0] data_in,
output qd,eqz,
output [7:0] data_outQ,
output [15:0] data_out
    );
    
    wire [7:0]Z,data_outA,data_outM;
    wire [3:0] count;
    
    assign eqz = ~|count;
    assign data_out = {data_outA,data_outQ};
    shiftreg A(Z,ldA,clrA,sftA,data_outA[7],clk,data_outA);
    shiftreg Q(data_in,ldQ,clrQ,sftQ,data_outA[0],clk,data_outQ);
    PIPO M(data_in,ldM,clk,data_outM);
    dreg D(data_outQ[0],clk,clrD,qd);
    counter C(count,ldC,dec,clk);
    opaddsub O(Z,data_outA,data_outM,addsub);
endmodule
