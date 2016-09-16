module ALU(control,data,reset,out,in1,in2,outSignal);
input reset;
input in1,in2,outSignal;
input[15:0] data;
input[3:0] control;
output[15:0] out;
reg[15:0] regOne, regTwo,out,outReg,tempReg;

always@(in1 or in2 or outSignal)
begin
if(in1 == 1) begin
regOne <= data; end
else if(in2 == 1) begin
regTwo <=data; end
else if(outSignal==1)begin
out <= outReg; end
else begin
out <= 16'bz; end

end 

always @(control)
begin

case (control)
4'b1111: begin outReg <= (regOne + regTwo); tempReg <=outReg; end//Add
4'b0001: begin outReg <= (regOne - regTwo); tempReg <=outReg; end //Sub
4'b0010: begin outReg <= (~regOne); 	      tempReg <= outReg; 	end//Not 
4'b0011: begin outReg <= (regOne & regTwo); tempReg <= outReg;  	end//And
4'b0100: begin outReg <= (regOne | regTwo);  tempReg <=outReg; end//Or
4'b0101: begin outReg <= (regOne ^ regTwo); tempReg <=outReg; end//Xor
4'b0110: begin outReg <= (regOne ~^ regTwo); tempReg <=outReg; end//Xnor
4'b0111: begin outReg <= (regOne + regTwo); tempReg <=outReg;  end//Addi
4'b1101: begin outReg <= (regOne - regTwo); tempReg <=outReg; end//Subi
4'b0000: begin  outReg<=tempReg; end

endcase
end
endmodule