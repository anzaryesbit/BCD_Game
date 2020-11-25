module CheckDCDR(
    input [3:0] IN, input BTN, input R,
    input SW0, input SW1, input SW2, input SW3, input SW4,
    output reg [3:0] NUM_CORRECT = 0
    );
    reg [3:0] valid;
    
    always_ff @ (SW0 or SW1 or SW2 or SW3 or SW4)
        case({SW4, SW3, SW2, SW1, SW0})
            5'b11101 : valid <= 1;
            5'b01101 : valid <= 2;
            5'b10101 : valid <= 3;
            5'b10011 : valid <= 4;
            5'b01001 : valid <= 5;
            5'b11010 : valid <= 6;
            5'b10100 : valid <= 7;
            5'b10101 : valid <= 8;
            5'b11111 : valid <= 9;
            5'b10001 : valid <= 10;
            default : valid <= 11;
        endcase
    
    always_ff @ (posedge BTN, posedge R)
    begin
        if (R == 1) NUM_CORRECT <= 0;
        else if (valid == IN) NUM_CORRECT <= NUM_CORRECT + 1;
        else NUM_CORRECT <= NUM_CORRECT;
    end
    
endmodule