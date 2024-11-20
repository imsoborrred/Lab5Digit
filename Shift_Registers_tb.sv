`timescale 1ns / 1ps

module Shift_Registers_tb;

    // Testbench Signals
    logic clk;
    logic reset;
    logic serial_in;
    logic en;
    logic [7:0] Q;
    logic serial_out;

    // Instantiate the DUT (Device Under Test)
    Shift_Registers uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .en(en),
        .Q(Q),
        .serial_out(serial_out)
    );

    // Clock generation
    initial clk = 1;
    always #5 clk = ~clk; // 10ns clock period (50 MHz)

    // Testbench stimulus
    initial begin
        // Initialize inputs
        reset = 0;
        serial_in = 1;
        en = 0;

        // Apply reset
        #10 reset = 1; // Release reset after 10ns
        $display("Time=%0t | Reset Applied | Q=%b | Serial_Out=%b", $time, Q, serial_out);

        // Test 1: Apply serial data with enable
        #10 en = 1; #5 serial_in = 0; 
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b", $time, serial_in, en, Q, serial_out);
        #10 serial_in = 0; 
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b", $time, serial_in, en, Q, serial_out);
        #10 serial_in = 0; 
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b", $time, serial_in, en, Q, serial_out);
        #10 serial_in = 0; 
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b", $time, serial_in, en, Q, serial_out);
        #10 serial_in = 0; 
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b", $time, serial_in, en, Q, serial_out);

        // Test 2: Disable enable and observe no changes
        #10 en = 0; serial_in = 0;
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b (No Change Expected)", $time, serial_in, en, Q, serial_out);

        // Test 3: Apply reset again
        #10 reset = 0; // Assert reset
        #10 $display("Time=%0t | Reset Asserted | Q=%b | Serial_Out=%b", $time, Q, serial_out);
        #10 reset = 1; // Release reset
        #10 $display("Time=%0t | Reset Released | Q=%b | Serial_Out=%b", $time, Q, serial_out);

        // Test 4: Apply serial data after reset
        #10 en = 1; serial_in = 0;
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b", $time, serial_in, en, Q, serial_out);
        #10 serial_in = 0;
        #10 $display("Time=%0t | Serial_In=%b | Enable=%b | Q=%b | Serial_Out=%b", $time, serial_in, en, Q, serial_out);

        // Finish simulation
        #100 $stop;
    end

endmodule
