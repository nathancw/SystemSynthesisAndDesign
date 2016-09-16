module REG_IN(clk,data,reset,enSig,outSig,outData);
input[15:0] data;
input[5:0] enSig, outSig;
input clk,reset;
//,en1,en2,en3,en4,out1,out2,out3,out4;
output[15:0] outData;
reg[15:0] outData,reg0,reg1,reg2,reg3,tempReg;

always@(posedge clk or posedge reset)
begin
if(reset)begin
reg0<=16'b0;
reg1<=16'b0;
reg2<=16'b0;
reg3<=16'b0;
end
else begin
case(enSig)
//4'b0000: outData<=16'bz;
6'b000000: begin reg0<=data; end
6'b000001: begin reg1<=data; end
6'b000011: begin reg2<=data; end
6'b000111: begin reg3<=data; end
endcase
end
end


always@(outSig)begin
case(outSig)
6'b111111:begin outData<=16'bz; end
6'b000000:begin outData<=reg0; end
6'b000001:begin outData<=reg1; end
6'b000011:begin outData<=reg2; end
6'b000111:begin outData<=reg3; end
default: begin outData<=16'bz; end
endcase

end

endmodule