`timescale 1ns / 1ps

module risc_CPU(
    input wire clk,
    input wire reset
);

reg [7:0] instr_mem [0:15];
reg [7:0] data_mem [0:15];

reg [3:0] pc;
reg [7:0] acc;
reg [7:0] instr;
reg [1:0] opcode;
reg [3:0] operand;

initial begin
    instr_mem[0] = 8'b00_000101; // LOAD 5
    instr_mem[1] = 8'b01_000011; // ADD 3
    instr_mem[2] = 8'b10_000001; // STORE 0x1
    instr_mem[3] = 8'b11_000000; // JUMP 0
    instr_mem[4] = 8'b00_000000; // NOP
    instr_mem[5] = 8'b00_000000; // NOP
    for (integer i = 6; i < 16; i = i + 1) begin
        instr_mem[i] = 8'b00_000000;
    end
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        pc <= 0;
        acc <= 0;
    end else begin
        instr <= instr_mem[pc];
        opcode <= instr[7:6];
        operand <= instr[3:0];
        
        case (opcode)
            2'b00: begin // LOAD imm
                acc <= {4'b0000, operand};
                pc <= pc + 1;
            end
            2'b01: begin // ADD imm
                acc <= acc + {4'b0000, operand};
                pc <= pc + 1;
            end
            2'b10: begin // STORE
                data_mem[operand] <= acc;
                pc <= pc + 1;
            end
            2'b11: begin // JUMP
                pc <= operand;
            end
        endcase
    end
end

endmodule