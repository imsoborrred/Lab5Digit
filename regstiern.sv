`timescale 1ns / 1ps

module regstiern(
        
    input logic clk,             
    input logic reset,  
    input logic en,           
    input logic [7:0] d,         
    output logic [7:0] q          
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 8'b0;          
        else if (en)
            q <= d;             
    end

endmodule


