`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 10:18:53 AM
// Design Name: 
// Module Name: FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM(
input wire clk,
input wire reset,
input wire enter,
input wire [15:0] SW,
output reg [15:0] LED
    );

parameter IDLE=2'd0,SET_TIMER=2'd1,COOK=2'd2,ALARM=2'd3;
reg [1:0] state, nextstate;

always @ (posedge clk) begin
if (reset)
state <= IDLE;
else 
state <= nextstate; end

always @(posedge clk) begin
case(state)
IDLE: begin
if(enter) nextstate= SET_TIMER; 
else nextstate=IDLE;
end
SET_TIMER: begin
if(enter) nextstate= COOK; 
else nextstate=SET_TIMER;
end
COOK: begin
if(enter) nextstate= ALARM; 
else nextstate=COOK;
end
ALARM: begin
if(enter) nextstate= IDLE; 
else nextstate=ALARM; 
end 
default: nextstate = IDLE;
endcase end


wire beat, dclk;
heartbeat #(.TOPCOUNT(100_000_000)) HB (.clk(clk), .reset(reset), .beat(beat));
ClockDivider CD (.clk(clk), .reset(reset), .dividedClk(dclk));

reg [15:0] ledcount;
always @(posedge clk) begin
case(state)
IDLE: LED = ~16'b0; 
SET_TIMER: LED = ledcount;
COOK: LED = ledcount;
ALARM: LED = ledcount;
default: LED = 16'b0;  
endcase end

always @(posedge clk) begin
case(state)
SET_TIMER: ledcount <= SW; 

COOK: if (beat) ledcount <= ledcount >> 1;
ALARM:  begin
ledcount[0] <= dclk ; 
        ledcount[1] <= dclk ;
        ledcount[2] <= dclk ;
        ledcount[3] <= dclk;
        ledcount[4] <= dclk ;
        ledcount[5] <= dclk;
        ledcount[6] <= dclk;
        ledcount[7] <= dclk;
        ledcount[8] <= dclk;
        ledcount[9] <= dclk;
        ledcount[10] <= dclk;
        ledcount[11] <= dclk;
        ledcount[12] <= dclk;
        ledcount[13] <= dclk;
        ledcount[14] <= dclk;
        ledcount[15] <= dclk;
        end endcase end
endmodule 



