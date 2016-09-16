module PC(clk,reset,incr,en,out);
input clk,reset,incr,en;
output[15:0]out;
reg[15:0] store,out;
always@(posedge clk or posedge reset)
begin
if(reset)begin
out<=16'bz;
store<=16'b0;
end
else if(incr) begin
store <= store + 1;
out<=16'bz;
end
else if(en)
out<=store;
else
out<=16'bz; 

end
endmodule
