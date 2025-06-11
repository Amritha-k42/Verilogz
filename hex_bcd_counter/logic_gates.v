module hex_bcd_counter (
    input wire clk,
    input wire rst,         // Active-high reset
    output reg [3:0] hex,   // HEX count (0-15)
    output reg [7:0] bcd    // BCD output: {tens, ones}
);

// HEX counter: counts from 0 to 15
always @(posedge clk) begin
    if (rst)
        hex <= 4'd0;
    else if (hex == 4'd15)
        hex <= 4'd0;
    else
        hex <= hex + 4'd1;
end

// Convert HEX to BCD (supports 0-15)
always @(*) begin
    if (hex < 10) begin
        bcd[7:4] = 4'd0;       // Tens digit
        bcd[3:0] = hex;        // Ones digit
    end else begin
        bcd[7:4] = 4'd1;       // Tens digit = 1
        bcd[3:0] = hex - 4'd10; // Ones digit
    end
end

endmodule
