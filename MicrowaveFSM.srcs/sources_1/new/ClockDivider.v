`timescale 1ns / 1ps

module ClockDivider#
(parameter integer TOPCOUNT = 50_000_000)//0.5s¸ß0.5sµÍ
(
    input wire clk,
    //input wire enable,
    input wire reset,
    output reg dividedClk//,
 //   output wire beat
    );
    reg [31:0] counter;
    always @(posedge clk) begin
if (reset || counter >= TOPCOUNT-1) begin
counter <= 32'd0;
end else begin
counter <= counter + 1'b1;
end
end

always @(posedge clk) begin
if (reset == 1) begin
 dividedClk <= 1'b0;
 end else if (counter >= TOPCOUNT-1) begin
 dividedClk <= ~dividedClk;
 end
 end
 
endmodule
