`timescale 1ns / 1ps

module Shift_Registers(
    input logic clk,
    input logic reset,
    input logic serial_in,
    input logic en,
    output logic [7:0] Q,
    output logic serial_out
);

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            Q = 8'b00000000; // Reset the register to 0
        end else if (en) begin
//            Q[0] = Q[1];
//            Q[1] = Q[2];
//            Q[2] = Q[3];
//            Q[3] = Q[4];
//            Q[4] = Q[5];
//            Q[5] = Q[6];
//            Q[6] = Q[7];
//            Q[7] = serial_in;
            Q <= Q>>1 | {serial_in,7'b0000000};
        end
    end

    // most significant bit as serial_out
    assign serial_out = Q[0];

endmodule
