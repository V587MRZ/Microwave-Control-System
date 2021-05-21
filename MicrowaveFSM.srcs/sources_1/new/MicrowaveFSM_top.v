`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//1. is it a moore or mealy machine?
//2. why we need a SPOT CIRCUIT in the machine



module MicrowaveFSM_top(
    input wire clk,
    input wire reset,
    input wire enter,
    input wire [15:0] SW,
    output wire [15:0] LED
    );
    wire spot_in, spot_out;

    FSM Fsm (.clk(clk), .reset(reset), .enter(spot_out), .SW(SW), .LED(LED));
    debouncer deb (.enterButton(enter), .clk(clk), .debounceout(spot_in), .reset(reset));
    spot spot (.spot_in(spot_in), .spot_out(spot_out), .clk(clk));
endmodule 
