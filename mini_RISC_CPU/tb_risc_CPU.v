`timescale 1ns / 1ps

module tb_risc_CPU;

reg clk = 0;
reg reset;

risc_CPU ag ( .clk(clk), .reset(reset));

always #5 clk = ~clk;  

initial begin
    $dumpfile("risc_CPU.vcd");
    $dumpvars(0, tb_risc_CPU);

    reset = 1;
    #20;
    reset = 0;

    #500;

    $finish;
end

endmodule