module TranslateSevenSegment(
    input CLK, input [3:0] Q1, input [3:0] Q2, input reg [3:0] CORRECT,
    output reg [6:0] CATHODE, output reg [3:0] ANODE = 0
    );
    reg [20:0] counter = 0;
    reg [1:0] anodeCounter;
    
    always_ff @ (posedge CLK)
    begin
        counter <= counter + 1;
    end
    
    assign anodeCounter = counter[20:19];
     
    always_ff @ (anodeCounter)
        case(anodeCounter)
            2'b00 : ANODE = 4'b1110;
            2'b01 : ANODE = 4'b1101;
            2'b10 : ANODE = 4'b1011;
            2'b11 : ANODE = 4'b0111;
            default: ANODE = 4'b1111;
        endcase
    
    reg [3:0] ONE_DIGIT = 0;
    always@(anodeCounter)
    begin
        case(anodeCounter)
            2'b00: ONE_DIGIT = Q2;
            2'b01: ONE_DIGIT = Q1;
            2'b10: begin
                    if (CORRECT < 4'ha) ONE_DIGIT <= CORRECT;
                    else ONE_DIGIT <= 0;
                   end
            2'b11: begin
                    if (CORRECT < 4'ha) ONE_DIGIT <= 0;
                    else ONE_DIGIT <= 1;
                  end
            default: ONE_DIGIT = 4'b1111;
        endcase
    end

    TranslateToCathode cathodeTranslate(.digit(ONE_DIGIT), .CATHODE(CATHODE));
endmodule