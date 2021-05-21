module debouncer(
input wire switchIn,
input wire clk,
input wire reset,
output wire debounceout);

//you write the code!
wire beat;
heartbeat # (.TOPCOUNT(6600000)) debouncebeat (.clk(clk),.reset(reset),.beat(beat));

reg[2:0] pipeline;
always @(posedge clk) begin
if (beat) begin
pipeline[0] <= switchIn;
pipeline[1] <= pipeline[0];
pipeline[2] <= pipeline[1];
end end
assign debounceout = &pipeline;

endmodule
