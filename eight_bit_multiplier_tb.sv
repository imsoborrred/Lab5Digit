`timescale 1ns / 1ps

module eight_multiplier_tb;

    // Inputs
    reg clk;
    reg reset;
    reg en;
    reg [7:0] x;
    reg [7:0] y;

        wire [15:0] res;

    
    eight_bit_multiplier uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .x(x),
        .y(y),
        .res(res)
    );

    
    always #5 clk = ~clk; // 10ns clock period

    
    initial begin
        
        clk = 0;
        reset = 1;
        en = 0;
      
        #10;  
        reset = 0; 
        
        x = 8'd8;   
        y = 8'd9;   
        en = 1;    
        #120;        
      
        $stop;
    end

endmodule