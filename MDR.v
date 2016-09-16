module MDR_IN(clk,reset,memRead,busRead,readFromBus,outToMem,readFromMem,outToBus,outMem,outBus);
input[15:0] busRead,memRead;
input clk,reset,readFromBus,outToMem,readFromMem,outToBus;
output[15:0] outMem,outBus;
reg[15:0] outMem,outBus,store1, store2;

always@(posedge clk)
begin
if(readFromBus) begin
store1<=busRead;
outMem<=16'bz;
end
else if(outToMem)
outMem<=store1;
else if(readFromMem) begin
store2<=memRead;
outBus<=16'bz;
end
else if(outToBus)
outBus<=store2;
else begin
outMem<=16'bz;
outBus<=16'bz;
end
end



endmodule
	



