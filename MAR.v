module MAR(clk,addr,en,en1,outAddr);
input[15:0] addr;
input clk,en,en1;
output[15:0] outAddr;
reg[15:0] store,outAddr;

always@(posedge clk)
begin
if(en) begin
store<=addr; end
else if(en1) begin
outAddr<=store; end
end

endmodule

