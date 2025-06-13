`timescale 1ns / 1ps

module tb_alu_4bit;
    reg [3:0] A, B;
    reg [2:0] sel;
    wire [3:0] result;
    wire carry, zero;

    alu_4bit uut (
        .A(A),
        .B(B),
        .sel(sel),
        .result(result),
        .carry(carry),
        .zero(zero)
    );

    initial begin
        $display("Time | A  B  sel | Result Carry Zero");

        A = 4'b0101; B = 4'b0011;

        sel = 3'b000; #10;  // ADD
        $display("%4t | %b %b %b | %b     %b     %b", $time, A, B, sel, result, carry, zero);

        sel = 3'b001; #10;  // SUB
        sel = 3'b010; #10;  // AND
        sel = 3'b011; #10;  // OR
        sel = 3'b100; #10;  // XOR
        sel = 3'b101; #10;  // NOT
        sel = 3'b110; #10;  // INC
        sel = 3'b111; #10;  // DEC

        $stop;
    end
endmodule

