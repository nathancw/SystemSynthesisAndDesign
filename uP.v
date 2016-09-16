module uP55(data_in , data_out , clk , reset , MFC , address , RW , EN);
input[15:0] data_in;
input clk,reset,MFC;

output[15:0] data_out,address;
output RW,EN;

wire[15:0] bus;

wire pcOut,marIn,MemEN,marOut,RW,readFromMem,outToBus,readFromBus,outToMem,
IRin,aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr;

wire[3:0] control,opCode;
wire[5:0]para1,para2,regIn,regOut;

Control_Block100 CB100(
clk,reset,MFC,opCode,para1,para2,
//IF Outputs
pcOut,marIn,EN,marOut,RW,readFromMem,outToBus,
//Load
readFromBus,outToMem,
IRin,
//ADD FSM//reg aluOutRegIn is a unused signal
aluIn1,aluIn2,aluOutRegIn,aluOutRegOut,incr,
control,regOut,regIn,bus
);

PC100 PC100(clk,reset,incr,pcOut,bus);

MAR100 MAR100(clk,bus,marIn,marOut,address);

MDR100 MDR100(clk,reset,data_in,bus,readFromBus,outToMem,readFromMem,outToBus,data_out,bus);

ID100 ID100(clk,IRin,bus,reset,opCode,para1,para2);

ALU100 ALU100(control,bus,reset,bus,aluIn1,aluIn2,aluOutRegOut);

REG100 REG100(clk,bus,reset,regIn,regOut,bus);

endmodule 


