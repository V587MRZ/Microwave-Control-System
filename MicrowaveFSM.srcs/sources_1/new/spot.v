module spot (
input wire clk,
input wire spot_in,
output wire spot_out);

// you write the module code!
reg x;
always @ (posedge clk) 
x <= spot_in;

assign spot_out = ~x & spot_in;

endmodule