module MyProjSim();
    reg R = 0;
    reg BTN = 0;
    reg CLK = 0;
    reg SW0;
    reg SW1;
    reg SW2;
    reg SW3;
    reg SW4;
    wire [3:0] anode;
    wire [6:0] cathode;
    wire HEX;
    wire DEC;
    
    DriverFile UUT(
    R, BTN, CLK, SW0, SW1, SW2, SW3, SW4, cathode, anode, HEX, DEC
    );
    
    always #20 CLK = ~CLK;


    initial begin
        #1000;
        R = 1;
        #10;
        
        R = 0;
        SW0 = 1; SW1 = 0; SW2 = 1; SW3 = 1; SW4 = 1;
        BTN = 0;
        #100;
        
        BTN = 1;
        #10;
        
        BTN = 0;
    end
    
endmodule

