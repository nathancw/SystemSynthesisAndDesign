
/*module ID(en,instr,reset,state,parameter1,parameter2);
input[15:0] instr;
input en,reset;
output[3:0] state;
output[5:0] parameter1,parameter2;
reg[5:0] parameter1,parameter2;
reg[3:0] state;
reg[15:0] instrReg;
reg regParameter;


always@(posedge reset or posedge en)
begin
if(reset) 
begin
parameter1=6'b0;
parameter2=6'b0;
state=4'b0;
instrReg=16'b0;
end
else

begin
instrReg=instr;
state=instrReg[15:12];
parameter1=instrReg[11:6];
parameter2=instrReg[5:0];

end 
end
endmodule
*/
module ID(clk,en,instr,reset,state,parameter1,parameter2);
input[15:0] instr;
input clk,en,reset;
output[3:0] state;
output[5:0] parameter1,parameter2;
reg[5:0] parameter1,parameter2;
reg[3:0] state;
reg[15:0] instrReg;
reg regParameter;


always@(posedge reset or posedge clk)
begin
if(reset) 
begin
parameter1=6'b0;
parameter2=6'b0;
state=4'b0;
instrReg=16'b0;
end
else if(en)

begin
instrReg=instr;
state=instrReg[15:12];
parameter1=instrReg[11:6];
parameter2=instrReg[5:0];

end 
end
endmodule
