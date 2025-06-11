`timescale 1ns / 1ps

module tb_hex_bcd_counter;

    // Testbench signals
    reg clk;
    reg rst;
    wire [3:0] hex;
    wire [7:0] bcd;

    // Instantiate the DUT (Design Under Test)
    hex_bcd_counter uut (
        .clk(clk),
        .rst(rst),
        .hex(hex),
        .bcd(bcd)
    );

    // Clock generation: 10ns period (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;

        // Apply reset
        #10;
        rst = 0;

        // Run for 20 clock cycles (0-15 plus wraparound)
        #320;

        // Stop simulation
        $stop;
    end

    // Display output for each clock edge
    always @(posedge clk) begin
        $display("Time: %0t | HEX: %d | BCD: %01d%01d",
                 $time, hex, bcd[7:4], bcd[3:0]);
    end

endmodule
