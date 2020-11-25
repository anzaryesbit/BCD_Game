`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2020 05:15:24 AM
// Design Name: 
// Module Name: NS_CNTR
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


module NS_CNTR(
    input UP, input CLK,
    input R,
    input reg [3:0] NUM = 0,
    output reg [3:0] NUMP
    );
    
    always_ff @ (posedge CLK)
    begin
        if (UP == 1) NUMP <= NUM + 1;
        else if (R == 1) NUMP <= 0;
        else NUMP <= NUM;
    end
    
endmodule
