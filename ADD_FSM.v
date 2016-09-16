module ADD_FSM(clk,reset,start,opCode,para1,para2,
paraOut,aluIn1,aluIn2,control,aluOutRegIn,aluOutRegOut,regIn,incr,fetch);
//5 inputs, -- outputs
//Need to decode para1 and para2 in the control block and pass it in as 4 bits
input reset,clk,start;
input[3:0] opCode;
input[5:0] para1,para2;
output aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr,fetch;
output[3:0] control;
output[5:0]paraOut,regIn;

reg[3:0] pres_state,next_state;
reg aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr,fetch;
reg[5:0]paraOut;
reg[3:0]control;
reg[5:0]regIn;

parameter outPara1= 4'b0000, outPara2= 4'b0001, controlOut = 4'b0010, holdOneALU= 4'b0011;
parameter holdTwoALU = 4'b0100, outRegALU = 4'b0101, aluOutBus = 4'b0110, idle=4'b0111, latchPara1 = 4'b1000;
parameter latchPara2=4'b1001;

always @(posedge clk or posedge reset)
begin:statereg
if(reset) begin 
pres_state <= idle; end
else if(pres_state!=idle) begin
pres_state <= next_state; end
else if(pres_state==idle && start) begin
pres_state<=next_state; end
 //statereg
end

//FSM next state logic
always @(pres_state)
begin: fsm
case (pres_state)
outPara1: next_state<=latchPara1;
latchPara1: next_state<=outPara2;
outPara2: next_state <= latchPara2;
latchPara2: next_state<=controlOut;
controlOut: next_state <= holdOneALU;
holdOneALU: next_state <= holdTwoALU;
holdTwoALU: next_state<=outRegALU;
outRegALU: next_state <= aluOutBus;
aluOutBus: next_state <= idle;
idle: next_state<=outPara1;
//aluOutBus<=Go to instruction fetch???
endcase	
end //fsm

//Moore output definition using pres_state only
always @(pres_state)
begin: outputs
if (pres_state == idle) begin //output para1 from register and latch it in the alu
paraOut=6'b111111; aluIn1=1'b0; aluIn2 = 1'b0; control=4'b0; aluOutRegIn=1'b0; aluOutRegOut=1'b0; regIn=6'b111111; incr = 1'b0; fetch=1'b0;
end
else if (pres_state == outPara1) begin //output para1 from register and latch it in the alu
paraOut=para1; aluIn1=0; aluIn2 = 0; control=4'b0; aluOutRegIn=0;  aluOutRegOut=0; regIn=6'b111111; incr = 1; fetch=0;
end
if (pres_state == latchPara1) begin //output para1 from register and latch it in the alu
paraOut=para1; aluIn1=1; aluIn2 = 0; control=4'b0; aluOutRegIn=0;  aluOutRegOut=0; regIn=6'b111111; incr = 0; fetch=0;
end
else if (pres_state == outPara2) begin //output para2 from register and latch it in the alu
 paraOut=para2; aluIn1=0; aluIn2 = 0; control=4'b0; aluOutRegIn=0;  aluOutRegOut=0; regIn=6'b111111; incr = 0; fetch=0;
end
if (pres_state == latchPara2) begin //output para1 from register and latch it in the alu
paraOut=para2; aluIn1=0; aluIn2 = 1; control=4'b0; aluOutRegIn=0;  aluOutRegOut=0; regIn=6'b111111; incr = 0; fetch=0;
end
else if (pres_state == controlOut) begin //output the control so we can compute
 paraOut=6'b111111; aluIn1=0; aluIn2 = 0; control=opCode; aluOutRegIn=0;  aluOutRegOut=0; regIn=6'b111111; incr = 0; fetch=0;
end
else if (pres_state == holdOneALU || pres_state == holdTwoALU) begin //hold the contorl for some cycles so we can caluclate
paraOut=6'b111111; aluIn1=0; aluIn2 = 0; control=opCode; aluOutRegIn=0; aluOutRegOut=0; regIn=6'b111111; incr = 0; fetch=0;
end
else if (pres_state == outRegALU) begin //output the reg to the bus
paraOut=6'b111111; aluIn1=0; aluIn2 = 0; control=4'b0; aluOutRegIn=1; aluOutRegOut=0; regIn=6'b111111; incr = 0; fetch=0;
end
else if (pres_state == aluOutBus) begin //latch the new data to para1, regIn = enable signal for the registers
paraOut=6'b111111; aluIn1=0; aluIn2 = 0; control=4'b0; aluOutRegIn=0; aluOutRegOut=1; regIn=para1; incr = 0; fetch=1;
end

end //outputs
endmodule
	