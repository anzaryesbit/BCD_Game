module TranslateToCathode (
    input reg [3:0] digit, 
    output reg [6:0] CATHODE = 0
    );
    always_ff @ (digit)
    begin
        //begins case statements that turns on the leds based on the bcd value outputted
        case(digit)
            4'h0 : CATHODE <= 7'b1000000;
            4'h1 : CATHODE <= 7'b1111001;
            4'h2 : CATHODE <= 7'b0100100;
            4'h3 : CATHODE <= 7'b0110000;
            4'h4 : CATHODE <= 7'b0011001;
            4'h5 : CATHODE <= 7'b0010010;
            4'h6 : CATHODE <= 7'b0000010;
            4'h7 : CATHODE <= 7'b1111000;
            4'h8 : CATHODE <= 7'b0000000;
            4'h9 : CATHODE <= 7'b0010000;
            4'ha : CATHODE <= 7'b0001000;
            4'hb : CATHODE <= 7'b0000011;
            4'hc : CATHODE <= 7'b0100111;
            4'hd : CATHODE <= 7'b0100001;
            4'he : CATHODE <= 7'b0000100;
            4'hf : CATHODE <= 7'b0001110;
            default : CATHODE <= 7'b1111111;
        endcase
    end

endmodule