`timescale 1ns / 1ps

module eight_bit_multiplier(
    input wire clk,
    input wire reset,
    input wire en,
    input wire [7:0] x,
    input wire [7:0] y,
    output reg [15:0] res
);
    wire [7:0] a1out, a2out;
    
 regstiern a1 (
    .clk(clk), 
    .reset(reset), 
    .en(en), 
    .d(x), 
    .q(a1out)
);

regstiern a2 (
    .clk(clk), 
    .reset(reset), 
    .en(en), 
    .d(y), 
    .q(a2out)
);
    
    
    logic [7:0] count;
    logic accum_enable;
    
    assign accum_enable = ~(count == y);
    always @(posedge clk or posedge reset) begin
        if (!reset) begin 
            res <= 16'd0;
            count <= 8'd0;
        end     
        else if (accum_enable) begin 
            res <= res + x;
            count <= count + 1;
        end
    
    end
endmodule