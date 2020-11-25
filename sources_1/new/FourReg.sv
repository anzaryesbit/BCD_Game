module FourReg(    
    input [3:0] A,
    input CLK,
    input R,
    output reg [3:0] OUT
    );
    
    DFlipFlop f1(.A(A[0]), .CLK(CLK), .RESET(R), .Q(OUT[0]));
    DFlipFlop f2(.A(A[1]), .CLK(CLK), .RESET(R), .Q(OUT[1]));
    DFlipFlop f3(.A(A[2]), .CLK(CLK), .RESET(R), .Q(OUT[2]));
    DFlipFlop f4(.A(A[3]), .CLK(CLK), .RESET(R), .Q(OUT[3]));
    
endmodule
