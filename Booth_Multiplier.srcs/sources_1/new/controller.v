`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2024 17:21:55
// Design Name: 
// Module Name: controller
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


module controller(
input start,clk,qd,eqz,
output reg ldA,sftA,clrA,ldQ,sftQ,clrQ,ldM,clrD,ldC,dec,addsub,done,
input [7:0] data_outQ

    );
    
    reg [2:0] state;
    parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3, s4= 3'd4, s5= 3'd5, s6=3'd6;
    
    always @(posedge clk)
    begin
     case(state)
      s0: if(start)
           state <= s1;
      s1: state <= s2;
      s2: begin
      
       if({data_outQ[0],qd}==2'b01)
          state <= s4;
        else if({data_outQ[0],qd}==2'b10)
          state <= s5;
         else if({data_outQ[0],qd}==2'b11||{data_outQ[0],qd}==2'b00)
          state <= s3;  
         
      end
      
      s3: begin 
      
              if({data_outQ[0],qd}==2'b01 && !eqz)
                state <= s4;
              else if({data_outQ[0],qd}==2'b10 && !eqz)
                state <= s5;
              else if(eqz)
                state <= s6;
            
            end
       
       
       s4: state <= s3;
       s5: state <= s3;
       
       s6 : state <= s6;
       
       default : state <= s0;
     endcase
    end
    
    always @(state)
    begin
    
    case(state)
    s0: begin
      ldA =0;sftA =0;clrA =0;ldQ =0;sftQ =0;clrQ =0;ldM =0;clrD =0;done =0;
    end
    s1: begin
      clrA =1; clrD =1; ldM =1;ldC=1;
    end
    
    s2: begin
      clrA =0; clrD=0; ldQ =1; ldM =0; ldC  =0;
    end
    
    s3: begin
      ldQ=0;  sftA =1; sftQ =1; dec =1; ldA=0;
  
    end
    
    s4: begin
       addsub = 1; sftA=0; sftQ=0;ldA=1; dec=0; ldQ=0;
    end
    
    s5: begin
      addsub =0; sftA =0;sftQ=0; ldA=1; dec =0;ldQ=0;
    end
    
    s6: done = 1;
    
    default : begin
     ldA =0;sftA =0;clrA =0;ldQ =0;sftQ =0;clrQ =0;ldM =0;clrD =0;ldC =0;dec =0;done =0;
    
    end
    
    endcase
    end
endmodule
