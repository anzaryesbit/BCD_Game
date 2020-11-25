module DriverFile(
    input R, input BTN, input CLK,
    input reg [4:0] SW,
    output reg [6:0] CATHODE, output reg [3:0] ANODE,
    output HEX, output DEC
    );
    wire [3:0] st;
    wire [3:0] stp;
    reg [3:0] correct;
    reg [3:0] Q1;
    reg [3:0] Q2;
    
    NS_DCDR ns(.R(R), .BTN(BTN), .CLK(CLK), .STIN(st), .STO(stp), .HEX(HEX), .DEC(DEC), .Q1(Q1), .Q2(Q2));
    FourReg fr(.A(stp), .CLK(CLK), .R(R), .OUT(st));
    CheckDCDR ch(.IN(st), .BTN(BTN), .R(R), .SW0(SW[0]), .SW1(SW[1]), .SW2(SW[2]), .SW3(SW[3]), .SW4(SW[4]), .NUM_CORRECT(correct));
    TranslateSevenSegment ss(.CLK(CLK), .Q1(Q1), .Q2(Q2), .CORRECT(correct), .CATHODE(CATHODE), .ANODE(ANODE));
    
    
endmodule