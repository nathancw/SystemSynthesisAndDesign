module Control_Block100(
clk,reset,MFC,opCode,para1,para2,
//IF Outputs
pcOut,marIn,MemEN,marOut,RW,readFromMem,outToBus,
//Load
readFromBus,outToMem,
IRin,
//ADD FSM
aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr,
control,paraOut,regIn,paraExtendedOut
);

input clk,reset,MFC;
input[3:0] opCode;
input[5:0] para1,para2;
//IF Outputs
output pcOut,marIn,MemEN,marOut,RW,readFromMem,outToBus,IRin;
//ADD outputs
output aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr;
output readFromBus,outToMem;
output[3:0] control;
output[5:0]paraOut,regIn;
output[15:0] paraExtendedOut; //IS THE ADDRESS IN LOAD STORE
//Fetch Wire for IF 
wire fetch,done;
reg[4:0] start;

always@(done)begin

if(done)begin

case(opCode)
4'b1111: start<=5'b10000; //Add
4'b0001: start<=5'b10000; //Sub
4'b0010: start<=5'b10000; //Not 
4'b0011: start<=5'b10000; //And
4'b0100: start<=5'b10000; //Or
4'b0101: start<=5'b10000; //Xor
4'b0110: start<=5'b10000; //Xnor
4'b0111: start<=5'b01000; //Addi
4'b1101: start<=5'b01000; //subi
4'b1001: start<=5'b00001; //movi
4'b1010: start<=5'b00010; //mov
4'b1011: start<=5'b00100; //load
4'b1100: start<=5'b00100; //store
default: start<=5'b0; 
endcase
end
else begin
start<=5'b0;
end

end

wire marIn1,marIn2;
assign marIn = (marIn1 || marIn2) ? 1:0;
wire MemEN1,MemEN2;
assign MemEN = (MemEN1 || MemEN2) ? 1:0;
wire marOut1,marOut2;
assign marOut = (marOut1 || marOut2) ? 1:0;
wire RW1,RW2;
assign RW = (RW1 || RW2)?1:0;
wire readFromMem1,readFromMem2;
assign readFromMem = (readFromMem1 || readFromMem2)?1:0;
wire outToBus1,outToBus2;
assign outToBus = (outToBus1 || outToBus2)?1:0;
wire aluIn11,aluIn12;
assign aluIn1 = (aluIn11 || aluIn12)?1:0;
wire aluIn21,aluIn22;
assign aluIn2 = (aluIn21 || aluIn22)?1:0;
wire[3:0] control1,control2;
assign control=(control1 | control2);
wire aluOutRegIn1,aluOutRegIn2;
assign aluOutRegIn = (aluOutRegIn1 || aluOutRegIn2)?1:0;
wire incr1,incr2,incr3,incr4,incr5;
assign incr = (incr1 || incr2 || incr3 || incr4 || incr5)?1:0;
wire fetch1,fetch2,fetch3,fetch4,fetch5;
assign fetch = (fetch1 || fetch2 || fetch3 || fetch4 || fetch5)?1:0;
//wire[15:0] paraExtendedOut1,paraExtendedOut2,paraExtendedOut3;
//assign paraExtendedOut = (paraExtendedOut1 | paraExtendedOut2 | paraExtendedOut3);
wire[5:0] regIn1,regIn2,regIn3,regIn4,regIn5;
assign regIn = (regIn1 & regIn2 & regIn3 & regIn4 & regIn5);
 
wire[5:0] paraOut1,paraOut2,paraOut3,paraOut4;
assign paraOut = (paraOut1 & paraOut2 & paraOut3 & paraOut4);

wire aluOutRegOut1, aluOutRegOut2;
assign aluOutRegOut = (aluOutRegOut1 || aluOutRegOut2) ?1:0;

IF_FSM100 IF(clk,reset,MFC,fetch,
pcOut,marIn1,MemEN1,marOut1,RW1,readFromMem1,outToBus1,IRin,done);

ADD_FSM100 ADD(clk,reset,start[4],opCode,para1,para2,
paraOut1,aluIn11,aluIn21,control1,aluOutRegIn1,aluOutRegOut1,regIn1,incr1,fetch1);

ADDI_FSM100 ADDI(clk,reset,start[3],opCode,para1,para2,
paraOut2,paraExtendedOut,aluIn12,aluIn22,control2,aluOutRegIn2,aluOutRegOut2,regIn2,incr2,fetch2);

LOAD_FSM100 LOAD(clk,reset,start[2],opCode,para1,para2,MFC,
paraExtendedOut,marIn2,MemEN2,marOut2,RW2,readFromMem2,outToBus2,readFromBus,outToMem,regIn3,paraOut3,incr3,fetch3);

MOV_FSM100 MOV(clk,reset,start[1],para1,para2,
paraOut4,regIn4,incr4,fetch4);

MOVI_FSM100 MOVI(clk,reset,start[0],para1,para2,
paraExtendedOut,regIn5,incr5,fetch5);

endmodule

module ADDI_FSM100(clk,reset,start,opCode,para1,para2,
paraOut,paraExtendedOut,aluIn1,aluIn2,control,aluOutRegIn,aluOutRegOut,regIn,incr,fetch);
//5 inputs, -- outputs
//Need to decode para1 and para2 in the control block and pass it in as 4 bits
input reset,clk,start;
input[3:0] opCode;
input[5:0] para1,para2;
output aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr,fetch;
output[3:0] control;
output[5:0]paraOut,regIn;
output[15:0] paraExtendedOut;

reg[3:0] pres_state,next_state;
reg aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr,fetch;
reg[5:0]paraOut;
reg[15:0]paraExtendedOut;
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
paraOut<=6'b111111; paraExtendedOut<=16'bz; aluIn1<=1'b0; aluIn2 <= 1'b0; control<=4'b0; aluOutRegIn<=1'b0; aluOutRegOut<=1'b0; regIn<=6'b111111; incr <= 1'b0; fetch<=1'b0;
end
else if (pres_state == outPara1) begin //output para1 from register and latch it in the alu
paraOut<=para1; paraExtendedOut<=16'bz; aluIn1<=0; aluIn2 <= 0; control<=4'b0; aluOutRegIn<=0;  aluOutRegOut<=0; regIn<=6'b111111; incr <= 1; fetch<=0;
end
if (pres_state == latchPara1) begin //output para1 from register and latch it in the alu
paraOut<=para1;  paraExtendedOut<=16'bz; aluIn1<=1; aluIn2 <= 0; control<=4'b0; aluOutRegIn<=0;  aluOutRegOut<=0; regIn<=6'b111111; incr <= 0; fetch<=0;
end
else if (pres_state == outPara2) begin //output para2 from register and latch it in the alu
paraOut<=6'b111111; paraExtendedOut<=para2; aluIn1<=0; aluIn2 <= 0; control<=4'b0; aluOutRegIn<=0;  aluOutRegOut<=0; regIn<=6'b111111; incr <= 0; fetch<=0;
end
if (pres_state == latchPara2) begin //output para1 from register and latch it in the alu
paraOut<=6'b111111; paraExtendedOut<=para2; aluIn1<=0; aluIn2 <= 1; control<=4'b0; aluOutRegIn<=0;  aluOutRegOut<=0; regIn<=6'b111111; incr <= 0; fetch<=0;
end
else if (pres_state == controlOut) begin //output the control so we can compute
 paraOut<=6'b111111;  paraExtendedOut<=16'bz; aluIn1<=0; aluIn2 <= 0; control<=opCode; aluOutRegIn<=0;  aluOutRegOut<=0; regIn<=6'b111111; incr <= 0; fetch<=0;
end
else if (pres_state == holdOneALU || pres_state == holdTwoALU) begin //hold the contorl for some cycles so we can caluclate
paraOut<=6'b111111;  paraExtendedOut<=16'bz; aluIn1<=0; aluIn2 <= 0; control<=opCode; aluOutRegIn<=0; aluOutRegOut<=0; regIn<=6'b111111; incr <= 0; fetch<=0;
end
else if (pres_state == outRegALU) begin //output the reg to the bus
paraOut<=6'b111111; paraExtendedOut<=16'bz; aluIn1<=0; aluIn2 <= 0; control<=4'b0; aluOutRegIn<=1; aluOutRegOut<=0; regIn<=6'b111111; incr <= 0; fetch<=0;
end
else if (pres_state == aluOutBus) begin //latch the new data to para1, regIn <= enable signal for the registers
paraOut<=6'b111111; paraExtendedOut<=16'bz; aluIn1<=0; aluIn2 <= 0; control<=4'b0; aluOutRegIn<=0; aluOutRegOut<=1; regIn<=para1; incr <= 0; fetch<=1;
end

end //outputs
endmodule
	




module LOAD_FSM100(clk,reset,start,opCode,para1,para2,MFC,
address,marIn,MemEN,marOut,RW,readFromMem,outToBus,readFromBus,outToMem,regIn,regOut,incr,fetch);
//3 inputs, 8 output
input reset,clk,MFC,start;
input[3:0]opCode;
input[5:0] para1,para2;
output marIn,MemEN,marOut,RW,readFromMem,outToBus,readFromBus,outToMem,incr,fetch;
output[5:0] regIn,regOut;
output[15:0] address;

reg[3:0] pres_state,next_state;
reg marIn,MemEN,marOut,RW,readFromMem,outToBus,readFromBus,outToMem,fetch,incr;
reg[5:0] regIn,regOut;
reg[5:0] regStore;
reg[15:0] addressStore,address;
reg RWstore;
//FSM register
parameter memAccess = 4'b0001, hold = 4'b0010, MDRInFromMem= 4'b0011, latchToMar=4'b0111, MDRoutToBus=4'b1101, outToMemory=4'b1111;
parameter outBus = 4'b0100,idle=4'b0101, load=4'b1000, store=4'b1001, regLatchIn=4'b1010, outRegToBus=4'b1011, MDRInFromBus=4'b1100;

always @(posedge clk or posedge reset)
begin:statereg
if(reset)begin //asynchronous reset 
pres_state <= idle;
end
else if(pres_state==idle && start && opCode == 4'b1011)begin
pres_state<=load;
end
else if(pres_state==idle && start && opCode == 4'b1100)begin
pres_state<=store;
end
else if(pres_state==hold && MFC)begin
pres_state<=next_state;
end
else if(pres_state!=idle && pres_state!=hold)begin
pres_state <= next_state; end

end //statereg

//FSM next state logic
always @(pres_state)
begin: fsm
case (pres_state)
load: next_state<=latchToMar;
store: next_state<=latchToMar;
latchToMar:
if(opCode==4'b1011) begin
 next_state<=memAccess;//load 
end
else
next_state<=outRegToBus; //Store

outRegToBus: next_state<=MDRInFromBus;
MDRInFromBus: next_state<=memAccess;
memAccess:next_state <= hold;

hold:
if(opCode==4'b1011) begin
next_state <= MDRInFromMem; //Load
end
else
next_state<=outToMemory; //Store

outToMemory: next_state<=idle;
MDRInFromMem: next_state <= MDRoutToBus;
MDRoutToBus: next_state <= regLatchIn;
regLatchIn: next_state<= idle;
default: next_state<= idle;
endcase
end //fsm

//Moore output definition using pres_state only
always @(pres_state)
begin: outputs
if(pres_state==load)begin
addressStore=para1;
regStore=para2;
RWstore=1;
address=addressStore; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; readFromBus=0; outToMem = 0; regIn= 6'b111111; regOut=6'b111111; incr = 0; fetch = 0;
end
if(pres_state==store)begin
addressStore=para2; //Basically an extra idle
regStore=para1;//Store the parameters in temp registers so we can choose which to output when. We also have enough hold time
RWstore=0;
address=addressStore; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; readFromBus=0; outToMem = 0; regIn= 6'b111111; regOut=6'b111111; incr = 0; fetch = 0;
end
if(pres_state == latchToMar)begin //Load MARIN Para1, for Store MARIN Para2
 address=addressStore; marIn = 1; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; readFromBus=0; outToMem = 0; regIn= 6'b111111;  regOut=6'b111111; incr = 1; fetch = 0;
end

if (pres_state == memAccess) begin //Both
 address=16'bz; marIn = 0; MemEN=1; marOut=1; RW = RWstore; readFromMem=0; outToBus=0; readFromBus=0; outToMem = 1; regIn= 6'b111111;  regOut=6'b111111; incr = 0; fetch = 0;
end
if (pres_state == hold) begin // Both
address=16'bz; marIn = 0; MemEN=1; marOut=1; RW = RWstore; readFromMem=0; outToBus=0; readFromBus=0; outToMem = 1; regIn = 6'b111111;   regOut=6'b111111;incr = 0; fetch = 0;
end
if (pres_state == MDRInFromMem) begin //Load
address=16'bz;  marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=1; outToBus=0; readFromBus=0; outToMem = 0; regIn = 6'b111111;  regOut=6'b111111; incr = 0; fetch = 0;
end
if(pres_state == MDRoutToBus)begin //Load
address=16'bz;  marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=1; readFromBus=0; outToMem = 0; regIn = 6'b111111;  regOut=6'b111111; incr = 0; fetch = 0;
end
if (pres_state == regLatchIn) begin //Load
 address=16'bz; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=1; readFromBus=0; outToMem = 0; regIn = regStore; regOut=6'b111111; incr = 0; fetch = 1;
end
if (pres_state == outRegToBus) begin //Store output registe to bus
 address=16'bz; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; readFromBus=0; outToMem = 0; regIn = 6'b111111; regOut=regStore; incr = 0; fetch = 0;
end
if (pres_state == MDRInFromBus) begin //Store output registe to bus
 address=16'bz; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; readFromBus=1; outToMem = 0; regIn = 6'b111111; regOut=regStore; incr = 0; fetch = 0;
end
//What below????
if(pres_state == outToMemory)begin //Store
address=16'bz; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; readFromBus=0; outToMem = 1; regIn = 6'b111111; regOut=6'b111111; incr = 0; fetch = 1;
end

if(pres_state==idle)begin
addressStore=16'b0; //Basically an extra idle
regStore=16'b0;//Store the parameters in temp registers so we can choose which to output when. We also have enough hold time
RWstore=0; 
address=16'bz; marIn = 1'b0; MemEN=1'b0; marOut=1'b0; RW = 1'b0; readFromMem=1'b0; outToBus=1'b0; readFromBus=1'b0; outToMem = 1'b0; regIn = 6'b111111; regOut=6'b111111; incr = 1'b0; fetch = 1'b0;
end//FIX SENDING THE 16 BIT ADDRESS TO MAR
end //outputs
endmodule



module IF_FSM100(clk,reset,MFC,fetch,
pcOut,marIn,MemEN,marOut,RW,readFromMem,outToBus,IRin,done);
//3 inputs, 8 outputs
input reset,clk,fetch,MFC;
output pcOut,marIn,MemEN,marOut,RW,readFromMem,outToBus,IRin,done;
reg[3:0] pres_state,next_state;
reg pcOut,marIn,MemEN,marOut,RW,readFromMem,outToBus,IRin,done;
//FSM register
parameter start= 4'b0000, memAccess = 4'b0001, hold = 4'b0010, readMem= 4'b0011;
parameter outBus = 4'b0100,idle=4'b0101, marHold=4'b0111,outHold=4'b1000;

always @(posedge clk or posedge reset)
begin:statereg
if(reset)begin //asynchronous reset 
pres_state <= start;
end
else if(pres_state==idle && fetch)begin
pres_state<=next_state;
end
else if(pres_state==hold && MFC)begin
pres_state<=next_state;
end
else if(pres_state!=idle && pres_state!=hold)begin
pres_state <= next_state; end

end //statereg

//FSM next state logic
always @(pres_state)
begin: fsm
//4'b0001: next_state <= b;
//4'b0010: next_state <= redLight;
case (pres_state)
start: next_state<=marHold;
marHold: next_state<=memAccess;
memAccess: next_state <= hold;
hold: next_state <= readMem;
readMem: next_state <= outBus;
outBus: next_state<=outHold;
outHold: next_state <= idle;
idle:next_state<= start;
default: next_state<= start;
endcase
end //fsm

//Moore output definition using pres_state only
always @(pres_state)
begin: outputs
if (pres_state == start) begin
pcOut = 1; marIn = 1; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; IRin = 0;  done=0;
end
if (pres_state == marHold) begin
pcOut = 1; marIn = 1; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=0; IRin = 0;  done=0;
end
if (pres_state == memAccess) begin
pcOut = 0; marIn = 0; MemEN=1; marOut=1; RW = 1; readFromMem=0; outToBus=0; IRin = 0; done=0;
end
if (pres_state == hold) begin
pcOut = 0; marIn = 0; MemEN=1; marOut=1; RW = 1; readFromMem=0; outToBus=0; IRin = 0; done=0;
end
if (pres_state == readMem) begin
pcOut = 0; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=1; outToBus=0; IRin = 0; done=0;
end
if (pres_state == outBus) begin
pcOut = 0; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=1; IRin = 0; done=0;
end
if(pres_state == outHold)begin
pcOut = 0; marIn = 0; MemEN=0; marOut=0; RW = 0; readFromMem=0; outToBus=1; IRin = 1; done=0;
end
if(pres_state==idle)begin
pcOut = 1'b0; marIn = 1'b0; MemEN=1'b0; marOut=1'b0; RW = 1'b0; readFromMem=1'b0; outToBus=1'b0; IRin = 1'b0; done = 1;
end
end //outputs
endmodule




module MOV_FSM100(clk,reset,start,para1,para2,
outSig,enSig,incr,fetch);
//3 inputs, 8 outputs
input reset,clk,start;
input[5:0] para1,para2;
output[5:0] enSig,outSig;
output incr,fetch;
reg[3:0] pres_state,next_state;
reg[5:0] enSig,outSig;
reg incr,fetch;
//FSM register
parameter  outputData = 4'b0001, latchData = 4'b0010;
parameter idle=4'b0101;

always @(posedge clk or posedge reset)
begin:statereg
if(reset)begin //asynchronous reset 
pres_state <= idle;
end
else if(pres_state==idle && start)begin
pres_state<=next_state;
end
else if(pres_state!=idle)begin
pres_state <= next_state; end

end //statereg

//FSM next state logic
always @(pres_state)
begin: fsm
case (pres_state)
idle: next_state<= outputData;
outputData: next_state<=latchData;
latchData: next_state<=idle;
default: next_state<= idle;
endcase
end //fsm

//Moore output definition using pres_state only
always @(pres_state)
begin: outputs
if(pres_state ==idle)begin
outSig<=6'b111111; enSig<=6'b111111; incr<= 1'b0; fetch<= 1'b0;
end
else if (pres_state == outputData) begin
outSig<=para2; enSig<=6'b111111; incr<= 1; fetch<= 0;
end
else if (pres_state == latchData) begin
outSig<=para2; enSig<=para1; incr<= 0; fetch<= 1;
end

end //outputs
endmodule

module MOVI_FSM100(clk,reset,start,para1,para2,
outData,enSig,incr,fetch);
//3 inputs, 8 outputs
input reset,clk,start;
input[5:0] para1,para2;
output[15:0] outData;
output[5:0] enSig;
output incr,fetch;
reg[3:0] pres_state,next_state;
reg[15:0] outData;
reg[5:0] enSig;
reg incr,fetch;

//FSM register
parameter  outputData = 4'b0001, latchData = 4'b0010;
parameter idle=4'b0101;

always @(posedge clk or posedge reset)
begin:statereg
if(reset)begin //asynchronous reset 
pres_state <= idle;
end
else if(pres_state==idle && start)begin
pres_state<=next_state;
end
else if(pres_state!=idle)begin
pres_state <= next_state; end

end //statereg

//FSM next state logic
always @(pres_state)
begin: fsm
case (pres_state)
idle: next_state<= outputData;
outputData: next_state<=latchData;
latchData: next_state<=idle;
default: next_state<= idle;
endcase
end //fsm

//Moore output definition using pres_state only
always @(pres_state)
begin: outputs
if (pres_state == outputData) begin
outData=para1; enSig=para2; incr=1; fetch=0;
end
if (pres_state == latchData) begin
outData=para1; enSig=para2; incr=0; fetch=1;
end
if(pres_state ==idle)begin
outData=16'bz; enSig=6'b111111; incr=1'b0; fetch=1'b0;
end

end //outputs
endmodule



module ADD_FSM100(clk,reset,start,opCode,para1,para2,
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
	
