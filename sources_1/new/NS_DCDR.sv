module NS_DCDR(
    input R, input BTN,
    input [3:0] STIN, input CLK,
    output reg [3:0] STO,
    output HEX, output DEC,
    output reg [3:0] Q1,
    output reg [3:0] Q2
    );
    reg [4:0] state = 0;
    reg [4:0] valid;
    reg [19:0] counter = 0;
    reg anodeCounter;
    
    
    //determines state based on state-in value
    always_ff @ (STIN)
        case({STIN})
            4'b0001 : state <= 1;
            4'b0010 : state <= 2;
            4'b0011 : state <= 3;
            4'b0100 : state <= 4;
            4'b0101 : state <= 5;
            4'b0110 : state <= 6;
            4'b0111 : state <= 7;
            4'b1000 : state <= 8;
            4'b1001 : state <= 9;
            4'b1010 : state <= 10;
            default : state <= 1;
        endcase
        
        
    //0 - 000, 1 - 001, 2 - 010, 3 - 011, 4 - 100
    always_ff @ (posedge BTN, posedge R)
    begin
        if (R == 1) STO <= 4'b0001;
        else if (state == 1 & R == 0) STO <= 4'b0010;
        else if (state == 2 & R == 0) STO <= 4'b0011;
        else if (state == 3 & R == 0) STO <= 4'b0100;
        else if (state == 4 & R == 0) STO <= 4'b0101;
        else if (state == 5 & R == 0) STO <= 4'b0110;
        else if (state == 6 & R == 0) STO <= 4'b0111;
        else if (state == 7 & R == 0) STO <= 4'b1000;
        else if (state == 8 & R == 0) STO <= 4'b1001;
        else if (state == 9 & R == 0) STO <= 4'b1010;
        else STO <= STIN;
    end
    
    
    always_ff @ (STIN)
    begin
        case({STIN})
            4'b0001 : begin
                Q1 <= 4'h2;
                Q2 <= 4'h9;
                end
            4'b0010 : begin
                Q1 <= 4'h0;
                Q2 <= 4'hd;
                end
            4'b0011 : begin
                Q1 <= 4'h2;
                Q2 <= 4'h1;
                end
            4'b0100 : begin
                Q1 <= 4'h1;
                Q2 <= 4'h3;
                end
            4'b0101 : begin
                Q1 <= 4'h0;
                Q2 <= 4'h9;
                end
            4'b0110 : begin
                Q1 <= 4'h1;
                Q2 <= 4'ha;
                end
            4'b0111 : begin
                Q1 <= 4'h2;
                Q2 <= 4'h0;
                end
            4'b1000 : begin
                Q1 <= 4'h1;
                Q2 <= 4'h5;
                end
            4'b1001 : begin
                Q1 <= 4'h3;
                Q2 <= 4'h1;
                end
            4'b1010 : begin
                Q1 <= 4'h1;
                Q2 <= 4'h1;
                end
            default: begin
                Q1 <= 4'h2;
                Q2 <= 4'h9;
                end
      endcase
      
    end
    
      assign HEX = ((state % 2) == 0) ? 1 : 0;
      assign DEC = ((state % 2) == 1) ? 1 : 0;
 

endmodule