`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2025 19:11:32
// Design Name: 
// Module Name: Overlapping1011
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


module Overlapping1011(
    input in, clk, reset,
    output y
    );
    
    reg [2:0] state, nextstate;
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;
    
    always@(posedge clk)begin
        if(reset)
            state <= s0;
        else
            state <= nextstate;
    end
    
    always@(*)begin
        case(state)
            s0 : if(in) nextstate = s1; else nextstate = s0;
            s1 : if(in) nextstate = s1; else nextstate = s2;
            s2 : if(in) nextstate = s3; else nextstate = s0;
            s3 : if(in) nextstate = s4; else nextstate = s2;
            s4 : if(in) nextstate = s1; else nextstate = s2;
        endcase
    end
    
    assign y = (state == s4);
endmodule
