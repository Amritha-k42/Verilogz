`timescale 1ns / 1ps

module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] sel,
    output reg [3:0] result,
    output reg carry,
    output reg zero
);

    always @(*) begin
        carry = 0;
        result = 4'b0000;

        case (sel)
            3'b000: {carry, result} = A + B;         // ADD
            3'b001: {carry, result} = A - B;         // SUB
            3'b010: result = A & B;                  // AND
            3'b011: result = A | B;                  // OR
            3'b100: result = A ^ B;                  // XOR
            3'b101: result = ~A;                     // NOT A
            3'b110: {carry, result} = A + 1;         // INC A
            3'b111: {carry, result} = B - 1;         // DEC B
            default: result = 4'b0000;
        endcase

        zero = (result == 4'b0000) ? 1'b1 : 1'b0;
    end

endmodule
 
