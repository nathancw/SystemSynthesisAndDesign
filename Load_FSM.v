module LOAD_FSM(clk,reset,start,opCode,para1,para2,MFC,
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



