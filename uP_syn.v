
module uP100 ( data_in, data_out, clk, reset, MFC, address, RW, EN );
  input [15:0] data_in;
  output [15:0] data_out;
  output [15:0] address;
  input clk, reset, MFC;
  output RW, EN;

  tri   [15:0] data_in;
  tri   [15:0] data_out;
  tri   [15:0] address;
  tri   [15:0] bus;
  tri   pcOut;
  tri   marIn;
  tri   marOut;
  tri   readFromMem;
  tri   outToBus;
  tri   readFromBus;
  tri   outToMem;
  tri   IRin;
  tri   aluIn1;
  tri   aluIn2;
  tri   aluOutRegOut;
  tri   incr;
  tri   [3:0] control;
  tri   [3:0] opCode;
  tri   [5:0] para1;
  tri   [5:0] para2;
  tri   [5:0] regIn;
  tri   [5:0] regOut;
  tri   clk;
  tri   reset;
  tri   MFC;
  tri   EN;
  tri   RW;

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

/*
module uP100(data_in , data_out , clk , reset , MFC , address , RW , EN);
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

*/


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [16:0] carry;

  FADDX2 U2_14 ( .A(A[14]), .B(n2), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  FADDX2 U2_13 ( .A(A[13]), .B(n3), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  FADDX2 U2_12 ( .A(A[12]), .B(n4), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  FADDX2 U2_11 ( .A(A[11]), .B(n5), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  FADDX2 U2_10 ( .A(A[10]), .B(n6), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  FADDX2 U2_9 ( .A(A[9]), .B(n7), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  FADDX2 U2_8 ( .A(A[8]), .B(n8), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  FADDX2 U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  FADDX2 U2_6 ( .A(A[6]), .B(n10), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  FADDX2 U2_5 ( .A(A[5]), .B(n11), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  FADDX2 U2_4 ( .A(A[4]), .B(n12), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  FADDX2 U2_3 ( .A(A[3]), .B(n13), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  FADDX2 U2_2 ( .A(A[2]), .B(n14), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  FADDX2 U2_1 ( .A(A[1]), .B(n15), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR2X2 U1 ( .IN1(B[0]), .IN2(A[0]), .Q(DIFF[0]) );
  XNOR3X2 U2 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(DIFF[15]) );
  AOINVX1 U3 ( .IN(B[1]), .QN(n15) );
  NAND2X0 U4 ( .IN1(B[0]), .IN2(n1), .QN(carry[1]) );
  AOINVX1 U5 ( .IN(B[2]), .QN(n14) );
  AOINVX1 U6 ( .IN(B[3]), .QN(n13) );
  AOINVX1 U7 ( .IN(B[4]), .QN(n12) );
  AOINVX1 U8 ( .IN(B[5]), .QN(n11) );
  AOINVX1 U9 ( .IN(B[6]), .QN(n10) );
  AOINVX1 U10 ( .IN(B[7]), .QN(n9) );
  AOINVX1 U11 ( .IN(B[8]), .QN(n8) );
  AOINVX1 U12 ( .IN(B[9]), .QN(n7) );
  AOINVX1 U13 ( .IN(B[10]), .QN(n6) );
  AOINVX1 U14 ( .IN(B[11]), .QN(n5) );
  AOINVX1 U15 ( .IN(B[12]), .QN(n4) );
  AOINVX1 U16 ( .IN(B[13]), .QN(n3) );
  AOINVX1 U17 ( .IN(B[14]), .QN(n2) );
  AOINVX1 U18 ( .IN(A[0]), .QN(n1) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;

  wire   [15:1] carry;

  FADDX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FADDX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FADDX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FADDX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FADDX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FADDX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FADDX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  FADDX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  FADDX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  FADDX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  FADDX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  XOR3X2 U1_15 ( .IN1(A[15]), .IN2(B[15]), .IN3(carry[15]), .Q(SUM[15]) );
  AND2X1 U1 ( .IN1(A[0]), .IN2(B[0]), .Q(carry[1]) );
  XOR2X2 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
endmodule


module ALU100 ( control, data, reset, out, in1, in2, outSignal );
  input [3:0] control;
  input [15:0] data;
  output [15:0] out;
  input reset, in1, in2, outSignal;
  wire   N44, N51, N54, N57, N60, N63, N66, N69, N72, N75, N78, N81, N84, N87,
         N90, N93, N96, N141, N142, N143, N144, N145, N146, N147, N148, N149,
         N150, N151, N152, N153, N154, N155, N156, N157, N158, N159, N160,
         N161, N162, N163, N164, N165, N166, N167, N168, N169, N170, N171,
         N172, N205, N206, N207, N208, N209, N210, N211, N212, N213, N214,
         N215, N216, N217, N218, N219, N220, N285, N286, N287, N288, N289,
         N290, N291, N292, N293, N294, N295, N296, N297, N298, N299, N300,
         N302, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483;
  wire   [15:0] regOne;
  wire   [15:0] regTwo;
  wire   [15:0] outReg;
  wire   [15:0] tempReg;
  tri   [15:0] out;

  LATCHX2 \regTwo_reg[15]  ( .CLK(N44), .D(data[15]), .Q(regTwo[15]) );
  LATCHX2 \regTwo_reg[14]  ( .CLK(N44), .D(data[14]), .Q(regTwo[14]) );
  LATCHX2 \regTwo_reg[13]  ( .CLK(N44), .D(data[13]), .Q(regTwo[13]) );
  LATCHX2 \regTwo_reg[12]  ( .CLK(N44), .D(data[12]), .Q(regTwo[12]) );
  LATCHX2 \regTwo_reg[11]  ( .CLK(N44), .D(data[11]), .Q(regTwo[11]) );
  LATCHX2 \regTwo_reg[10]  ( .CLK(N44), .D(data[10]), .Q(regTwo[10]) );
  LATCHX2 \regTwo_reg[9]  ( .CLK(N44), .D(data[9]), .Q(regTwo[9]) );
  LATCHX2 \regTwo_reg[8]  ( .CLK(N44), .D(data[8]), .Q(regTwo[8]), .QN(n312)
         );
  LATCHX2 \regTwo_reg[7]  ( .CLK(N44), .D(data[7]), .Q(regTwo[7]) );
  LATCHX2 \regTwo_reg[6]  ( .CLK(N44), .D(data[6]), .Q(regTwo[6]) );
  LATCHX2 \regTwo_reg[5]  ( .CLK(N44), .D(data[5]), .Q(regTwo[5]) );
  LATCHX2 \regTwo_reg[4]  ( .CLK(N44), .D(data[4]), .Q(regTwo[4]) );
  LATCHX2 \regTwo_reg[3]  ( .CLK(N44), .D(data[3]), .Q(regTwo[3]) );
  LATCHX2 \regTwo_reg[2]  ( .CLK(N44), .D(data[2]), .Q(regTwo[2]) );
  LATCHX2 \regTwo_reg[1]  ( .CLK(N44), .D(data[1]), .Q(regTwo[1]) );
  LATCHX2 \regTwo_reg[0]  ( .CLK(N44), .D(data[0]), .Q(regTwo[0]) );
  LATCHX2 \out_tri_enable_reg[15]  ( .CLK(n350), .D(n308), .QN(n100) );
  LATCHX2 \out_tri_enable_reg[14]  ( .CLK(n352), .D(n308), .QN(n101) );
  LATCHX2 \out_tri_enable_reg[13]  ( .CLK(n351), .D(n308), .QN(n102) );
  LATCHX2 \out_tri_enable_reg[12]  ( .CLK(n350), .D(n308), .QN(n103) );
  LATCHX2 \out_tri_enable_reg[11]  ( .CLK(n352), .D(n308), .QN(n104) );
  LATCHX2 \out_tri_enable_reg[10]  ( .CLK(n351), .D(n308), .QN(n105) );
  LATCHX2 \out_tri_enable_reg[9]  ( .CLK(n350), .D(n308), .QN(n106) );
  LATCHX2 \out_tri_enable_reg[8]  ( .CLK(n352), .D(n308), .QN(n107) );
  LATCHX2 \out_tri_enable_reg[7]  ( .CLK(n351), .D(n308), .QN(n108) );
  LATCHX2 \out_tri_enable_reg[6]  ( .CLK(n350), .D(n308), .QN(n109) );
  LATCHX2 \out_tri_enable_reg[5]  ( .CLK(n352), .D(n308), .QN(n110) );
  LATCHX2 \out_tri_enable_reg[4]  ( .CLK(n351), .D(n308), .QN(n111) );
  LATCHX2 \out_tri_enable_reg[3]  ( .CLK(n350), .D(n308), .QN(n112) );
  LATCHX2 \out_tri_enable_reg[2]  ( .CLK(n352), .D(n308), .QN(n113) );
  LATCHX2 \out_tri_enable_reg[1]  ( .CLK(n351), .D(n308), .QN(n114) );
  LATCHX2 \out_tri_enable_reg[0]  ( .CLK(n350), .D(n308), .QN(n115) );
  LATCHX2 \regOne_reg[15]  ( .CLK(in1), .D(data[15]), .Q(regOne[15]) );
  LATCHX2 \regOne_reg[14]  ( .CLK(in1), .D(data[14]), .Q(regOne[14]) );
  LATCHX2 \regOne_reg[13]  ( .CLK(in1), .D(data[13]), .Q(regOne[13]) );
  LATCHX2 \regOne_reg[12]  ( .CLK(in1), .D(data[12]), .Q(regOne[12]) );
  LATCHX2 \regOne_reg[11]  ( .CLK(in1), .D(data[11]), .Q(regOne[11]) );
  LATCHX2 \regOne_reg[10]  ( .CLK(in1), .D(data[10]), .Q(regOne[10]) );
  LATCHX2 \regOne_reg[9]  ( .CLK(in1), .D(data[9]), .Q(regOne[9]) );
  LATCHX2 \regOne_reg[8]  ( .CLK(in1), .D(data[8]), .Q(regOne[8]) );
  LATCHX2 \regOne_reg[7]  ( .CLK(in1), .D(data[7]), .Q(regOne[7]) );
  LATCHX2 \regOne_reg[6]  ( .CLK(in1), .D(data[6]), .Q(regOne[6]) );
  LATCHX2 \regOne_reg[5]  ( .CLK(in1), .D(data[5]), .Q(regOne[5]) );
  LATCHX2 \regOne_reg[4]  ( .CLK(in1), .D(data[4]), .Q(regOne[4]), .QN(n311)
         );
  LATCHX2 \regOne_reg[3]  ( .CLK(in1), .D(data[3]), .Q(regOne[3]) );
  LATCHX2 \regOne_reg[2]  ( .CLK(in1), .D(data[2]), .Q(regOne[2]) );
  LATCHX2 \regOne_reg[1]  ( .CLK(in1), .D(data[1]), .Q(regOne[1]) );
  LATCHX2 \regOne_reg[0]  ( .CLK(in1), .D(data[0]), .Q(regOne[0]) );
  LATCHX2 \outReg_reg[15]  ( .CLK(n330), .D(N300), .Q(outReg[15]) );
  LATCHX2 \out_reg[15]  ( .CLK(n349), .D(outReg[15]), .Q(N51) );
  LATCHX2 \outReg_reg[14]  ( .CLK(n330), .D(N299), .Q(outReg[14]) );
  LATCHX2 \out_reg[14]  ( .CLK(n349), .D(outReg[14]), .Q(N54) );
  LATCHX2 \outReg_reg[13]  ( .CLK(n330), .D(N298), .Q(outReg[13]) );
  LATCHX2 \out_reg[13]  ( .CLK(n349), .D(outReg[13]), .Q(N57) );
  LATCHX2 \outReg_reg[12]  ( .CLK(n330), .D(N297), .Q(outReg[12]) );
  LATCHX2 \out_reg[12]  ( .CLK(n349), .D(outReg[12]), .Q(N60) );
  LATCHX2 \outReg_reg[11]  ( .CLK(n330), .D(N296), .Q(outReg[11]) );
  LATCHX2 \out_reg[11]  ( .CLK(n349), .D(outReg[11]), .Q(N63) );
  LATCHX2 \outReg_reg[10]  ( .CLK(n330), .D(N295), .Q(outReg[10]) );
  LATCHX2 \out_reg[10]  ( .CLK(n349), .D(outReg[10]), .Q(N66) );
  LATCHX2 \outReg_reg[9]  ( .CLK(n330), .D(N294), .Q(outReg[9]) );
  LATCHX2 \out_reg[9]  ( .CLK(n349), .D(outReg[9]), .Q(N69) );
  LATCHX2 \outReg_reg[8]  ( .CLK(n330), .D(N293), .Q(outReg[8]) );
  LATCHX2 \out_reg[8]  ( .CLK(n350), .D(outReg[8]), .Q(N72) );
  LATCHX2 \outReg_reg[7]  ( .CLK(n331), .D(N292), .Q(outReg[7]) );
  LATCHX2 \out_reg[7]  ( .CLK(n352), .D(outReg[7]), .Q(N75) );
  LATCHX2 \outReg_reg[6]  ( .CLK(n331), .D(N291), .Q(outReg[6]) );
  LATCHX2 \out_reg[6]  ( .CLK(n351), .D(outReg[6]), .Q(N78) );
  LATCHX2 \outReg_reg[5]  ( .CLK(n331), .D(N290), .Q(outReg[5]) );
  LATCHX2 \out_reg[5]  ( .CLK(n350), .D(outReg[5]), .Q(N81) );
  LATCHX2 \outReg_reg[4]  ( .CLK(n331), .D(N289), .Q(outReg[4]) );
  LATCHX2 \out_reg[4]  ( .CLK(n352), .D(outReg[4]), .Q(N84) );
  LATCHX2 \outReg_reg[3]  ( .CLK(n331), .D(N288), .Q(outReg[3]) );
  LATCHX2 \out_reg[3]  ( .CLK(n351), .D(outReg[3]), .Q(N87) );
  LATCHX2 \outReg_reg[2]  ( .CLK(n331), .D(N287), .Q(outReg[2]) );
  LATCHX2 \out_reg[2]  ( .CLK(n350), .D(outReg[2]), .Q(N90) );
  LATCHX2 \outReg_reg[1]  ( .CLK(n331), .D(N286), .Q(outReg[1]) );
  LATCHX2 \out_reg[1]  ( .CLK(n352), .D(outReg[1]), .Q(N93) );
  LATCHX2 \outReg_reg[0]  ( .CLK(n331), .D(N285), .Q(outReg[0]) );
  LATCHX2 \out_reg[0]  ( .CLK(n351), .D(outReg[0]), .Q(N96) );
  LATCHX2 \tempReg_reg[15]  ( .CLK(N302), .D(outReg[15]), .Q(tempReg[15]) );
  LATCHX2 \tempReg_reg[14]  ( .CLK(N302), .D(outReg[14]), .Q(tempReg[14]) );
  LATCHX2 \tempReg_reg[13]  ( .CLK(N302), .D(outReg[13]), .Q(tempReg[13]) );
  LATCHX2 \tempReg_reg[12]  ( .CLK(N302), .D(outReg[12]), .Q(tempReg[12]) );
  LATCHX2 \tempReg_reg[11]  ( .CLK(N302), .D(outReg[11]), .Q(tempReg[11]) );
  LATCHX2 \tempReg_reg[10]  ( .CLK(N302), .D(outReg[10]), .Q(tempReg[10]) );
  LATCHX2 \tempReg_reg[9]  ( .CLK(N302), .D(outReg[9]), .Q(tempReg[9]) );
  LATCHX2 \tempReg_reg[8]  ( .CLK(N302), .D(outReg[8]), .Q(tempReg[8]) );
  LATCHX2 \tempReg_reg[7]  ( .CLK(N302), .D(outReg[7]), .Q(tempReg[7]) );
  LATCHX2 \tempReg_reg[6]  ( .CLK(N302), .D(outReg[6]), .Q(tempReg[6]) );
  LATCHX2 \tempReg_reg[5]  ( .CLK(N302), .D(outReg[5]), .Q(tempReg[5]) );
  LATCHX2 \tempReg_reg[4]  ( .CLK(N302), .D(outReg[4]), .Q(tempReg[4]) );
  LATCHX2 \tempReg_reg[3]  ( .CLK(N302), .D(outReg[3]), .Q(tempReg[3]) );
  LATCHX2 \tempReg_reg[2]  ( .CLK(N302), .D(outReg[2]), .Q(tempReg[2]) );
  LATCHX2 \tempReg_reg[1]  ( .CLK(N302), .D(outReg[1]), .Q(tempReg[1]) );
  LATCHX2 \tempReg_reg[0]  ( .CLK(N302), .D(outReg[0]), .Q(tempReg[0]) );
  TNBUFFHX8 \out_tri[0]  ( .IN(n328), .ENB(n347), .Q(out[0]) );
  TNBUFFHX8 \out_tri[1]  ( .IN(n327), .ENB(n346), .Q(out[1]) );
  TNBUFFHX8 \out_tri[2]  ( .IN(n326), .ENB(n345), .Q(out[2]) );
  TNBUFFHX8 \out_tri[3]  ( .IN(n325), .ENB(n344), .Q(out[3]) );
  TNBUFFHX8 \out_tri[4]  ( .IN(n324), .ENB(n343), .Q(out[4]) );
  TNBUFFHX8 \out_tri[5]  ( .IN(n323), .ENB(n342), .Q(out[5]) );
  TNBUFFHX8 \out_tri[6]  ( .IN(n322), .ENB(n341), .Q(out[6]) );
  TNBUFFHX8 \out_tri[7]  ( .IN(n321), .ENB(n340), .Q(out[7]) );
  TNBUFFHX8 \out_tri[8]  ( .IN(n320), .ENB(n339), .Q(out[8]) );
  TNBUFFHX8 \out_tri[9]  ( .IN(n319), .ENB(n338), .Q(out[9]) );
  TNBUFFHX8 \out_tri[10]  ( .IN(n318), .ENB(n337), .Q(out[10]) );
  TNBUFFHX8 \out_tri[11]  ( .IN(n317), .ENB(n336), .Q(out[11]) );
  TNBUFFHX8 \out_tri[12]  ( .IN(n316), .ENB(n335), .Q(out[12]) );
  TNBUFFHX8 \out_tri[13]  ( .IN(n315), .ENB(n334), .Q(out[13]) );
  TNBUFFHX8 \out_tri[14]  ( .IN(n314), .ENB(n333), .Q(out[14]) );
  TNBUFFHX8 \out_tri[15]  ( .IN(n313), .ENB(n332), .Q(out[15]) );
  ALU_DW01_sub_0 r62 ( .A(regOne), .B(regTwo), .CI(1'b0), .DIFF({N172, N171, 
        N170, N169, N168, N167, N166, N165, N164, N163, N162, N161, N160, N159, 
        N158, N157}) );
  ALU_DW01_add_0 r61 ( .A(regOne), .B(regTwo), .CI(1'b0), .SUM({N156, N155, 
        N154, N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, N143, 
        N142, N141}) );
  NBUFFX16 U205 ( .IN(N51), .Q(n313) );
  NBUFFX16 U206 ( .IN(N54), .Q(n314) );
  NBUFFX16 U207 ( .IN(N57), .Q(n315) );
  NBUFFX16 U208 ( .IN(N60), .Q(n316) );
  NBUFFX16 U209 ( .IN(N63), .Q(n317) );
  NBUFFX16 U210 ( .IN(N66), .Q(n318) );
  NBUFFX16 U211 ( .IN(N69), .Q(n319) );
  NBUFFX16 U212 ( .IN(N72), .Q(n320) );
  NBUFFX16 U213 ( .IN(N75), .Q(n321) );
  NBUFFX16 U214 ( .IN(N78), .Q(n322) );
  NBUFFX16 U215 ( .IN(N81), .Q(n323) );
  NBUFFX16 U216 ( .IN(N84), .Q(n324) );
  NBUFFX16 U217 ( .IN(N87), .Q(n325) );
  NBUFFX16 U218 ( .IN(N90), .Q(n326) );
  NBUFFX16 U219 ( .IN(N93), .Q(n327) );
  NBUFFX16 U220 ( .IN(N96), .Q(n328) );
  AND2X1 U221 ( .IN1(control[3]), .IN2(n436), .Q(n329) );
  AOINVX1 U222 ( .IN(n329), .QN(n330) );
  AOINVX1 U223 ( .IN(n329), .QN(n331) );
  NBUFFX16 U224 ( .IN(n100), .Q(n332) );
  NBUFFX16 U225 ( .IN(n101), .Q(n333) );
  NBUFFX16 U226 ( .IN(n102), .Q(n334) );
  NBUFFX16 U227 ( .IN(n103), .Q(n335) );
  NBUFFX16 U228 ( .IN(n104), .Q(n336) );
  NBUFFX16 U229 ( .IN(n105), .Q(n337) );
  NBUFFX16 U230 ( .IN(n106), .Q(n338) );
  NBUFFX16 U231 ( .IN(n107), .Q(n339) );
  NBUFFX16 U232 ( .IN(n108), .Q(n340) );
  NBUFFX16 U233 ( .IN(n109), .Q(n341) );
  NBUFFX16 U234 ( .IN(n110), .Q(n342) );
  NBUFFX16 U235 ( .IN(n111), .Q(n343) );
  NBUFFX16 U236 ( .IN(n112), .Q(n344) );
  NBUFFX16 U237 ( .IN(n113), .Q(n345) );
  NBUFFX16 U238 ( .IN(n114), .Q(n346) );
  NBUFFX16 U239 ( .IN(n115), .Q(n347) );
  ISOLORX2 U240 ( .D(in1), .ISO(in2), .Q(n348) );
  AOINVX1 U241 ( .IN(n348), .QN(n349) );
  AOINVX1 U242 ( .IN(n348), .QN(n350) );
  AOINVX1 U243 ( .IN(n348), .QN(n351) );
  AOINVX1 U244 ( .IN(n348), .QN(n352) );
  NOR2X2 U245 ( .IN1(control[3]), .IN2(n418), .QN(n353) );
  AOINVX1 U246 ( .IN(n306), .QN(n466) );
  AOINVX1 U247 ( .IN(n305), .QN(n464) );
  AOINVX1 U248 ( .IN(n304), .QN(n462) );
  AOINVX1 U249 ( .IN(n303), .QN(n460) );
  AOINVX1 U250 ( .IN(n302), .QN(n458) );
  AOINVX1 U251 ( .IN(n301), .QN(n456) );
  AOINVX1 U252 ( .IN(n300), .QN(n454) );
  AOINVX1 U253 ( .IN(n299), .QN(n452) );
  AOINVX1 U254 ( .IN(n298), .QN(n450) );
  AOINVX1 U255 ( .IN(n297), .QN(n448) );
  AOINVX1 U256 ( .IN(n296), .QN(n446) );
  AOINVX1 U257 ( .IN(n295), .QN(n444) );
  AOINVX1 U258 ( .IN(n294), .QN(n442) );
  AOINVX1 U259 ( .IN(n293), .QN(n440) );
  AOINVX1 U260 ( .IN(n292), .QN(n438) );
  AOINVX1 U261 ( .IN(n307), .QN(n468) );
  AOINVX1 U262 ( .IN(control[3]), .QN(n434) );
  AOINVX1 U263 ( .IN(regOne[0]), .QN(n483) );
  AOINVX1 U264 ( .IN(regOne[1]), .QN(n482) );
  AOINVX1 U265 ( .IN(regOne[2]), .QN(n481) );
  AOINVX1 U266 ( .IN(regOne[3]), .QN(n480) );
  AOINVX1 U267 ( .IN(regOne[5]), .QN(n479) );
  AOINVX1 U268 ( .IN(regOne[6]), .QN(n478) );
  AOINVX1 U269 ( .IN(regOne[7]), .QN(n477) );
  AOINVX1 U270 ( .IN(regOne[8]), .QN(n476) );
  AOINVX1 U271 ( .IN(regOne[9]), .QN(n475) );
  AOINVX1 U272 ( .IN(regOne[10]), .QN(n474) );
  AOINVX1 U273 ( .IN(regOne[11]), .QN(n473) );
  AOINVX1 U274 ( .IN(regOne[12]), .QN(n472) );
  AOINVX1 U275 ( .IN(regOne[13]), .QN(n471) );
  AOINVX1 U276 ( .IN(regOne[14]), .QN(n470) );
  AOINVX1 U277 ( .IN(regOne[15]), .QN(n469) );
  AOINVX1 U278 ( .IN(regTwo[0]), .QN(n433) );
  AOINVX1 U279 ( .IN(regTwo[1]), .QN(n432) );
  AOINVX1 U280 ( .IN(regTwo[2]), .QN(n431) );
  AOINVX1 U281 ( .IN(regTwo[3]), .QN(n430) );
  AOINVX1 U282 ( .IN(regTwo[4]), .QN(n429) );
  AOINVX1 U283 ( .IN(regTwo[5]), .QN(n428) );
  AOINVX1 U284 ( .IN(regTwo[6]), .QN(n427) );
  AOINVX1 U285 ( .IN(regTwo[7]), .QN(n426) );
  AOINVX1 U286 ( .IN(regTwo[9]), .QN(n425) );
  AOINVX1 U287 ( .IN(regTwo[10]), .QN(n424) );
  AOINVX1 U288 ( .IN(regTwo[11]), .QN(n423) );
  AOINVX1 U289 ( .IN(regTwo[12]), .QN(n422) );
  AOINVX1 U290 ( .IN(regTwo[13]), .QN(n421) );
  AOINVX1 U291 ( .IN(regTwo[14]), .QN(n420) );
  AOINVX1 U292 ( .IN(regTwo[15]), .QN(n419) );
  AOINVX1 U293 ( .IN(control[2]), .QN(n418) );
  MUX21X2 U294 ( .IN1(n467), .IN2(N141), .S(control[2]), .Q(n354) );
  MUX21X2 U295 ( .IN1(N157), .IN2(n468), .S(n353), .Q(n355) );
  MUX21X2 U296 ( .IN1(n483), .IN2(n307), .S(control[2]), .Q(n356) );
  MUX21X2 U297 ( .IN1(tempReg[0]), .IN2(N220), .S(control[2]), .Q(n357) );
  MUX41X2 U298 ( .IN1(n357), .IN3(n355), .IN2(n356), .IN4(n354), .S0(
        control[0]), .S1(control[1]), .Q(N285) );
  MUX21X2 U299 ( .IN1(n465), .IN2(N142), .S(control[2]), .Q(n358) );
  MUX21X2 U300 ( .IN1(N158), .IN2(n466), .S(n353), .Q(n359) );
  MUX21X2 U301 ( .IN1(n482), .IN2(n306), .S(control[2]), .Q(n360) );
  MUX21X2 U302 ( .IN1(tempReg[1]), .IN2(N219), .S(control[2]), .Q(n361) );
  MUX41X2 U303 ( .IN1(n361), .IN3(n359), .IN2(n360), .IN4(n358), .S0(
        control[0]), .S1(control[1]), .Q(N286) );
  MUX21X2 U304 ( .IN1(n463), .IN2(N143), .S(control[2]), .Q(n362) );
  MUX21X2 U305 ( .IN1(N159), .IN2(n464), .S(n353), .Q(n363) );
  MUX21X2 U306 ( .IN1(n481), .IN2(n305), .S(control[2]), .Q(n364) );
  MUX21X2 U307 ( .IN1(tempReg[2]), .IN2(N218), .S(control[2]), .Q(n365) );
  MUX41X2 U308 ( .IN1(n365), .IN3(n363), .IN2(n364), .IN4(n362), .S0(
        control[0]), .S1(control[1]), .Q(N287) );
  MUX21X2 U309 ( .IN1(n461), .IN2(N144), .S(control[2]), .Q(n366) );
  MUX21X2 U310 ( .IN1(N160), .IN2(n462), .S(n353), .Q(n367) );
  MUX21X2 U311 ( .IN1(n480), .IN2(n304), .S(control[2]), .Q(n368) );
  MUX21X2 U312 ( .IN1(tempReg[3]), .IN2(N217), .S(control[2]), .Q(n369) );
  MUX41X2 U313 ( .IN1(n369), .IN3(n367), .IN2(n368), .IN4(n366), .S0(
        control[0]), .S1(control[1]), .Q(N288) );
  MUX21X2 U314 ( .IN1(n459), .IN2(N145), .S(control[2]), .Q(n370) );
  MUX21X2 U315 ( .IN1(N161), .IN2(n460), .S(n353), .Q(n371) );
  MUX21X2 U316 ( .IN1(n311), .IN2(n303), .S(control[2]), .Q(n372) );
  MUX21X2 U317 ( .IN1(tempReg[4]), .IN2(N216), .S(control[2]), .Q(n373) );
  MUX41X2 U318 ( .IN1(n373), .IN3(n371), .IN2(n372), .IN4(n370), .S0(
        control[0]), .S1(control[1]), .Q(N289) );
  MUX21X2 U319 ( .IN1(n457), .IN2(N146), .S(control[2]), .Q(n374) );
  MUX21X2 U320 ( .IN1(N162), .IN2(n458), .S(n353), .Q(n375) );
  MUX21X2 U321 ( .IN1(n479), .IN2(n302), .S(control[2]), .Q(n376) );
  MUX21X2 U322 ( .IN1(tempReg[5]), .IN2(N215), .S(control[2]), .Q(n377) );
  MUX41X2 U323 ( .IN1(n377), .IN3(n375), .IN2(n376), .IN4(n374), .S0(
        control[0]), .S1(control[1]), .Q(N290) );
  MUX21X2 U324 ( .IN1(n455), .IN2(N147), .S(control[2]), .Q(n378) );
  MUX21X2 U325 ( .IN1(N163), .IN2(n456), .S(n353), .Q(n379) );
  MUX21X2 U326 ( .IN1(n478), .IN2(n301), .S(control[2]), .Q(n380) );
  MUX21X2 U327 ( .IN1(tempReg[6]), .IN2(N214), .S(control[2]), .Q(n381) );
  MUX41X2 U328 ( .IN1(n381), .IN3(n379), .IN2(n380), .IN4(n378), .S0(
        control[0]), .S1(control[1]), .Q(N291) );
  MUX21X2 U329 ( .IN1(n453), .IN2(N148), .S(control[2]), .Q(n382) );
  MUX21X2 U330 ( .IN1(N164), .IN2(n454), .S(n353), .Q(n383) );
  MUX21X2 U331 ( .IN1(n477), .IN2(n300), .S(control[2]), .Q(n384) );
  MUX21X2 U332 ( .IN1(tempReg[7]), .IN2(N213), .S(control[2]), .Q(n385) );
  MUX41X2 U333 ( .IN1(n385), .IN3(n383), .IN2(n384), .IN4(n382), .S0(
        control[0]), .S1(control[1]), .Q(N292) );
  MUX21X2 U334 ( .IN1(n451), .IN2(N149), .S(control[2]), .Q(n386) );
  MUX21X2 U335 ( .IN1(N165), .IN2(n452), .S(n353), .Q(n387) );
  MUX21X2 U336 ( .IN1(n476), .IN2(n299), .S(control[2]), .Q(n388) );
  MUX21X2 U337 ( .IN1(tempReg[8]), .IN2(N212), .S(control[2]), .Q(n389) );
  MUX41X2 U338 ( .IN1(n389), .IN3(n387), .IN2(n388), .IN4(n386), .S0(
        control[0]), .S1(control[1]), .Q(N293) );
  MUX21X2 U339 ( .IN1(n449), .IN2(N150), .S(control[2]), .Q(n390) );
  MUX21X2 U340 ( .IN1(N166), .IN2(n450), .S(n353), .Q(n391) );
  MUX21X2 U341 ( .IN1(n475), .IN2(n298), .S(control[2]), .Q(n392) );
  MUX21X2 U342 ( .IN1(tempReg[9]), .IN2(N211), .S(control[2]), .Q(n393) );
  MUX41X2 U343 ( .IN1(n393), .IN3(n391), .IN2(n392), .IN4(n390), .S0(
        control[0]), .S1(control[1]), .Q(N294) );
  MUX21X2 U344 ( .IN1(n447), .IN2(N151), .S(control[2]), .Q(n394) );
  MUX21X2 U345 ( .IN1(N167), .IN2(n448), .S(n353), .Q(n395) );
  MUX21X2 U346 ( .IN1(n474), .IN2(n297), .S(control[2]), .Q(n396) );
  MUX21X2 U347 ( .IN1(tempReg[10]), .IN2(N210), .S(control[2]), .Q(n397) );
  MUX41X2 U348 ( .IN1(n397), .IN3(n395), .IN2(n396), .IN4(n394), .S0(
        control[0]), .S1(control[1]), .Q(N295) );
  MUX21X2 U349 ( .IN1(n445), .IN2(N152), .S(control[2]), .Q(n398) );
  MUX21X2 U350 ( .IN1(N168), .IN2(n446), .S(n353), .Q(n399) );
  MUX21X2 U351 ( .IN1(n473), .IN2(n296), .S(control[2]), .Q(n400) );
  MUX21X2 U352 ( .IN1(tempReg[11]), .IN2(N209), .S(control[2]), .Q(n401) );
  MUX41X2 U353 ( .IN1(n401), .IN3(n399), .IN2(n400), .IN4(n398), .S0(
        control[0]), .S1(control[1]), .Q(N296) );
  MUX21X2 U354 ( .IN1(n443), .IN2(N153), .S(control[2]), .Q(n402) );
  MUX21X2 U355 ( .IN1(N169), .IN2(n444), .S(n353), .Q(n403) );
  MUX21X2 U356 ( .IN1(n472), .IN2(n295), .S(control[2]), .Q(n404) );
  MUX21X2 U357 ( .IN1(tempReg[12]), .IN2(N208), .S(control[2]), .Q(n405) );
  MUX41X2 U358 ( .IN1(n405), .IN3(n403), .IN2(n404), .IN4(n402), .S0(
        control[0]), .S1(control[1]), .Q(N297) );
  MUX21X2 U359 ( .IN1(n441), .IN2(N154), .S(control[2]), .Q(n406) );
  MUX21X2 U360 ( .IN1(N170), .IN2(n442), .S(n353), .Q(n407) );
  MUX21X2 U361 ( .IN1(n471), .IN2(n294), .S(control[2]), .Q(n408) );
  MUX21X2 U362 ( .IN1(tempReg[13]), .IN2(N207), .S(control[2]), .Q(n409) );
  MUX41X2 U363 ( .IN1(n409), .IN3(n407), .IN2(n408), .IN4(n406), .S0(
        control[0]), .S1(control[1]), .Q(N298) );
  MUX21X2 U364 ( .IN1(n439), .IN2(N155), .S(control[2]), .Q(n410) );
  MUX21X2 U365 ( .IN1(N171), .IN2(n440), .S(n353), .Q(n411) );
  MUX21X2 U366 ( .IN1(n470), .IN2(n293), .S(control[2]), .Q(n412) );
  MUX21X2 U367 ( .IN1(tempReg[14]), .IN2(N206), .S(control[2]), .Q(n413) );
  MUX41X2 U368 ( .IN1(n413), .IN3(n411), .IN2(n412), .IN4(n410), .S0(
        control[0]), .S1(control[1]), .Q(N299) );
  MUX21X2 U369 ( .IN1(n437), .IN2(N156), .S(control[2]), .Q(n414) );
  MUX21X2 U370 ( .IN1(N172), .IN2(n438), .S(n353), .Q(n415) );
  MUX21X2 U371 ( .IN1(n469), .IN2(n292), .S(control[2]), .Q(n416) );
  MUX21X2 U372 ( .IN1(tempReg[15]), .IN2(N205), .S(control[2]), .Q(n417) );
  MUX41X2 U373 ( .IN1(n417), .IN3(n415), .IN2(n416), .IN4(n414), .S0(
        control[0]), .S1(control[1]), .Q(N300) );
  NOR2X1 U374 ( .IN1(n469), .IN2(n419), .QN(n437) );
  NOR2X1 U375 ( .IN1(n470), .IN2(n420), .QN(n439) );
  NOR2X1 U376 ( .IN1(n471), .IN2(n421), .QN(n441) );
  NOR2X1 U377 ( .IN1(n472), .IN2(n422), .QN(n443) );
  NOR2X1 U378 ( .IN1(n473), .IN2(n423), .QN(n445) );
  NOR2X1 U379 ( .IN1(n474), .IN2(n424), .QN(n447) );
  NOR2X1 U380 ( .IN1(n475), .IN2(n425), .QN(n449) );
  NOR2X1 U381 ( .IN1(n476), .IN2(n312), .QN(n451) );
  NOR2X1 U382 ( .IN1(n477), .IN2(n426), .QN(n453) );
  NOR2X1 U383 ( .IN1(n478), .IN2(n427), .QN(n455) );
  NOR2X1 U384 ( .IN1(n479), .IN2(n428), .QN(n457) );
  NOR2X1 U385 ( .IN1(n311), .IN2(n429), .QN(n459) );
  NOR2X1 U386 ( .IN1(n480), .IN2(n430), .QN(n461) );
  NOR2X1 U387 ( .IN1(n481), .IN2(n431), .QN(n463) );
  NOR2X1 U388 ( .IN1(n482), .IN2(n432), .QN(n465) );
  NOR2X1 U389 ( .IN1(n483), .IN2(n433), .QN(n467) );
  ISOLANDX1 U390 ( .D(n349), .ISO(outSignal), .Q(n308) );
  XNOR2X2 U391 ( .IN1(regTwo[0]), .IN2(regOne[0]), .Q(n307) );
  XNOR2X2 U392 ( .IN1(regTwo[1]), .IN2(regOne[1]), .Q(n306) );
  XNOR2X2 U393 ( .IN1(regTwo[2]), .IN2(regOne[2]), .Q(n305) );
  XNOR2X2 U394 ( .IN1(regTwo[3]), .IN2(regOne[3]), .Q(n304) );
  XNOR2X2 U395 ( .IN1(regTwo[4]), .IN2(regOne[4]), .Q(n303) );
  XNOR2X2 U396 ( .IN1(regTwo[5]), .IN2(regOne[5]), .Q(n302) );
  XNOR2X2 U397 ( .IN1(regTwo[6]), .IN2(regOne[6]), .Q(n301) );
  XNOR2X2 U398 ( .IN1(regTwo[7]), .IN2(regOne[7]), .Q(n300) );
  XNOR2X2 U399 ( .IN1(regTwo[8]), .IN2(regOne[8]), .Q(n299) );
  XNOR2X2 U400 ( .IN1(regTwo[9]), .IN2(regOne[9]), .Q(n298) );
  XNOR2X2 U401 ( .IN1(regTwo[10]), .IN2(regOne[10]), .Q(n297) );
  XNOR2X2 U402 ( .IN1(regTwo[11]), .IN2(regOne[11]), .Q(n296) );
  XNOR2X2 U403 ( .IN1(regTwo[12]), .IN2(regOne[12]), .Q(n295) );
  XNOR2X2 U404 ( .IN1(regTwo[13]), .IN2(regOne[13]), .Q(n294) );
  XNOR2X2 U405 ( .IN1(regTwo[14]), .IN2(regOne[14]), .Q(n293) );
  XNOR2X2 U406 ( .IN1(regTwo[15]), .IN2(regOne[15]), .Q(n292) );
  ISOLANDX1 U407 ( .D(in2), .ISO(in1), .Q(N44) );
  AO22X2 U408 ( .IN1(control[0]), .IN2(control[2]), .IN3(n434), .IN4(n435), 
        .Q(N302) );
  OR3X2 U409 ( .IN1(control[0]), .IN2(control[2]), .IN3(control[1]), .Q(n435)
         );
  NAND2X0 U410 ( .IN1(control[2]), .IN2(control[0]), .QN(n436) );
  NAND2X0 U411 ( .IN1(n433), .IN2(n483), .QN(N220) );
  NAND2X0 U412 ( .IN1(n432), .IN2(n482), .QN(N219) );
  NAND2X0 U413 ( .IN1(n431), .IN2(n481), .QN(N218) );
  NAND2X0 U414 ( .IN1(n430), .IN2(n480), .QN(N217) );
  NAND2X0 U415 ( .IN1(n429), .IN2(n311), .QN(N216) );
  NAND2X0 U416 ( .IN1(n428), .IN2(n479), .QN(N215) );
  NAND2X0 U417 ( .IN1(n427), .IN2(n478), .QN(N214) );
  NAND2X0 U418 ( .IN1(n426), .IN2(n477), .QN(N213) );
  NAND2X0 U419 ( .IN1(n312), .IN2(n476), .QN(N212) );
  NAND2X0 U420 ( .IN1(n425), .IN2(n475), .QN(N211) );
  NAND2X0 U421 ( .IN1(n424), .IN2(n474), .QN(N210) );
  NAND2X0 U422 ( .IN1(n423), .IN2(n473), .QN(N209) );
  NAND2X0 U423 ( .IN1(n422), .IN2(n472), .QN(N208) );
  NAND2X0 U424 ( .IN1(n421), .IN2(n471), .QN(N207) );
  NAND2X0 U425 ( .IN1(n420), .IN2(n470), .QN(N206) );
  NAND2X0 U426 ( .IN1(n419), .IN2(n469), .QN(N205) );
endmodule


module IF_FSM100 ( clk, reset, MFC, fetch, pcOut, marIn, MemEN, marOut, RW, 
        readFromMem, outToBus, IRin, done );
  input clk, reset, MFC, fetch;
  output pcOut, marIn, MemEN, marOut, RW, readFromMem, outToBus, IRin, done;
  wire   N120, N126, N130, N133, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41;
  wire   [3:0] pres_state;

  DFFARX2 \pres_state_reg[3]  ( .D(n18), .CLK(clk), .RSTB(n12), .Q(
        pres_state[3]) );
  LATCHX2 IRin_reg ( .CLK(N133), .D(n13), .Q(IRin) );
  LATCHX2 done_reg ( .CLK(N133), .D(n19), .Q(done) );
  LATCHX2 pcOut_reg ( .CLK(N133), .D(N120), .Q(pcOut) );
  LATCHX2 marIn_reg ( .CLK(N133), .D(N120), .Q(marIn) );
  LATCHX2 MemEN_reg ( .CLK(N133), .D(N126), .Q(MemEN) );
  LATCHX2 marOut_reg ( .CLK(N133), .D(N126), .Q(marOut) );
  LATCHX2 RW_reg ( .CLK(N133), .D(N126), .Q(RW) );
  LATCHX2 readFromMem_reg ( .CLK(N133), .D(n17), .Q(readFromMem) );
  LATCHX2 outToBus_reg ( .CLK(N133), .D(N130), .Q(outToBus) );
  OAI221X2 U30 ( .IN1(n15), .IN2(n27), .IN3(n22), .IN4(n28), .IN5(n24), .QN(
        n41) );
  OA21X1 U31 ( .IN1(pres_state[0]), .IN2(n14), .IN3(n30), .Q(n27) );
  AO222X2 U32 ( .IN1(n31), .IN2(n32), .IN3(MFC), .IN4(n16), .IN5(fetch), .IN6(
        n19), .Q(n28) );
  NOR4X0 U33 ( .IN1(n18), .IN2(N126), .IN3(n19), .IN4(n35), .QN(N120) );
  AODFFARX2 \pres_state_reg[1]  ( .D(n40), .CLK(clk), .RSTB(n12), .Q(
        pres_state[1]), .QN(n21) );
  AODFFARX2 \pres_state_reg[2]  ( .D(n39), .CLK(clk), .RSTB(n12), .Q(
        pres_state[2]), .QN(n20) );
  AODFFARX2 \pres_state_reg[0]  ( .D(n41), .CLK(clk), .RSTB(n12), .Q(
        pres_state[0]), .QN(n22) );
  AOINVX1 U3 ( .IN(n34), .QN(n18) );
  NAND3X0 U4 ( .IN1(n30), .IN2(n14), .IN3(N120), .QN(N133) );
  AOINVX1 U5 ( .IN(n25), .QN(n17) );
  AOINVX1 U6 ( .IN(n28), .QN(n15) );
  AOINVX1 U7 ( .IN(n32), .QN(n19) );
  NAND2X0 U8 ( .IN1(n26), .IN2(n36), .QN(n25) );
  NAND2X0 U9 ( .IN1(n37), .IN2(n29), .QN(n34) );
  NAND2X0 U10 ( .IN1(n26), .IN2(n37), .QN(n30) );
  NOR2X1 U11 ( .IN1(n26), .IN2(n14), .QN(n40) );
  AOINVX1 U12 ( .IN(n36), .QN(n14) );
  NAND2X0 U13 ( .IN1(n25), .IN2(n33), .QN(n35) );
  NAND2X0 U14 ( .IN1(n33), .IN2(n34), .QN(N130) );
  AOINVX1 U15 ( .IN(n33), .QN(n13) );
  AOINVX1 U16 ( .IN(n31), .QN(n16) );
  NAND3X0 U17 ( .IN1(n23), .IN2(n24), .IN3(n25), .QN(n39) );
  NAND2X0 U18 ( .IN1(n15), .IN2(pres_state[2]), .QN(n23) );
  NOR2X1 U19 ( .IN1(pres_state[3]), .IN2(pres_state[2]), .QN(n36) );
  NOR2X1 U20 ( .IN1(n20), .IN2(pres_state[3]), .QN(n37) );
  NAND3X0 U21 ( .IN1(n36), .IN2(n22), .IN3(pres_state[1]), .QN(n31) );
  NAND3X0 U22 ( .IN1(n37), .IN2(n21), .IN3(pres_state[0]), .QN(n32) );
  NOR2X1 U23 ( .IN1(n22), .IN2(n21), .QN(n26) );
  NOR2X1 U24 ( .IN1(pres_state[1]), .IN2(pres_state[0]), .QN(n29) );
  NAND2X0 U25 ( .IN1(n29), .IN2(n20), .QN(n24) );
  AOINVX1 U26 ( .IN(reset), .QN(n12) );
  NAND2X0 U27 ( .IN1(n31), .IN2(n38), .QN(N126) );
  NAND3X0 U28 ( .IN1(n36), .IN2(n21), .IN3(pres_state[0]), .QN(n38) );
  NAND3X0 U29 ( .IN1(n29), .IN2(n20), .IN3(pres_state[3]), .QN(n33) );
endmodule


module ADD_FSM100 ( clk, reset, start, opCode, para1, para2, paraOut, aluIn1, 
        aluIn2, control, aluOutRegIn, aluOutRegOut, regIn, incr, fetch );
  input [3:0] opCode;
  input [5:0] para1;
  input [5:0] para2;
  output [5:0] paraOut;
  output [3:0] control;
  output [5:0] regIn;
  input clk, reset, start;
  output aluIn1, aluIn2, aluOutRegIn, aluOutRegOut, incr, fetch;
  wire   N55, N56, N57, N58, N59, N105, N107, N109, N111, N113, N115, N117,
         N120, N122, N124, N126, N130, N132, N134, N136, N138, N140, N143, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n75, n76, n77, n78;
  wire   [3:0] next_state;
  wire   [3:0] pres_state;

  LATCHX2 \next_state_reg[0]  ( .CLK(N58), .D(N55), .Q(next_state[0]), .QN(n40) );
  LATCHX2 \next_state_reg[2]  ( .CLK(N58), .D(N57), .Q(next_state[2]), .QN(n41) );
  LATCHX2 \next_state_reg[1]  ( .CLK(N58), .D(N56), .Q(next_state[1]), .QN(n42) );
  LATCHX2 \next_state_reg[3]  ( .CLK(N58), .D(N59), .Q(next_state[3]), .QN(n43) );
  LATCHX2 aluOutRegIn_reg ( .CLK(N143), .D(n76), .Q(aluOutRegIn) );
  LATCHX2 aluOutRegOut_reg ( .CLK(N143), .D(n77), .Q(aluOutRegOut) );
  LATCHX2 incr_reg ( .CLK(N143), .D(n78), .Q(incr) );
  LATCHX2 \regIn_reg[5]  ( .CLK(N143), .D(N140), .Q(regIn[5]) );
  LATCHX2 \regIn_reg[4]  ( .CLK(N143), .D(N138), .Q(regIn[4]) );
  LATCHX2 \regIn_reg[3]  ( .CLK(N143), .D(N136), .Q(regIn[3]) );
  LATCHX2 \regIn_reg[2]  ( .CLK(N143), .D(N134), .Q(regIn[2]) );
  LATCHX2 \regIn_reg[1]  ( .CLK(N143), .D(N132), .Q(regIn[1]) );
  LATCHX2 \regIn_reg[0]  ( .CLK(N143), .D(N130), .Q(regIn[0]) );
  LATCHX2 fetch_reg ( .CLK(N143), .D(n77), .Q(fetch) );
  LATCHX2 \paraOut_reg[5]  ( .CLK(N143), .D(N115), .Q(paraOut[5]) );
  LATCHX2 \paraOut_reg[4]  ( .CLK(N143), .D(N113), .Q(paraOut[4]) );
  LATCHX2 \paraOut_reg[3]  ( .CLK(N143), .D(N111), .Q(paraOut[3]) );
  LATCHX2 \paraOut_reg[2]  ( .CLK(N143), .D(N109), .Q(paraOut[2]) );
  LATCHX2 \paraOut_reg[1]  ( .CLK(N143), .D(N107), .Q(paraOut[1]) );
  LATCHX2 \paraOut_reg[0]  ( .CLK(N143), .D(N105), .Q(paraOut[0]) );
  LATCHX2 aluIn1_reg ( .CLK(N143), .D(N117), .Q(aluIn1) );
  LATCHX2 aluIn2_reg ( .CLK(N143), .D(n75), .Q(aluIn2) );
  LATCHX2 \control_reg[3]  ( .CLK(N143), .D(N126), .Q(control[3]) );
  LATCHX2 \control_reg[2]  ( .CLK(N143), .D(N124), .Q(control[2]) );
  LATCHX2 \control_reg[1]  ( .CLK(N143), .D(N122), .Q(control[1]) );
  LATCHX2 \control_reg[0]  ( .CLK(N143), .D(N120), .Q(control[0]) );
  DFFASX2 \pres_state_reg[0]  ( .D(n52), .CLK(clk), .SETB(n44), .Q(
        pres_state[0]), .QN(n45) );
  DFFASX2 \pres_state_reg[2]  ( .D(n51), .CLK(clk), .SETB(n44), .Q(
        pres_state[2]), .QN(n47) );
  DFFASX2 \pres_state_reg[1]  ( .D(n50), .CLK(clk), .SETB(n44), .Q(
        pres_state[1]), .QN(n46) );
  DFFARX2 \pres_state_reg[3]  ( .D(n49), .CLK(clk), .RSTB(n44), .Q(
        pres_state[3]), .QN(n48) );
  NOR2X1 U3 ( .IN1(n5), .IN2(n43), .QN(n49) );
  NAND2X0 U4 ( .IN1(n41), .IN2(n6), .QN(n51) );
  NAND2X0 U5 ( .IN1(n42), .IN2(n6), .QN(n50) );
  NAND2X0 U6 ( .IN1(n40), .IN2(n6), .QN(n52) );
  NOR2X1 U8 ( .IN1(start), .IN2(n7), .QN(n5) );
  NAND4X0 U12 ( .IN1(n10), .IN2(n11), .IN3(n12), .IN4(n13), .QN(N58) );
  NOR2X1 U13 ( .IN1(n14), .IN2(n15), .QN(n12) );
  NAND3X0 U14 ( .IN1(n16), .IN2(n13), .IN3(n10), .QN(N57) );
  NAND3X0 U15 ( .IN1(n11), .IN2(n8), .IN3(n10), .QN(N56) );
  NAND4X0 U16 ( .IN1(n11), .IN2(n13), .IN3(n17), .IN4(n18), .QN(N55) );
  ISOLANDX1 U17 ( .D(n19), .ISO(N117), .Q(n17) );
  OR4X2 U18 ( .IN1(n20), .IN2(n21), .IN3(N117), .IN4(N59), .Q(N143) );
  NAND2X0 U19 ( .IN1(n9), .IN2(n19), .QN(N59) );
  NAND2X0 U21 ( .IN1(n22), .IN2(n23), .QN(N140) );
  NAND2X0 U23 ( .IN1(n22), .IN2(n24), .QN(N138) );
  NAND2X0 U25 ( .IN1(n22), .IN2(n25), .QN(N136) );
  NAND2X0 U27 ( .IN1(n22), .IN2(n26), .QN(N134) );
  NAND2X0 U29 ( .IN1(n22), .IN2(n27), .QN(N132) );
  NAND2X0 U31 ( .IN1(n22), .IN2(n28), .QN(N130) );
  AND4X1 U33 ( .IN1(n29), .IN2(n20), .IN3(n30), .IN4(n8), .Q(n22) );
  NAND3X0 U34 ( .IN1(n10), .IN2(n8), .IN3(n29), .QN(n20) );
  ISOLANDX1 U35 ( .D(opCode[3]), .ISO(n29), .Q(N126) );
  ISOLANDX1 U36 ( .D(opCode[2]), .ISO(n29), .Q(N124) );
  ISOLANDX1 U37 ( .D(opCode[1]), .ISO(n29), .Q(N122) );
  ISOLANDX1 U38 ( .D(opCode[0]), .ISO(n29), .Q(N120) );
  AO221X2 U40 ( .IN1(para2[5]), .IN2(n32), .IN3(para1[5]), .IN4(n33), .IN5(n34), .Q(N115) );
  AO221X2 U41 ( .IN1(para2[4]), .IN2(n32), .IN3(para1[4]), .IN4(n33), .IN5(n34), .Q(N113) );
  AO221X2 U42 ( .IN1(para2[3]), .IN2(n32), .IN3(para1[3]), .IN4(n33), .IN5(n34), .Q(N111) );
  AO221X2 U43 ( .IN1(para2[2]), .IN2(n32), .IN3(para1[2]), .IN4(n33), .IN5(n34), .Q(N109) );
  AO221X2 U44 ( .IN1(para2[1]), .IN2(n32), .IN3(para1[1]), .IN4(n33), .IN5(n34), .Q(N107) );
  AO221X2 U45 ( .IN1(para2[0]), .IN2(n32), .IN3(para1[0]), .IN4(n33), .IN5(n34), .Q(N105) );
  NAND3X0 U46 ( .IN1(n10), .IN2(n7), .IN3(n29), .QN(n34) );
  AND3X1 U47 ( .IN1(n11), .IN2(n13), .IN3(n16), .Q(n29) );
  NAND3X0 U48 ( .IN1(n14), .IN2(n35), .IN3(n47), .QN(n16) );
  NAND3X0 U49 ( .IN1(n46), .IN2(n36), .IN3(n37), .QN(n13) );
  NAND3X0 U50 ( .IN1(n47), .IN2(n35), .IN3(n37), .QN(n11) );
  NAND3X0 U51 ( .IN1(n35), .IN2(n36), .IN3(n14), .QN(n7) );
  NOR2X1 U52 ( .IN1(n76), .IN2(n77), .QN(n10) );
  NAND3X0 U54 ( .IN1(n35), .IN2(n36), .IN3(n37), .QN(n18) );
  NAND3X0 U56 ( .IN1(n14), .IN2(n36), .IN3(n46), .QN(n30) );
  NAND2X0 U57 ( .IN1(n31), .IN2(n9), .QN(n33) );
  NAND2X0 U58 ( .IN1(n37), .IN2(n15), .QN(n9) );
  NOR2X1 U59 ( .IN1(n38), .IN2(n39), .QN(n37) );
  NAND3X0 U60 ( .IN1(n15), .IN2(n39), .IN3(n45), .QN(n31) );
  NAND2X0 U61 ( .IN1(n8), .IN2(n19), .QN(n32) );
  NAND2X0 U62 ( .IN1(n15), .IN2(n14), .QN(n19) );
  NOR2X1 U63 ( .IN1(n39), .IN2(n45), .QN(n14) );
  NAND3X0 U64 ( .IN1(n38), .IN2(n39), .IN3(n15), .QN(n8) );
  NOR2X1 U65 ( .IN1(n36), .IN2(n35), .QN(n15) );
  AOINVX1 U70 ( .IN(n9), .QN(n78) );
  AOINVX1 U71 ( .IN(n7), .QN(n21) );
  AOINVX1 U72 ( .IN(n18), .QN(n77) );
  AOINVX1 U73 ( .IN(n8), .QN(n75) );
  AOINVX1 U74 ( .IN(n5), .QN(n6) );
  AOINVX1 U75 ( .IN(n31), .QN(N117) );
  AOINVX1 U76 ( .IN(n30), .QN(n76) );
  AOINVX1 U77 ( .IN(n46), .QN(n35) );
  AOINVX1 U78 ( .IN(n47), .QN(n36) );
  AOINVX1 U79 ( .IN(n48), .QN(n39) );
  AOINVX1 U80 ( .IN(reset), .QN(n44) );
  AOINVX1 U81 ( .IN(para1[0]), .QN(n28) );
  AOINVX1 U82 ( .IN(para1[1]), .QN(n27) );
  AOINVX1 U83 ( .IN(para1[2]), .QN(n26) );
  AOINVX1 U84 ( .IN(para1[3]), .QN(n25) );
  AOINVX1 U85 ( .IN(para1[4]), .QN(n24) );
  AOINVX1 U86 ( .IN(para1[5]), .QN(n23) );
  AOINVX1 U87 ( .IN(n45), .QN(n38) );
endmodule




module ADDI_FSM100 ( clk, reset, start, opCode, para1, para2, paraOut, 
        paraExtendedOut, aluIn1, aluIn2, control, aluOutRegIn, aluOutRegOut, 
        regIn, incr, fetch );
  input [3:0] opCode;
  input [5:0] para1;
  input [5:0] para2;
  output [5:0] paraOut;
  output [15:0] paraExtendedOut;
  output [3:0] control;
  output [5:0] regIn;
  input clk, reset, start;
  output aluIn1, aluIn2, aluOutRegIn, aluOutRegOut, incr, fetch;
  wire   N71, N72, N73, N74, N75, N153, N155, N157, N159, N161, N163, N195,
         N197, N200, N202, N204, N206, N210, N212, N214, N216, N218, N220,
         N223, N225, N228, N231, N234, N237, N240, N243, N246, N249, N252,
         N254, N255, N257, N258, N260, N261, N263, N264, N266, N267, N269,
         N270, n2, n4, n5, n6, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n133, n134, n135, n136, n137, n141, n142,
         n143, n144, n1, n7, n8, n9, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21;
  wire   [3:0] next_state;
  wire   [3:0] pres_state;
  tri   [15:0] paraExtendedOut;

  LATCHX2 \next_state_reg[0]  ( .CLK(N74), .D(N71), .Q(next_state[0]), .QN(n2)
         );
  DFFASX2 \pres_state_reg[0]  ( .D(n144), .CLK(clk), .SETB(n133), .Q(
        pres_state[0]) );
  LATCHX2 \next_state_reg[3]  ( .CLK(N74), .D(N75), .Q(next_state[3]), .QN(n4)
         );
  DFFARX2 \pres_state_reg[3]  ( .D(n142), .CLK(clk), .RSTB(n133), .Q(
        pres_state[3]) );
  LATCHX2 \next_state_reg[2]  ( .CLK(N74), .D(N73), .Q(next_state[2]), .QN(n5)
         );
  DFFASX2 \pres_state_reg[2]  ( .D(n141), .CLK(clk), .SETB(n133), .Q(
        pres_state[2]) );
  DFFASX2 \pres_state_reg[1]  ( .D(n143), .CLK(clk), .SETB(n133), .Q(
        pres_state[1]) );
  LATCHX2 \next_state_reg[1]  ( .CLK(N74), .D(N72), .Q(next_state[1]), .QN(n6)
         );
  LATCHX2 aluOutRegIn_reg ( .CLK(n21), .D(n137), .Q(aluOutRegIn) );
  LATCHX2 aluOutRegOut_reg ( .CLK(n21), .D(n136), .Q(aluOutRegOut) );
  LATCHX2 incr_reg ( .CLK(n21), .D(n135), .Q(incr) );
  LATCHX2 \regIn_reg[5]  ( .CLK(n21), .D(N220), .Q(regIn[5]) );
  LATCHX2 \regIn_reg[4]  ( .CLK(n20), .D(N218), .Q(regIn[4]) );
  LATCHX2 \regIn_reg[3]  ( .CLK(n20), .D(N216), .Q(regIn[3]) );
  LATCHX2 \regIn_reg[2]  ( .CLK(n21), .D(N214), .Q(regIn[2]) );
  LATCHX2 \regIn_reg[1]  ( .CLK(n20), .D(N212), .Q(regIn[1]) );
  LATCHX2 \regIn_reg[0]  ( .CLK(n21), .D(N210), .Q(regIn[0]) );
  LATCHX2 fetch_reg ( .CLK(n20), .D(n136), .Q(fetch) );
  LATCHX2 \paraOut_reg[5]  ( .CLK(n21), .D(N163), .Q(paraOut[5]) );
  LATCHX2 \paraOut_reg[4]  ( .CLK(n20), .D(N161), .Q(paraOut[4]) );
  LATCHX2 \paraOut_reg[3]  ( .CLK(n20), .D(N159), .Q(paraOut[3]) );
  LATCHX2 \paraOut_reg[2]  ( .CLK(n20), .D(N157), .Q(paraOut[2]) );
  LATCHX2 \paraOut_reg[1]  ( .CLK(N223), .D(N155), .Q(paraOut[1]) );
  LATCHX2 \paraOut_reg[0]  ( .CLK(n21), .D(N153), .Q(paraOut[0]) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[15]  ( .CLK(n21), .D(N195), .Q(N225), 
        .QN(n89) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[14]  ( .CLK(n20), .D(N195), .Q(N228), 
        .QN(n90) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[13]  ( .CLK(n21), .D(N195), .Q(N231), 
        .QN(n91) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[12]  ( .CLK(n20), .D(N195), .Q(N234), 
        .QN(n92) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[11]  ( .CLK(n20), .D(N195), .Q(N237), 
        .QN(n93) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[10]  ( .CLK(n21), .D(N195), .Q(N240), 
        .QN(n94) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[9]  ( .CLK(n20), .D(N195), .Q(N243), 
        .QN(n95) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[8]  ( .CLK(N223), .D(N195), .Q(N246), 
        .QN(n96) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[7]  ( .CLK(n20), .D(N195), .Q(N249), 
        .QN(n97) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[6]  ( .CLK(n21), .D(N195), .Q(N252), 
        .QN(n98) );
  LATCHX2 \paraExtendedOut_reg[5]  ( .CLK(n20), .D(para2[5]), .Q(N254) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[5]  ( .CLK(n21), .D(N195), .Q(N255), 
        .QN(n99) );
  LATCHX2 \paraExtendedOut_reg[4]  ( .CLK(N223), .D(para2[4]), .Q(N257) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[4]  ( .CLK(n20), .D(N195), .Q(N258), 
        .QN(n100) );
  LATCHX2 \paraExtendedOut_reg[3]  ( .CLK(n21), .D(para2[3]), .Q(N260) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[3]  ( .CLK(N223), .D(N195), .Q(N261), 
        .QN(n101) );
  LATCHX2 \paraExtendedOut_reg[2]  ( .CLK(N223), .D(para2[2]), .Q(N263) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[2]  ( .CLK(n20), .D(N195), .Q(N264), 
        .QN(n102) );
  LATCHX2 \paraExtendedOut_reg[1]  ( .CLK(n21), .D(para2[1]), .Q(N266) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[1]  ( .CLK(n20), .D(N195), .Q(N267), 
        .QN(n103) );
  LATCHX2 \paraExtendedOut_reg[0]  ( .CLK(N223), .D(para2[0]), .Q(N269) );
  LATCHX2 \paraExtendedOut_tri_enable_reg[0]  ( .CLK(n21), .D(N195), .Q(N270), 
        .QN(n104) );
  LATCHX2 aluIn1_reg ( .CLK(n21), .D(N197), .Q(aluIn1) );
  LATCHX2 aluIn2_reg ( .CLK(n21), .D(n134), .Q(aluIn2) );
  LATCHX2 \control_reg[3]  ( .CLK(n20), .D(N206), .Q(control[3]) );
  LATCHX2 \control_reg[2]  ( .CLK(N223), .D(N204), .Q(control[2]) );
  LATCHX2 \control_reg[1]  ( .CLK(n20), .D(N202), .Q(control[1]) );
  LATCHX2 \control_reg[0]  ( .CLK(N223), .D(N200), .Q(control[0]) );
  TNBUFFHX8 \paraExtendedOut_tri[0]  ( .IN(n19), .ENB(n104), .Q(
        paraExtendedOut[0]) );
  TNBUFFHX8 \paraExtendedOut_tri[1]  ( .IN(n17), .ENB(n103), .Q(
        paraExtendedOut[1]) );
  TNBUFFHX8 \paraExtendedOut_tri[2]  ( .IN(n15), .ENB(n102), .Q(
        paraExtendedOut[2]) );
  TNBUFFHX8 \paraExtendedOut_tri[3]  ( .IN(n13), .ENB(n101), .Q(
        paraExtendedOut[3]) );
  TNBUFFHX8 \paraExtendedOut_tri[4]  ( .IN(n11), .ENB(n100), .Q(
        paraExtendedOut[4]) );
  TNBUFFHX8 \paraExtendedOut_tri[5]  ( .IN(n8), .ENB(n99), .Q(
        paraExtendedOut[5]) );
  TNBUFFHX8 \paraExtendedOut_tri[6]  ( .IN(1'b0), .ENB(n98), .Q(
        paraExtendedOut[6]) );
  TNBUFFHX8 \paraExtendedOut_tri[7]  ( .IN(1'b0), .ENB(n97), .Q(
        paraExtendedOut[7]) );
  TNBUFFHX8 \paraExtendedOut_tri[8]  ( .IN(1'b0), .ENB(n96), .Q(
        paraExtendedOut[8]) );
  TNBUFFHX8 \paraExtendedOut_tri[9]  ( .IN(1'b0), .ENB(n95), .Q(
        paraExtendedOut[9]) );
  TNBUFFHX8 \paraExtendedOut_tri[10]  ( .IN(1'b0), .ENB(n94), .Q(
        paraExtendedOut[10]) );
  TNBUFFHX8 \paraExtendedOut_tri[11]  ( .IN(1'b0), .ENB(n93), .Q(
        paraExtendedOut[11]) );
  TNBUFFHX8 \paraExtendedOut_tri[12]  ( .IN(1'b0), .ENB(n92), .Q(
        paraExtendedOut[12]) );
  TNBUFFHX8 \paraExtendedOut_tri[13]  ( .IN(1'b0), .ENB(n91), .Q(
        paraExtendedOut[13]) );
  TNBUFFHX8 \paraExtendedOut_tri[14]  ( .IN(1'b0), .ENB(n90), .Q(
        paraExtendedOut[14]) );
  TNBUFFHX8 \paraExtendedOut_tri[15]  ( .IN(1'b0), .ENB(n89), .Q(
        paraExtendedOut[15]) );
  NAND2X0 U7 ( .IN1(n5), .IN2(n42), .QN(n141) );
  NOR2X1 U8 ( .IN1(n43), .IN2(n4), .QN(n142) );
  NAND2X0 U9 ( .IN1(n6), .IN2(n42), .QN(n143) );
  NAND2X0 U10 ( .IN1(n2), .IN2(n42), .QN(n144) );
  NOR2X1 U12 ( .IN1(start), .IN2(n44), .QN(n43) );
  NAND2X0 U13 ( .IN1(n41), .IN2(n45), .QN(N75) );
  NAND4X0 U14 ( .IN1(n46), .IN2(n47), .IN3(n48), .IN4(n49), .QN(N74) );
  NOR2X1 U15 ( .IN1(n50), .IN2(n51), .QN(n48) );
  NAND3X0 U16 ( .IN1(n52), .IN2(n49), .IN3(n46), .QN(N73) );
  NAND3X0 U17 ( .IN1(n47), .IN2(n40), .IN3(n46), .QN(N72) );
  NAND4X0 U18 ( .IN1(n47), .IN2(n49), .IN3(n53), .IN4(n45), .QN(N71) );
  NOR2X1 U19 ( .IN1(N197), .IN2(n136), .QN(n53) );
  NAND2X0 U20 ( .IN1(n54), .IN2(n55), .QN(N223) );
  NAND2X0 U21 ( .IN1(n56), .IN2(n57), .QN(N220) );
  NAND2X0 U23 ( .IN1(n56), .IN2(n58), .QN(N218) );
  NAND2X0 U25 ( .IN1(n56), .IN2(n59), .QN(N216) );
  NAND2X0 U27 ( .IN1(n56), .IN2(n60), .QN(N214) );
  NAND2X0 U29 ( .IN1(n56), .IN2(n61), .QN(N212) );
  NAND2X0 U31 ( .IN1(n56), .IN2(n62), .QN(N210) );
  AND4X1 U33 ( .IN1(n63), .IN2(n64), .IN3(n65), .IN4(n40), .Q(n56) );
  ISOLANDX1 U34 ( .D(opCode[3]), .ISO(n63), .Q(N206) );
  ISOLANDX1 U35 ( .D(opCode[2]), .ISO(n63), .Q(N204) );
  ISOLANDX1 U36 ( .D(opCode[1]), .ISO(n63), .Q(N202) );
  ISOLANDX1 U37 ( .D(opCode[0]), .ISO(n63), .Q(N200) );
  NAND2X0 U41 ( .IN1(n54), .IN2(n68), .QN(N163) );
  NAND2X0 U42 ( .IN1(para1[5]), .IN2(n67), .QN(n68) );
  NAND2X0 U43 ( .IN1(n54), .IN2(n69), .QN(N161) );
  NAND2X0 U44 ( .IN1(para1[4]), .IN2(n67), .QN(n69) );
  NAND2X0 U45 ( .IN1(n54), .IN2(n70), .QN(N159) );
  NAND2X0 U46 ( .IN1(para1[3]), .IN2(n67), .QN(n70) );
  NAND2X0 U47 ( .IN1(n54), .IN2(n71), .QN(N157) );
  NAND2X0 U48 ( .IN1(para1[2]), .IN2(n67), .QN(n71) );
  NAND2X0 U49 ( .IN1(n54), .IN2(n72), .QN(N155) );
  NAND2X0 U50 ( .IN1(para1[1]), .IN2(n67), .QN(n72) );
  NAND2X0 U51 ( .IN1(n54), .IN2(n73), .QN(N153) );
  NAND2X0 U52 ( .IN1(para1[0]), .IN2(n67), .QN(n73) );
  NAND2X0 U53 ( .IN1(n66), .IN2(n41), .QN(n67) );
  NAND2X0 U54 ( .IN1(n74), .IN2(n50), .QN(n41) );
  NAND3X0 U55 ( .IN1(n50), .IN2(n75), .IN3(pres_state[3]), .QN(n66) );
  AND3X1 U56 ( .IN1(n45), .IN2(n44), .IN3(n76), .Q(n54) );
  NAND3X0 U58 ( .IN1(n46), .IN2(n40), .IN3(n63), .QN(n64) );
  AND3X1 U59 ( .IN1(n47), .IN2(n49), .IN3(n52), .Q(n63) );
  NAND3X0 U60 ( .IN1(pres_state[1]), .IN2(n77), .IN3(n51), .QN(n52) );
  NAND3X0 U61 ( .IN1(n74), .IN2(n78), .IN3(pres_state[2]), .QN(n49) );
  NAND3X0 U62 ( .IN1(n74), .IN2(n77), .IN3(pres_state[1]), .QN(n47) );
  NAND3X0 U64 ( .IN1(pres_state[0]), .IN2(n50), .IN3(pres_state[3]), .QN(n40)
         );
  NOR2X1 U65 ( .IN1(n137), .IN2(n136), .QN(n46) );
  AND3X1 U66 ( .IN1(pres_state[1]), .IN2(n74), .IN3(pres_state[2]), .Q(n136)
         );
  NOR2X1 U67 ( .IN1(pres_state[3]), .IN2(pres_state[0]), .QN(n74) );
  NAND3X0 U69 ( .IN1(pres_state[2]), .IN2(n78), .IN3(n51), .QN(n65) );
  NAND3X0 U71 ( .IN1(pres_state[2]), .IN2(pres_state[1]), .IN3(n51), .QN(n44)
         );
  NAND2X0 U72 ( .IN1(n51), .IN2(n50), .QN(n45) );
  NOR2X1 U73 ( .IN1(pres_state[2]), .IN2(pres_state[1]), .QN(n50) );
  NOR2X1 U74 ( .IN1(n75), .IN2(pres_state[3]), .QN(n51) );
  AND4X1 U4 ( .IN1(n55), .IN2(n63), .IN3(n46), .IN4(n44), .Q(n1) );
  INVX0 U5 ( .IN(n1), .QN(N195) );
  AOINVX1 U6 ( .IN(N254), .QN(n7) );
  INVX8 U11 ( .IN(n7), .QN(n8) );
  AOINVX1 U22 ( .IN(N257), .QN(n9) );
  INVX8 U24 ( .IN(n9), .QN(n11) );
  AOINVX1 U26 ( .IN(N260), .QN(n12) );
  INVX8 U28 ( .IN(n12), .QN(n13) );
  AOINVX1 U30 ( .IN(N263), .QN(n14) );
  INVX8 U32 ( .IN(n14), .QN(n15) );
  AOINVX1 U38 ( .IN(N266), .QN(n16) );
  INVX8 U39 ( .IN(n16), .QN(n17) );
  AOINVX1 U40 ( .IN(N269), .QN(n18) );
  INVX8 U57 ( .IN(n18), .QN(n19) );
  AOBUFX1 U63 ( .IN(N223), .Q(n21) );
  AOBUFX1 U68 ( .IN(N223), .Q(n20) );
  AOINVX1 U70 ( .IN(n67), .QN(n55) );
  AOINVX1 U75 ( .IN(n41), .QN(n135) );
  AOINVX1 U76 ( .IN(n43), .QN(n42) );
  AOINVX1 U77 ( .IN(n64), .QN(n76) );
  AOINVX1 U78 ( .IN(n66), .QN(N197) );
  AOINVX1 U79 ( .IN(n65), .QN(n137) );
  AOINVX1 U80 ( .IN(n40), .QN(n134) );
  AOINVX1 U81 ( .IN(pres_state[0]), .QN(n75) );
  AOINVX1 U82 ( .IN(reset), .QN(n133) );
  AOINVX1 U83 ( .IN(para1[0]), .QN(n62) );
  AOINVX1 U84 ( .IN(para1[1]), .QN(n61) );
  AOINVX1 U85 ( .IN(para1[2]), .QN(n60) );
  AOINVX1 U86 ( .IN(para1[3]), .QN(n59) );
  AOINVX1 U87 ( .IN(para1[4]), .QN(n58) );
  AOINVX1 U88 ( .IN(para1[5]), .QN(n57) );
  AOINVX1 U89 ( .IN(pres_state[1]), .QN(n78) );
  AOINVX1 U90 ( .IN(pres_state[2]), .QN(n77) );
endmodule


module LOAD_FSM100( clk, reset, start, opCode, para1, para2, MFC, address, marIn, 
        MemEN, marOut, RW, readFromMem, outToBus, readFromBus, outToMem, regIn, 
        regOut, incr, fetch );
  input [3:0] opCode;
  input [5:0] para1;
  input [5:0] para2;
  output [15:0] address;
  output [5:0] regIn;
  output [5:0] regOut;
  input clk, reset, start, MFC;
  output marIn, MemEN, marOut, RW, readFromMem, outToBus, readFromBus,
         outToMem, incr, fetch;
  wire   RWstore, N218, N220, N222, N224, N226, N228, N789, N791, N793, N795,
         N797, N799, N811, N813, N815, N817, N819, N821, N822, N823, N855,
         N861, N863, N867, N871, N873, N875, N877, N879, N881, N883, N885,
         N887, N889, N891, N893, N895, N898, N899, N901, N904, N907, N910,
         N913, N916, N919, N922, N925, N928, N930, N931, N933, N934, N936,
         N937, N939, N940, N942, N943, N945, N946, n47, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n143, n144, n145, n146, n147,
         n148, n149, n150, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201;
  wire   [3:0] pres_state;
  wire   [15:0] addressStore;
  wire   [5:0] regStore;
  tri   [15:0] address;

  LATCHX2 incr_reg ( .CLK(n201), .D(n174), .Q(incr) );
  LATCHX2 fetch_reg ( .CLK(n201), .D(N899), .Q(fetch) );
  LATCHX2 \addressStore_reg[5]  ( .CLK(N822), .D(N799), .Q(addressStore[5]) );
  LATCHX2 \addressStore_reg[4]  ( .CLK(N822), .D(N797), .Q(addressStore[4]) );
  LATCHX2 \addressStore_reg[3]  ( .CLK(N822), .D(N795), .Q(addressStore[3]) );
  LATCHX2 \addressStore_reg[2]  ( .CLK(N822), .D(N793), .Q(addressStore[2]) );
  LATCHX2 \addressStore_reg[1]  ( .CLK(N822), .D(N791), .Q(addressStore[1]) );
  LATCHX2 \addressStore_reg[0]  ( .CLK(N822), .D(N789), .Q(addressStore[0]) );
  LATCHX2 \regStore_reg[5]  ( .CLK(N822), .D(N821), .Q(regStore[5]) );
  LATCHX2 \regOut_reg[5]  ( .CLK(n201), .D(N895), .Q(regOut[5]) );
  LATCHX2 \regIn_reg[5]  ( .CLK(n201), .D(N883), .Q(regIn[5]) );
  LATCHX2 \regStore_reg[4]  ( .CLK(N822), .D(N819), .Q(regStore[4]) );
  LATCHX2 \regOut_reg[4]  ( .CLK(n200), .D(N893), .Q(regOut[4]) );
  LATCHX2 \regIn_reg[4]  ( .CLK(n201), .D(N881), .Q(regIn[4]) );
  LATCHX2 \regStore_reg[3]  ( .CLK(N822), .D(N817), .Q(regStore[3]) );
  LATCHX2 \regOut_reg[3]  ( .CLK(n200), .D(N891), .Q(regOut[3]) );
  LATCHX2 \regIn_reg[3]  ( .CLK(n200), .D(N879), .Q(regIn[3]) );
  LATCHX2 \regStore_reg[2]  ( .CLK(N822), .D(N815), .Q(regStore[2]) );
  LATCHX2 \regOut_reg[2]  ( .CLK(N898), .D(N889), .Q(regOut[2]) );
  LATCHX2 \regIn_reg[2]  ( .CLK(n200), .D(N877), .Q(regIn[2]) );
  LATCHX2 \regStore_reg[1]  ( .CLK(N822), .D(N813), .Q(regStore[1]) );
  LATCHX2 \regOut_reg[1]  ( .CLK(n201), .D(N887), .Q(regOut[1]) );
  LATCHX2 \regIn_reg[1]  ( .CLK(N898), .D(N875), .Q(regIn[1]) );
  LATCHX2 \regStore_reg[0]  ( .CLK(N822), .D(N811), .Q(regStore[0]) );
  LATCHX2 \regOut_reg[0]  ( .CLK(n201), .D(N885), .Q(regOut[0]) );
  LATCHX2 \regIn_reg[0]  ( .CLK(n201), .D(N873), .Q(regIn[0]) );
  LATCHX2 RWstore_reg ( .CLK(N822), .D(N823), .Q(RWstore), .QN(n47) );
  LATCHX2 \address_tri_enable_reg[15]  ( .CLK(n201), .D(N855), .Q(N901), .QN(
        n120) );
  LATCHX2 \address_tri_enable_reg[14]  ( .CLK(n200), .D(N855), .Q(N904), .QN(
        n121) );
  LATCHX2 \address_tri_enable_reg[13]  ( .CLK(n200), .D(N855), .Q(N907), .QN(
        n122) );
  LATCHX2 \address_tri_enable_reg[12]  ( .CLK(N898), .D(N855), .Q(N910), .QN(
        n123) );
  LATCHX2 \address_tri_enable_reg[11]  ( .CLK(n201), .D(N855), .Q(N913), .QN(
        n124) );
  LATCHX2 \address_tri_enable_reg[10]  ( .CLK(N898), .D(N855), .Q(N916), .QN(
        n125) );
  LATCHX2 \address_tri_enable_reg[9]  ( .CLK(N898), .D(N855), .Q(N919), .QN(
        n126) );
  LATCHX2 \address_tri_enable_reg[8]  ( .CLK(n201), .D(N855), .Q(N922), .QN(
        n127) );
  LATCHX2 \address_tri_enable_reg[7]  ( .CLK(n201), .D(N855), .Q(N925), .QN(
        n128) );
  LATCHX2 \address_tri_enable_reg[6]  ( .CLK(n200), .D(N855), .Q(N928), .QN(
        n129) );
  LATCHX2 \address_reg[5]  ( .CLK(N898), .D(N228), .Q(N930) );
  LATCHX2 \address_tri_enable_reg[5]  ( .CLK(N898), .D(N855), .Q(N931), .QN(
        n130) );
  LATCHX2 \address_reg[4]  ( .CLK(n200), .D(N226), .Q(N933) );
  LATCHX2 \address_tri_enable_reg[4]  ( .CLK(n200), .D(N855), .Q(N934), .QN(
        n131) );
  LATCHX2 \address_reg[3]  ( .CLK(n200), .D(N224), .Q(N936) );
  LATCHX2 \address_tri_enable_reg[3]  ( .CLK(n201), .D(N855), .Q(N937), .QN(
        n132) );
  LATCHX2 \address_reg[2]  ( .CLK(n200), .D(N222), .Q(N939) );
  LATCHX2 \address_tri_enable_reg[2]  ( .CLK(n200), .D(N855), .Q(N940), .QN(
        n133) );
  LATCHX2 \address_reg[1]  ( .CLK(N898), .D(N220), .Q(N942) );
  LATCHX2 \address_tri_enable_reg[1]  ( .CLK(N898), .D(N855), .Q(N943), .QN(
        n134) );
  LATCHX2 \address_reg[0]  ( .CLK(n200), .D(N218), .Q(N945) );
  LATCHX2 \address_tri_enable_reg[0]  ( .CLK(n201), .D(N855), .Q(N946), .QN(
        n135) );
  LATCHX2 marIn_reg ( .CLK(N898), .D(n174), .Q(marIn) );
  LATCHX2 MemEN_reg ( .CLK(n200), .D(N861), .Q(MemEN) );
  LATCHX2 marOut_reg ( .CLK(n201), .D(N861), .Q(marOut) );
  LATCHX2 RW_reg ( .CLK(n200), .D(N863), .Q(RW) );
  LATCHX2 readFromMem_reg ( .CLK(n200), .D(n175), .Q(readFromMem) );
  LATCHX2 outToBus_reg ( .CLK(n201), .D(N867), .Q(outToBus) );
  LATCHX2 readFromBus_reg ( .CLK(n200), .D(n173), .Q(readFromBus) );
  LATCHX2 outToMem_reg ( .CLK(n201), .D(N871), .Q(outToMem) );
  DFFASX2 \pres_state_reg[0]  ( .D(n150), .CLK(clk), .SETB(n136), .Q(
        pres_state[0]), .QN(n143) );
  DFFARX2 \pres_state_reg[3]  ( .D(n149), .CLK(clk), .RSTB(n136), .Q(
        pres_state[3]), .QN(n146) );
  DFFASX2 \pres_state_reg[2]  ( .D(n148), .CLK(clk), .SETB(n136), .Q(
        pres_state[2]), .QN(n145) );
  DFFARX2 \pres_state_reg[1]  ( .D(n147), .CLK(clk), .RSTB(n136), .Q(
        pres_state[1]), .QN(n144) );
  TNBUFFHX8 \address_tri[0]  ( .IN(n182), .ENB(n198), .Q(address[0]) );
  TNBUFFHX8 \address_tri[1]  ( .IN(n181), .ENB(n197), .Q(address[1]) );
  TNBUFFHX8 \address_tri[2]  ( .IN(n180), .ENB(n196), .Q(address[2]) );
  TNBUFFHX8 \address_tri[3]  ( .IN(n179), .ENB(n195), .Q(address[3]) );
  TNBUFFHX8 \address_tri[4]  ( .IN(n178), .ENB(n194), .Q(address[4]) );
  TNBUFFHX8 \address_tri[5]  ( .IN(n177), .ENB(n193), .Q(address[5]) );
  TNBUFFHX8 \address_tri[6]  ( .IN(1'b0), .ENB(n192), .Q(address[6]) );
  TNBUFFHX8 \address_tri[7]  ( .IN(1'b0), .ENB(n191), .Q(address[7]) );
  TNBUFFHX8 \address_tri[8]  ( .IN(1'b0), .ENB(n190), .Q(address[8]) );
  TNBUFFHX8 \address_tri[9]  ( .IN(1'b0), .ENB(n189), .Q(address[9]) );
  TNBUFFHX8 \address_tri[10]  ( .IN(1'b0), .ENB(n188), .Q(address[10]) );
  TNBUFFHX8 \address_tri[11]  ( .IN(1'b0), .ENB(n187), .Q(address[11]) );
  TNBUFFHX8 \address_tri[12]  ( .IN(1'b0), .ENB(n186), .Q(address[12]) );
  TNBUFFHX8 \address_tri[13]  ( .IN(1'b0), .ENB(n185), .Q(address[13]) );
  TNBUFFHX8 \address_tri[14]  ( .IN(1'b0), .ENB(n184), .Q(address[14]) );
  TNBUFFHX8 \address_tri[15]  ( .IN(1'b0), .ENB(n183), .Q(address[15]) );
  AO221X2 U3 ( .IN1(n51), .IN2(n52), .IN3(n53), .IN4(n54), .IN5(n55), .Q(n149)
         );
  NAND3X0 U5 ( .IN1(n57), .IN2(n58), .IN3(n59), .QN(n53) );
  AO22X2 U7 ( .IN1(n60), .IN2(n61), .IN3(n62), .IN4(n54), .Q(n148) );
  NAND4X0 U8 ( .IN1(n63), .IN2(n64), .IN3(n57), .IN4(n65), .QN(n62) );
  NAND2X0 U9 ( .IN1(n66), .IN2(n67), .QN(n57) );
  NAND2X0 U10 ( .IN1(n68), .IN2(n69), .QN(n64) );
  NAND4X0 U11 ( .IN1(n59), .IN2(n70), .IN3(n65), .IN4(n71), .QN(n147) );
  AND2X1 U12 ( .IN1(n72), .IN2(n73), .Q(n59) );
  NAND2X0 U13 ( .IN1(n174), .IN2(n67), .QN(n72) );
  AO222X2 U14 ( .IN1(n74), .IN2(n54), .IN3(n75), .IN4(n51), .IN5(n60), .IN6(
        n76), .Q(n150) );
  ISOLANDX1 U15 ( .D(n77), .ISO(n54), .Q(n60) );
  NAND2X0 U16 ( .IN1(n51), .IN2(n78), .QN(n77) );
  NAND2X0 U17 ( .IN1(n67), .IN2(n79), .QN(n78) );
  NAND4X0 U19 ( .IN1(opCode[1]), .IN2(opCode[0]), .IN3(opCode[3]), .IN4(n80), 
        .QN(n67) );
  ISOLANDX1 U20 ( .D(start), .ISO(n81), .Q(n51) );
  NOR4X0 U21 ( .IN1(n82), .IN2(n80), .IN3(opCode[0]), .IN4(opCode[1]), .QN(n75) );
  AO22X2 U24 ( .IN1(n83), .IN2(n81), .IN3(MFC), .IN4(n66), .Q(n54) );
  NAND4X0 U26 ( .IN1(n84), .IN2(n85), .IN3(n63), .IN4(n83), .QN(n74) );
  AND4X1 U27 ( .IN1(n86), .IN2(n87), .IN3(n70), .IN4(n58), .Q(n63) );
  NAND3X0 U28 ( .IN1(n144), .IN2(n88), .IN3(n146), .QN(n87) );
  NAND3X0 U29 ( .IN1(n68), .IN2(n61), .IN3(n143), .QN(n86) );
  NAND3X0 U33 ( .IN1(n70), .IN2(n90), .IN3(n84), .QN(N898) );
  NAND2X0 U35 ( .IN1(n91), .IN2(n92), .QN(N895) );
  NAND2X0 U36 ( .IN1(n93), .IN2(n92), .QN(N893) );
  NAND2X0 U37 ( .IN1(n94), .IN2(n92), .QN(N891) );
  NAND2X0 U38 ( .IN1(n95), .IN2(n92), .QN(N889) );
  NAND2X0 U39 ( .IN1(n96), .IN2(n92), .QN(N887) );
  NAND2X0 U40 ( .IN1(n97), .IN2(n92), .QN(N885) );
  NAND2X0 U41 ( .IN1(n98), .IN2(n56), .QN(n92) );
  NAND2X0 U42 ( .IN1(n99), .IN2(n91), .QN(N883) );
  NAND2X0 U44 ( .IN1(n99), .IN2(n93), .QN(N881) );
  NAND2X0 U46 ( .IN1(n99), .IN2(n94), .QN(N879) );
  NAND2X0 U48 ( .IN1(n99), .IN2(n95), .QN(N877) );
  NAND2X0 U50 ( .IN1(n99), .IN2(n96), .QN(N875) );
  NAND2X0 U52 ( .IN1(n99), .IN2(n97), .QN(N873) );
  NAND2X0 U55 ( .IN1(n101), .IN2(n71), .QN(N871) );
  NAND2X0 U56 ( .IN1(n100), .IN2(n73), .QN(N867) );
  NOR2X1 U57 ( .IN1(n47), .IN2(n71), .QN(N863) );
  AND3X1 U59 ( .IN1(n73), .IN2(n71), .IN3(n56), .Q(n102) );
  NAND3X0 U60 ( .IN1(n68), .IN2(n69), .IN3(n103), .QN(n56) );
  NAND2X0 U62 ( .IN1(n83), .IN2(n104), .QN(N861) );
  NAND3X0 U63 ( .IN1(n146), .IN2(n144), .IN3(n103), .QN(n104) );
  NAND2X0 U64 ( .IN1(n105), .IN2(n106), .QN(n83) );
  NAND2X0 U65 ( .IN1(n107), .IN2(n108), .QN(n73) );
  NOR2X1 U66 ( .IN1(n173), .IN2(N899), .QN(n85) );
  NAND2X0 U67 ( .IN1(n100), .IN2(n101), .QN(N899) );
  NAND3X0 U68 ( .IN1(n68), .IN2(n69), .IN3(n108), .QN(n101) );
  NAND3X0 U69 ( .IN1(n68), .IN2(n69), .IN3(n106), .QN(n100) );
  NAND3X0 U71 ( .IN1(n143), .IN2(n61), .IN3(n107), .QN(n98) );
  NAND2X0 U72 ( .IN1(n103), .IN2(n105), .QN(n58) );
  AO22X2 U73 ( .IN1(para2[5]), .IN2(N823), .IN3(para1[5]), .IN4(n199), .Q(N821) );
  AO22X2 U74 ( .IN1(para2[4]), .IN2(N823), .IN3(para1[4]), .IN4(n109), .Q(N819) );
  AO22X2 U75 ( .IN1(para2[3]), .IN2(N823), .IN3(para1[3]), .IN4(n109), .Q(N817) );
  AO22X2 U76 ( .IN1(para2[2]), .IN2(N823), .IN3(para1[2]), .IN4(n109), .Q(N815) );
  AO22X2 U77 ( .IN1(para2[1]), .IN2(N823), .IN3(para1[1]), .IN4(n109), .Q(N813) );
  AO22X2 U78 ( .IN1(para2[0]), .IN2(N823), .IN3(para1[0]), .IN4(n109), .Q(N811) );
  AO22X2 U79 ( .IN1(para1[5]), .IN2(N823), .IN3(para2[5]), .IN4(n109), .Q(N799) );
  NAND2X0 U81 ( .IN1(n107), .IN2(n106), .QN(n70) );
  NOR2X1 U82 ( .IN1(n61), .IN2(n76), .QN(n106) );
  AO22X2 U84 ( .IN1(para1[4]), .IN2(N823), .IN3(para2[4]), .IN4(n109), .Q(N797) );
  AO22X2 U85 ( .IN1(para1[3]), .IN2(N823), .IN3(para2[3]), .IN4(n109), .Q(N795) );
  AO22X2 U86 ( .IN1(para1[2]), .IN2(N823), .IN3(para2[2]), .IN4(n199), .Q(N793) );
  AO22X2 U87 ( .IN1(para1[1]), .IN2(N823), .IN3(para2[1]), .IN4(n199), .Q(N791) );
  AO22X2 U88 ( .IN1(para1[0]), .IN2(N823), .IN3(para2[0]), .IN4(n199), .Q(N789) );
  ISOLANDX1 U89 ( .D(n81), .ISO(n109), .Q(N823) );
  NAND3X0 U90 ( .IN1(n144), .IN2(n108), .IN3(n146), .QN(n81) );
  AO222X2 U91 ( .IN1(para2[5]), .IN2(n199), .IN3(para1[5]), .IN4(n84), .IN5(
        n174), .IN6(addressStore[5]), .Q(N228) );
  AO222X2 U92 ( .IN1(para2[4]), .IN2(n199), .IN3(para1[4]), .IN4(n84), .IN5(
        n174), .IN6(addressStore[4]), .Q(N226) );
  AO222X2 U93 ( .IN1(para2[3]), .IN2(n199), .IN3(para1[3]), .IN4(n84), .IN5(
        n174), .IN6(addressStore[3]), .Q(N224) );
  AO222X2 U94 ( .IN1(para2[2]), .IN2(n199), .IN3(para1[2]), .IN4(n84), .IN5(
        n174), .IN6(addressStore[2]), .Q(N222) );
  AO222X2 U95 ( .IN1(para2[1]), .IN2(n199), .IN3(para1[1]), .IN4(n84), .IN5(
        n174), .IN6(addressStore[1]), .Q(N220) );
  AO222X2 U96 ( .IN1(para2[0]), .IN2(n199), .IN3(para1[0]), .IN4(n84), .IN5(
        n174), .IN6(addressStore[0]), .Q(N218) );
  NOR2X1 U97 ( .IN1(n199), .IN2(n174), .QN(n84) );
  NOR2X1 U99 ( .IN1(n143), .IN2(n145), .QN(n108) );
  NOR2X1 U100 ( .IN1(n69), .IN2(n144), .QN(n105) );
  NAND2X0 U103 ( .IN1(n107), .IN2(n103), .QN(n65) );
  NAND2X0 U105 ( .IN1(n145), .IN2(n76), .QN(n88) );
  NOR2X1 U107 ( .IN1(n68), .IN2(n146), .QN(n107) );
  AND4X1 U119 ( .IN1(n58), .IN2(n81), .IN3(n85), .IN4(n102), .Q(n176) );
  INVX0 U120 ( .IN(n176), .QN(N855) );
  NBUFFX16 U121 ( .IN(N930), .Q(n177) );
  NBUFFX16 U122 ( .IN(N933), .Q(n178) );
  NBUFFX16 U123 ( .IN(N936), .Q(n179) );
  NBUFFX16 U124 ( .IN(N939), .Q(n180) );
  NBUFFX16 U125 ( .IN(N942), .Q(n181) );
  NBUFFX16 U126 ( .IN(N945), .Q(n182) );
  NBUFFX16 U127 ( .IN(n120), .Q(n183) );
  NBUFFX16 U128 ( .IN(n121), .Q(n184) );
  NBUFFX16 U129 ( .IN(n122), .Q(n185) );
  NBUFFX16 U130 ( .IN(n123), .Q(n186) );
  NBUFFX16 U131 ( .IN(n124), .Q(n187) );
  NBUFFX16 U132 ( .IN(n125), .Q(n188) );
  NBUFFX16 U133 ( .IN(n126), .Q(n189) );
  NBUFFX16 U134 ( .IN(n127), .Q(n190) );
  NBUFFX16 U135 ( .IN(n128), .Q(n191) );
  NBUFFX16 U136 ( .IN(n129), .Q(n192) );
  NBUFFX16 U137 ( .IN(n130), .Q(n193) );
  NBUFFX16 U138 ( .IN(n131), .Q(n194) );
  NBUFFX16 U139 ( .IN(n132), .Q(n195) );
  NBUFFX16 U140 ( .IN(n133), .Q(n196) );
  NBUFFX16 U141 ( .IN(n134), .Q(n197) );
  NBUFFX16 U142 ( .IN(n135), .Q(n198) );
  NAND2X1 U143 ( .IN1(N823), .IN2(n70), .QN(N822) );
  AOBUFX1 U144 ( .IN(N898), .Q(n201) );
  AOBUFX1 U145 ( .IN(n109), .Q(n199) );
  AOBUFX1 U146 ( .IN(N898), .Q(n200) );
  AOINVX1 U147 ( .IN(n83), .QN(n66) );
  AOINVX1 U148 ( .IN(n65), .QN(n109) );
  AOINVX1 U149 ( .IN(n100), .QN(n99) );
  AOINVX1 U150 ( .IN(N855), .QN(n90) );
  AOINVX1 U151 ( .IN(n58), .QN(n175) );
  AOINVX1 U152 ( .IN(n75), .QN(n79) );
  AOINVX1 U153 ( .IN(n56), .QN(n55) );
  AOINVX1 U154 ( .IN(n60), .QN(n52) );
  AOINVX1 U155 ( .IN(N861), .QN(n71) );
  AOINVX1 U156 ( .IN(n88), .QN(n103) );
  AOINVX1 U157 ( .IN(n98), .QN(n173) );
  AND2X1 U158 ( .IN1(n105), .IN2(n108), .Q(n174) );
  AOINVX1 U159 ( .IN(opCode[3]), .QN(n82) );
  AOINVX1 U160 ( .IN(opCode[2]), .QN(n80) );
  AOINVX1 U161 ( .IN(n144), .QN(n68) );
  AOINVX1 U162 ( .IN(n146), .QN(n69) );
  AOINVX1 U163 ( .IN(n145), .QN(n61) );
  AOINVX1 U164 ( .IN(n143), .QN(n76) );
  AOINVX1 U165 ( .IN(reset), .QN(n136) );
  AOINVX1 U166 ( .IN(regStore[0]), .QN(n97) );
  AOINVX1 U167 ( .IN(regStore[1]), .QN(n96) );
  AOINVX1 U168 ( .IN(regStore[2]), .QN(n95) );
  AOINVX1 U169 ( .IN(regStore[3]), .QN(n94) );
  AOINVX1 U170 ( .IN(regStore[4]), .QN(n93) );
  AOINVX1 U171 ( .IN(regStore[5]), .QN(n91) );
endmodule




module MOV_FSM100 ( clk, reset, start, para1, para2, outSig, enSig, incr, 
        fetch );
  input [5:0] para1;
  input [5:0] para2;
  output [5:0] outSig;
  output [5:0] enSig;
  input clk, reset, start;
  output incr, fetch;
  wire   N16, N17, N18, N19, N20, N21, N28, n17, n18, n20, n21, n22, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n1,
         n19, n23;
  wire   [3:0] pres_state;

  DFFASX2 \pres_state_reg[0]  ( .D(n38), .CLK(clk), .SETB(n17), .Q(
        pres_state[0]), .QN(n22) );
  DFFARX2 \pres_state_reg[1]  ( .D(n37), .CLK(clk), .RSTB(n17), .Q(
        pres_state[1]) );
  DFFASX2 \pres_state_reg[2]  ( .D(n36), .CLK(clk), .SETB(n17), .Q(
        pres_state[2]), .QN(n21) );
  LASX2 \enSig_reg[5]  ( .CLK(n18), .SETB(n20), .D(para1[5]), .Q(enSig[5]) );
  LASX2 \enSig_reg[4]  ( .CLK(n18), .SETB(n20), .D(para1[4]), .Q(enSig[4]) );
  LASX2 \enSig_reg[3]  ( .CLK(n18), .SETB(n20), .D(para1[3]), .Q(enSig[3]) );
  LASX2 \enSig_reg[2]  ( .CLK(n18), .SETB(n20), .D(para1[2]), .Q(enSig[2]) );
  LASX2 \enSig_reg[1]  ( .CLK(n18), .SETB(n20), .D(para1[1]), .Q(enSig[1]) );
  LASX2 \enSig_reg[0]  ( .CLK(n18), .SETB(n20), .D(para1[0]), .Q(enSig[0]) );
  LATCHX2 incr_reg ( .CLK(n19), .D(n37), .Q(incr) );
  LATCHX2 fetch_reg ( .CLK(n19), .D(n18), .Q(fetch) );
  LATCHX2 \outSig_reg[5]  ( .CLK(N28), .D(N21), .Q(outSig[5]) );
  LATCHX2 \outSig_reg[4]  ( .CLK(n19), .D(N20), .Q(outSig[4]) );
  LATCHX2 \outSig_reg[3]  ( .CLK(N28), .D(N19), .Q(outSig[3]) );
  LATCHX2 \outSig_reg[2]  ( .CLK(n19), .D(N18), .Q(outSig[2]) );
  LATCHX2 \outSig_reg[1]  ( .CLK(N28), .D(N17), .Q(outSig[1]) );
  LATCHX2 \outSig_reg[0]  ( .CLK(n19), .D(N16), .Q(outSig[0]) );
  ISOLORX2 U3 ( .D(n21), .ISO(start), .Q(n24) );
  AOINVX1 U4 ( .IN(n1), .QN(n19) );
  AOINVX1 U5 ( .IN(n27), .QN(n18) );
  AOINVX1 U6 ( .IN(N28), .QN(n1) );
  NAND2X0 U7 ( .IN1(n27), .IN2(n20), .QN(N28) );
  AOINVX1 U8 ( .IN(n35), .QN(n20) );
  NAND2X0 U9 ( .IN1(n24), .IN2(n25), .QN(n36) );
  NAND2X0 U10 ( .IN1(n21), .IN2(n25), .QN(n38) );
  AND3X1 U11 ( .IN1(n26), .IN2(n21), .IN3(pres_state[0]), .Q(n37) );
  ISOLANDX1 U12 ( .D(n26), .ISO(n22), .Q(n25) );
  AOINVX1 U13 ( .IN(pres_state[1]), .QN(n26) );
  NAND2X0 U14 ( .IN1(n35), .IN2(pres_state[2]), .QN(n28) );
  NAND2X0 U15 ( .IN1(n23), .IN2(pres_state[1]), .QN(n27) );
  NOR2X1 U16 ( .IN1(pres_state[2]), .IN2(pres_state[0]), .QN(n23) );
  AOINVX1 U17 ( .IN(reset), .QN(n17) );
  NOR2X1 U18 ( .IN1(pres_state[1]), .IN2(n22), .QN(n35) );
  NAND2X0 U19 ( .IN1(n28), .IN2(n34), .QN(N16) );
  NAND2X0 U20 ( .IN1(para2[0]), .IN2(n19), .QN(n34) );
  NAND2X0 U21 ( .IN1(n28), .IN2(n33), .QN(N17) );
  NAND2X0 U22 ( .IN1(para2[1]), .IN2(N28), .QN(n33) );
  NAND2X0 U23 ( .IN1(n28), .IN2(n32), .QN(N18) );
  NAND2X0 U24 ( .IN1(para2[2]), .IN2(n19), .QN(n32) );
  NAND2X0 U25 ( .IN1(n28), .IN2(n31), .QN(N19) );
  NAND2X0 U26 ( .IN1(para2[3]), .IN2(N28), .QN(n31) );
  NAND2X0 U27 ( .IN1(n28), .IN2(n30), .QN(N20) );
  NAND2X0 U28 ( .IN1(para2[4]), .IN2(n19), .QN(n30) );
  NAND2X0 U29 ( .IN1(n28), .IN2(n29), .QN(N21) );
  NAND2X0 U30 ( .IN1(para2[5]), .IN2(N28), .QN(n29) );
endmodule


module MOVI_FSM100 ( clk, reset, start, para1, para2, outData, enSig, incr, 
        fetch );
  input [5:0] para1;
  input [5:0] para2;
  output [15:0] outData;
  output [5:0] enSig;
  input clk, reset, start;
  output incr, fetch;
  wire   N73, N75, N77, N79, N81, N83, N86, N87, N89, N92, N95, N98, N101,
         N104, N107, N110, N113, N116, N118, N121, N124, N127, N128, N130,
         N131, N133, N134, n3, n4, n38, n39, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n63, n64, n65, n79, n81, n82, n83, n86, n87, n88, n1,
         n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n26, n27, n28;
  wire   [3:0] pres_state;
  tri   [15:0] outData;

  DFFASX2 \pres_state_reg[0]  ( .D(n83), .CLK(clk), .SETB(n81), .Q(
        pres_state[0]) );
  DFFASX2 \pres_state_reg[2]  ( .D(n87), .CLK(clk), .SETB(n81), .Q(
        pres_state[2]), .QN(n3) );
  DFFARX2 \pres_state_reg[1]  ( .D(n88), .CLK(clk), .RSTB(n81), .Q(n4) );
  LARX2 incr_reg ( .CLK(n86), .D(n3), .RSTB(n79), .Q(incr) );
  LATCHX2 \enSig_reg[5]  ( .CLK(N86), .D(N83), .Q(enSig[5]) );
  LATCHX2 \enSig_reg[4]  ( .CLK(n28), .D(N81), .Q(enSig[4]) );
  LATCHX2 \enSig_reg[3]  ( .CLK(n28), .D(N79), .Q(enSig[3]) );
  LATCHX2 \enSig_reg[2]  ( .CLK(N86), .D(N77), .Q(enSig[2]) );
  LATCHX2 \enSig_reg[1]  ( .CLK(N86), .D(N75), .Q(enSig[1]) );
  LATCHX2 \enSig_reg[0]  ( .CLK(N86), .D(N73), .Q(enSig[0]) );
  LATCHX2 \outData_tri_enable_reg[15]  ( .CLK(N86), .D(n27), .Q(N89), .QN(n50)
         );
  LATCHX2 \outData_tri_enable_reg[14]  ( .CLK(n28), .D(n27), .Q(N92), .QN(n51)
         );
  LATCHX2 \outData_tri_enable_reg[13]  ( .CLK(N86), .D(n27), .Q(N95), .QN(n52)
         );
  LATCHX2 \outData_tri_enable_reg[12]  ( .CLK(N86), .D(n27), .Q(N98), .QN(n53)
         );
  LATCHX2 \outData_tri_enable_reg[11]  ( .CLK(N86), .D(n27), .Q(N101), .QN(n54) );
  LATCHX2 \outData_tri_enable_reg[10]  ( .CLK(N86), .D(n27), .Q(N104), .QN(n55) );
  LATCHX2 \outData_tri_enable_reg[9]  ( .CLK(N86), .D(n27), .Q(N107), .QN(n56)
         );
  LATCHX2 \outData_tri_enable_reg[8]  ( .CLK(n28), .D(n27), .Q(N110), .QN(n57)
         );
  LATCHX2 \outData_tri_enable_reg[7]  ( .CLK(N86), .D(n27), .Q(N113), .QN(n58)
         );
  LATCHX2 \outData_tri_enable_reg[6]  ( .CLK(n28), .D(n27), .Q(N116), .QN(n59)
         );
  LATCHX2 \outData_reg[5]  ( .CLK(n28), .D(para1[5]), .Q(N118) );
  LATCHX2 \outData_tri_enable_reg[5]  ( .CLK(n28), .D(n27), .QN(n1) );
  LATCHX2 \outData_reg[4]  ( .CLK(n28), .D(para1[4]), .Q(N121) );
  LATCHX2 \outData_tri_enable_reg[4]  ( .CLK(n28), .D(n26), .QN(n5) );
  LATCHX2 \outData_reg[3]  ( .CLK(n28), .D(para1[3]), .Q(N124) );
  LATCHX2 \outData_tri_enable_reg[3]  ( .CLK(n28), .D(n26), .QN(n6) );
  LATCHX2 \outData_reg[2]  ( .CLK(n28), .D(para1[2]), .Q(N127) );
  LATCHX2 \outData_tri_enable_reg[2]  ( .CLK(n28), .D(n26), .Q(N128), .QN(n63)
         );
  LATCHX2 \outData_reg[1]  ( .CLK(n28), .D(para1[1]), .Q(N130) );
  LATCHX2 \outData_tri_enable_reg[1]  ( .CLK(n28), .D(n26), .Q(N131), .QN(n64)
         );
  LATCHX2 \outData_reg[0]  ( .CLK(n28), .D(para1[0]), .Q(N133) );
  LATCHX2 \outData_tri_enable_reg[0]  ( .CLK(n28), .D(n26), .Q(N134), .QN(n65)
         );
  LATCHX2 fetch_reg ( .CLK(n28), .D(N87), .Q(fetch) );
  TNBUFFHX8 \outData_tri[0]  ( .IN(n22), .ENB(n65), .Q(outData[0]) );
  TNBUFFHX8 \outData_tri[1]  ( .IN(n20), .ENB(n64), .Q(outData[1]) );
  TNBUFFHX8 \outData_tri[2]  ( .IN(n18), .ENB(n63), .Q(outData[2]) );
  TNBUFFHX8 \outData_tri[3]  ( .IN(n16), .ENB(n7), .Q(outData[3]) );
  TNBUFFHX8 \outData_tri[4]  ( .IN(n14), .ENB(n9), .Q(outData[4]) );
  TNBUFFHX8 \outData_tri[5]  ( .IN(n12), .ENB(n10), .Q(outData[5]) );
  TNBUFFHX8 \outData_tri[6]  ( .IN(1'b0), .ENB(n59), .Q(outData[6]) );
  TNBUFFHX8 \outData_tri[7]  ( .IN(1'b0), .ENB(n58), .Q(outData[7]) );
  TNBUFFHX8 \outData_tri[8]  ( .IN(1'b0), .ENB(n57), .Q(outData[8]) );
  TNBUFFHX8 \outData_tri[9]  ( .IN(1'b0), .ENB(n56), .Q(outData[9]) );
  TNBUFFHX8 \outData_tri[10]  ( .IN(1'b0), .ENB(n55), .Q(outData[10]) );
  TNBUFFHX8 \outData_tri[11]  ( .IN(1'b0), .ENB(n54), .Q(outData[11]) );
  TNBUFFHX8 \outData_tri[12]  ( .IN(1'b0), .ENB(n53), .Q(outData[12]) );
  TNBUFFHX8 \outData_tri[13]  ( .IN(1'b0), .ENB(n52), .Q(outData[13]) );
  TNBUFFHX8 \outData_tri[14]  ( .IN(1'b0), .ENB(n51), .Q(outData[14]) );
  TNBUFFHX8 \outData_tri[15]  ( .IN(1'b0), .ENB(n50), .Q(outData[15]) );
  OAI21X2 U5 ( .IN1(start), .IN2(n38), .IN3(n86), .QN(n87) );
  NAND3X0 U6 ( .IN1(n38), .IN2(n79), .IN3(n83), .QN(N86) );
  ISOLANDX1 U8 ( .D(n86), .ISO(pres_state[2]), .Q(n88) );
  NOR3X0 U10 ( .IN1(pres_state[0]), .IN2(pres_state[2]), .IN3(n39), .QN(N87)
         );
  ISOLORX2 U12 ( .D(n26), .ISO(para2[5]), .Q(N83) );
  ISOLORX2 U13 ( .D(n26), .ISO(para2[4]), .Q(N81) );
  ISOLORX2 U14 ( .D(n26), .ISO(para2[3]), .Q(N79) );
  ISOLORX2 U15 ( .D(n26), .ISO(para2[2]), .Q(N77) );
  ISOLORX2 U16 ( .D(n26), .ISO(para2[1]), .Q(N75) );
  ISOLORX2 U17 ( .D(n26), .ISO(para2[0]), .Q(N73) );
  NAND2X0 U19 ( .IN1(pres_state[2]), .IN2(n86), .QN(n38) );
  ISOLANDX1 U20 ( .D(pres_state[0]), .ISO(n4), .Q(n86) );
  NBUFFX16 U4 ( .IN(n6), .Q(n7) );
  NBUFFX16 U7 ( .IN(n5), .Q(n9) );
  NBUFFX16 U9 ( .IN(n1), .Q(n10) );
  AOINVX1 U11 ( .IN(N118), .QN(n11) );
  INVX8 U18 ( .IN(n11), .QN(n12) );
  AOINVX1 U21 ( .IN(N121), .QN(n13) );
  INVX8 U22 ( .IN(n13), .QN(n14) );
  AOINVX1 U23 ( .IN(N124), .QN(n15) );
  INVX8 U24 ( .IN(n15), .QN(n16) );
  AOINVX1 U25 ( .IN(N127), .QN(n17) );
  INVX8 U26 ( .IN(n17), .QN(n18) );
  AOINVX1 U27 ( .IN(N130), .QN(n19) );
  INVX8 U28 ( .IN(n19), .QN(n20) );
  AOINVX1 U29 ( .IN(N133), .QN(n21) );
  INVX8 U30 ( .IN(n21), .QN(n22) );
  AOBUFX1 U31 ( .IN(N86), .Q(n28) );
  AOBUFX1 U32 ( .IN(n82), .Q(n26) );
  AOBUFX1 U33 ( .IN(n82), .Q(n27) );
  AOINVX1 U34 ( .IN(n88), .QN(n83) );
  AOINVX1 U35 ( .IN(N87), .QN(n79) );
  AOINVX1 U36 ( .IN(n38), .QN(n82) );
  AOINVX1 U37 ( .IN(n4), .QN(n39) );
  AOINVX1 U38 ( .IN(reset), .QN(n81) );
endmodule


module Control_Block100 ( clk, reset, MFC, opCode, para1, para2, pcOut, marIn, 
        MemEN, marOut, RW, readFromMem, outToBus, readFromBus, outToMem, IRin, 
        aluIn1, aluIn2, aluOutRegIn, aluOutRegOut, incr, control, paraOut, 
        regIn, paraExtendedOut );
  input [3:0] opCode;
  input [5:0] para1;
  input [5:0] para2;
  output [3:0] control;
  output [5:0] paraOut;
  output [5:0] regIn;
  output [15:0] paraExtendedOut;
  input clk, reset, MFC;
  output pcOut, marIn, MemEN, marOut, RW, readFromMem, outToBus, readFromBus,
         outToMem, IRin, aluIn1, aluIn2, aluOutRegIn, aluOutRegOut, incr;
  wire   done, marIn1, marIn2, N59, MemEN1, MemEN2, N60, marOut1, marOut2, N61,
         RW1, RW2, N62, readFromMem1, readFromMem2, N63, outToBus1, outToBus2,
         N64, aluIn11, aluIn12, N65, aluIn21, aluIn22, N66, aluOutRegIn1,
         aluOutRegIn2, N67, incr1, incr2, incr3, incr4, incr5, N68, fetch1,
         fetch2, fetch3, fetch4, fetch5, N69, aluOutRegOut1, aluOutRegOut2,
         N70, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [4:0] start;
  wire   [3:0] control1;
  wire   [3:0] control2;
  wire   [5:0] regIn1;
  wire   [5:0] regIn2;
  wire   [5:0] regIn3;
  wire   [5:0] regIn4;
  wire   [5:0] regIn5;
  wire   [5:0] paraOut1;
  wire   [5:0] paraOut2;
  wire   [5:0] paraOut3;
  wire   [5:0] paraOut4;
  tri   [15:0] paraExtendedOut;
  assign marIn = N59;
  assign MemEN = N60;
  assign marOut = N61;
  assign RW = N62;
  assign readFromMem = N63;
  assign outToBus = N64;
  assign aluIn1 = N65;
  assign aluIn2 = N66;
  assign aluOutRegIn = N67;
  assign incr = N68;
  assign aluOutRegOut = N70;

  IF_FSM100 IF ( .clk(clk), .reset(reset), .MFC(MFC), .fetch(N69), .pcOut(
        pcOut), .marIn(marIn1), .MemEN(MemEN1), .marOut(marOut1), .RW(RW1), 
        .readFromMem(readFromMem1), .outToBus(outToBus1), .IRin(IRin), .done(
        done) );
  ADD_FSM100 ADD ( .clk(clk), .reset(reset), .start(start[4]), .opCode(opCode), 
        .para1(para1), .para2(para2), .paraOut(paraOut1), .aluIn1(aluIn11), 
        .aluIn2(aluIn21), .control(control1), .aluOutRegIn(aluOutRegIn1), 
        .aluOutRegOut(aluOutRegOut1), .regIn(regIn1), .incr(incr1), .fetch(
        fetch1) );
  ADDI_FSM100 ADDI ( .clk(clk), .reset(reset), .start(start[3]), .opCode(
        opCode), .para1(para1), .para2(para2), .paraOut(paraOut2), 
        .paraExtendedOut(paraExtendedOut), .aluIn1(aluIn12), .aluIn2(aluIn22), 
        .control(control2), .aluOutRegIn(aluOutRegIn2), .aluOutRegOut(
        aluOutRegOut2), .regIn(regIn2), .incr(incr2), .fetch(fetch2) );
  LOAD_FSM100 LOAD ( .clk(clk), .reset(reset), .start(start[2]), .opCode(
        opCode), .para1(para1), .para2(para2), .MFC(MFC), .address(
        paraExtendedOut), .marIn(marIn2), .MemEN(MemEN2), .marOut(marOut2), 
        .RW(RW2), .readFromMem(readFromMem2), .outToBus(outToBus2), 
        .readFromBus(readFromBus), .outToMem(outToMem), .regIn(regIn3), 
        .regOut(paraOut3), .incr(incr3), .fetch(fetch3) );
  MOV_FSM100 MOV ( .clk(clk), .reset(reset), .start(start[1]), .para1(para1), 
        .para2(para2), .outSig(paraOut4), .enSig(regIn4), .incr(incr4), 
        .fetch(fetch4) );
  MOVI_FSM100 MOVI ( .clk(clk), .reset(reset), .start(start[0]), .para1(para1), 
        .para2(para2), .outData(paraExtendedOut), .enSig(regIn5), .incr(incr5), 
        .fetch(fetch5) );
  XOR2X2 U52 ( .IN1(n11), .IN2(n10), .Q(n12) );
  XNOR2X2 U53 ( .IN1(n5), .IN2(n13), .Q(n10) );
  AO22X2 U54 ( .IN1(opCode[0]), .IN2(opCode[1]), .IN3(opCode[2]), .IN4(n13), 
        .Q(n11) );
  XNOR2X2 U55 ( .IN1(n7), .IN2(opCode[1]), .Q(n13) );
  NOR4X0 U56 ( .IN1(n14), .IN2(n2), .IN3(n7), .IN4(n5), .QN(start[3]) );
  XNOR2X2 U57 ( .IN1(opCode[3]), .IN2(opCode[1]), .Q(n14) );
  OA21X1 U58 ( .IN1(n15), .IN2(n16), .IN3(n3), .Q(start[2]) );
  NOR4X0 U59 ( .IN1(opCode[2]), .IN2(opCode[0]), .IN3(n6), .IN4(n17), .QN(
        start[1]) );
  NOR4X0 U60 ( .IN1(opCode[2]), .IN2(opCode[1]), .IN3(n7), .IN4(n17), .QN(
        start[0]) );
  AOINVX1 U61 ( .IN(n17), .QN(n3) );
  NAND2X0 U62 ( .IN1(opCode[3]), .IN2(done), .QN(n17) );
  NAND2X0 U63 ( .IN1(n8), .IN2(n9), .QN(start[4]) );
  NAND3X0 U64 ( .IN1(n10), .IN2(n11), .IN3(n3), .QN(n9) );
  NAND3X0 U65 ( .IN1(done), .IN2(n4), .IN3(n12), .QN(n8) );
  AND3X1 U66 ( .IN1(opCode[0]), .IN2(n5), .IN3(opCode[1]), .Q(n16) );
  AND3X1 U67 ( .IN1(opCode[2]), .IN2(n6), .IN3(n7), .Q(n15) );
  AOINVX1 U68 ( .IN(opCode[0]), .QN(n7) );
  AOINVX1 U69 ( .IN(opCode[2]), .QN(n5) );
  AOINVX1 U70 ( .IN(opCode[1]), .QN(n6) );
  AOINVX1 U71 ( .IN(done), .QN(n2) );
  NAND2X0 U72 ( .IN1(n24), .IN2(n25), .QN(N69) );
  NOR3X0 U73 ( .IN1(fetch3), .IN2(fetch5), .IN3(fetch4), .QN(n25) );
  AOINVX1 U74 ( .IN(opCode[3]), .QN(n4) );
  NAND2X0 U75 ( .IN1(n26), .IN2(n27), .QN(N68) );
  NOR3X0 U76 ( .IN1(incr3), .IN2(incr5), .IN3(incr4), .QN(n27) );
  NOR2X1 U77 ( .IN1(incr2), .IN2(incr1), .QN(n26) );
  NOR2X1 U78 ( .IN1(fetch2), .IN2(fetch1), .QN(n24) );
  AND4X1 U79 ( .IN1(paraOut4[0]), .IN2(paraOut3[0]), .IN3(paraOut2[0]), .IN4(
        paraOut1[0]), .Q(paraOut[0]) );
  AND4X1 U80 ( .IN1(paraOut4[1]), .IN2(paraOut3[1]), .IN3(paraOut2[1]), .IN4(
        paraOut1[1]), .Q(paraOut[1]) );
  AND4X1 U81 ( .IN1(paraOut4[2]), .IN2(paraOut3[2]), .IN3(paraOut2[2]), .IN4(
        paraOut1[2]), .Q(paraOut[2]) );
  AND4X1 U82 ( .IN1(paraOut4[3]), .IN2(paraOut3[3]), .IN3(paraOut2[3]), .IN4(
        paraOut1[3]), .Q(paraOut[3]) );
  AND4X1 U83 ( .IN1(paraOut4[4]), .IN2(paraOut3[4]), .IN3(paraOut2[4]), .IN4(
        paraOut1[4]), .Q(paraOut[4]) );
  AND4X1 U84 ( .IN1(paraOut4[5]), .IN2(paraOut3[5]), .IN3(paraOut2[5]), .IN4(
        paraOut1[5]), .Q(paraOut[5]) );
  AND3X1 U85 ( .IN1(regIn5[0]), .IN2(regIn4[0]), .IN3(n23), .Q(regIn[0]) );
  AND3X1 U86 ( .IN1(regIn2[0]), .IN2(regIn1[0]), .IN3(regIn3[0]), .Q(n23) );
  AND3X1 U87 ( .IN1(regIn5[1]), .IN2(regIn4[1]), .IN3(n22), .Q(regIn[1]) );
  AND3X1 U88 ( .IN1(regIn2[1]), .IN2(regIn1[1]), .IN3(regIn3[1]), .Q(n22) );
  AND3X1 U89 ( .IN1(regIn5[2]), .IN2(regIn4[2]), .IN3(n21), .Q(regIn[2]) );
  AND3X1 U90 ( .IN1(regIn2[2]), .IN2(regIn1[2]), .IN3(regIn3[2]), .Q(n21) );
  AND3X1 U91 ( .IN1(regIn5[3]), .IN2(regIn4[3]), .IN3(n20), .Q(regIn[3]) );
  AND3X1 U92 ( .IN1(regIn2[3]), .IN2(regIn1[3]), .IN3(regIn3[3]), .Q(n20) );
  AND3X1 U93 ( .IN1(regIn5[4]), .IN2(regIn4[4]), .IN3(n19), .Q(regIn[4]) );
  AND3X1 U94 ( .IN1(regIn2[4]), .IN2(regIn1[4]), .IN3(regIn3[4]), .Q(n19) );
  AND3X1 U95 ( .IN1(regIn5[5]), .IN2(regIn4[5]), .IN3(n18), .Q(regIn[5]) );
  AND3X1 U96 ( .IN1(regIn2[5]), .IN2(regIn1[5]), .IN3(regIn3[5]), .Q(n18) );
  ISOLORX2 U97 ( .D(control1[0]), .ISO(control2[0]), .Q(control[0]) );
  ISOLORX2 U98 ( .D(control1[1]), .ISO(control2[1]), .Q(control[1]) );
  ISOLORX2 U99 ( .D(control1[2]), .ISO(control2[2]), .Q(control[2]) );
  ISOLORX2 U100 ( .D(control1[3]), .ISO(control2[3]), .Q(control[3]) );
  ISOLORX2 U101 ( .D(aluOutRegOut1), .ISO(aluOutRegOut2), .Q(N70) );
  ISOLORX2 U102 ( .D(aluOutRegIn1), .ISO(aluOutRegIn2), .Q(N67) );
  ISOLORX2 U103 ( .D(aluIn21), .ISO(aluIn22), .Q(N66) );
  ISOLORX2 U104 ( .D(aluIn11), .ISO(aluIn12), .Q(N65) );
  ISOLORX2 U105 ( .D(outToBus1), .ISO(outToBus2), .Q(N64) );
  ISOLORX2 U106 ( .D(readFromMem1), .ISO(readFromMem2), .Q(N63) );
  ISOLORX2 U107 ( .D(RW1), .ISO(RW2), .Q(N62) );
  ISOLORX2 U108 ( .D(marOut1), .ISO(marOut2), .Q(N61) );
  ISOLORX2 U109 ( .D(MemEN1), .ISO(MemEN2), .Q(N60) );
  ISOLORX2 U110 ( .D(marIn1), .ISO(marIn2), .Q(N59) );
endmodule


module ID100 ( clk, en, instr, reset, state, parameter1, parameter2 );
  input [15:0] instr;
  output [3:0] state;
  output [5:0] parameter1;
  output [5:0] parameter2;
  input clk, en, reset;
  wire   n16, n17, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49;

  DFFARX2 \state_reg[3]  ( .D(n49), .CLK(clk), .RSTB(n17), .Q(state[3]) );
  DFFARX2 \state_reg[2]  ( .D(n48), .CLK(clk), .RSTB(n17), .Q(state[2]) );
  DFFARX2 \state_reg[1]  ( .D(n47), .CLK(clk), .RSTB(n17), .Q(state[1]) );
  DFFARX2 \state_reg[0]  ( .D(n46), .CLK(clk), .RSTB(n17), .Q(state[0]) );
  DFFARX2 \parameter2_reg[5]  ( .D(n45), .CLK(clk), .RSTB(n17), .Q(
        parameter2[5]) );
  DFFARX2 \parameter2_reg[4]  ( .D(n44), .CLK(clk), .RSTB(n17), .Q(
        parameter2[4]) );
  DFFARX2 \parameter2_reg[3]  ( .D(n43), .CLK(clk), .RSTB(n17), .Q(
        parameter2[3]) );
  DFFARX2 \parameter2_reg[2]  ( .D(n42), .CLK(clk), .RSTB(n17), .Q(
        parameter2[2]) );
  DFFARX2 \parameter2_reg[1]  ( .D(n41), .CLK(clk), .RSTB(n17), .Q(
        parameter2[1]) );
  DFFARX2 \parameter2_reg[0]  ( .D(n40), .CLK(clk), .RSTB(n17), .Q(
        parameter2[0]) );
  DFFARX2 \parameter1_reg[5]  ( .D(n39), .CLK(clk), .RSTB(n17), .Q(
        parameter1[5]) );
  DFFARX2 \parameter1_reg[4]  ( .D(n38), .CLK(clk), .RSTB(n17), .Q(
        parameter1[4]) );
  DFFARX2 \parameter1_reg[3]  ( .D(n37), .CLK(clk), .RSTB(n17), .Q(
        parameter1[3]) );
  DFFARX2 \parameter1_reg[2]  ( .D(n36), .CLK(clk), .RSTB(n17), .Q(
        parameter1[2]) );
  DFFARX2 \parameter1_reg[1]  ( .D(n35), .CLK(clk), .RSTB(n17), .Q(
        parameter1[1]) );
  DFFARX2 \parameter1_reg[0]  ( .D(n34), .CLK(clk), .RSTB(n17), .Q(
        parameter1[0]) );
  AO22X2 U2 ( .IN1(instr[15]), .IN2(en), .IN3(n16), .IN4(state[3]), .Q(n49) );
  AO22X2 U3 ( .IN1(instr[14]), .IN2(en), .IN3(n16), .IN4(state[2]), .Q(n48) );
  AO22X2 U4 ( .IN1(instr[13]), .IN2(en), .IN3(n16), .IN4(state[1]), .Q(n47) );
  AO22X2 U5 ( .IN1(instr[12]), .IN2(en), .IN3(n16), .IN4(state[0]), .Q(n46) );
  AO22X2 U6 ( .IN1(instr[5]), .IN2(en), .IN3(n16), .IN4(parameter2[5]), .Q(n45) );
  AO22X2 U7 ( .IN1(instr[4]), .IN2(en), .IN3(n16), .IN4(parameter2[4]), .Q(n44) );
  AO22X2 U8 ( .IN1(instr[3]), .IN2(en), .IN3(n16), .IN4(parameter2[3]), .Q(n43) );
  AO22X2 U9 ( .IN1(instr[2]), .IN2(en), .IN3(n16), .IN4(parameter2[2]), .Q(n42) );
  AO22X2 U10 ( .IN1(instr[1]), .IN2(en), .IN3(n16), .IN4(parameter2[1]), .Q(
        n41) );
  AO22X2 U11 ( .IN1(instr[0]), .IN2(en), .IN3(n16), .IN4(parameter2[0]), .Q(
        n40) );
  AO22X2 U12 ( .IN1(instr[11]), .IN2(en), .IN3(n16), .IN4(parameter1[5]), .Q(
        n39) );
  AO22X2 U13 ( .IN1(instr[10]), .IN2(en), .IN3(n16), .IN4(parameter1[4]), .Q(
        n38) );
  AO22X2 U14 ( .IN1(instr[9]), .IN2(en), .IN3(n16), .IN4(parameter1[3]), .Q(
        n37) );
  AO22X2 U15 ( .IN1(instr[8]), .IN2(en), .IN3(n16), .IN4(parameter1[2]), .Q(
        n36) );
  AO22X2 U16 ( .IN1(instr[7]), .IN2(en), .IN3(n16), .IN4(parameter1[1]), .Q(
        n35) );
  AO22X2 U17 ( .IN1(instr[6]), .IN2(en), .IN3(n16), .IN4(parameter1[0]), .Q(
        n34) );
  AOINVX2 U20 ( .IN(en), .QN(n16) );
  AOINVX2 U21 ( .IN(reset), .QN(n17) );
endmodule


module MAR100 ( clk, addr, en, en1, outAddr );
  input [15:0] addr;
  output [15:0] outAddr;
  input clk, en, en1;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85;
  wire   [15:0] store;

  DFFX2 \store_reg[15]  ( .D(n83), .CLK(clk), .Q(store[15]), .QN(n42) );
  DFFX2 \outAddr_reg[15]  ( .D(n82), .CLK(clk), .Q(outAddr[15]) );
  DFFX2 \store_reg[14]  ( .D(n81), .CLK(clk), .Q(store[14]), .QN(n41) );
  DFFX2 \outAddr_reg[14]  ( .D(n80), .CLK(clk), .Q(outAddr[14]) );
  DFFX2 \store_reg[13]  ( .D(n79), .CLK(clk), .Q(store[13]), .QN(n40) );
  DFFX2 \outAddr_reg[13]  ( .D(n78), .CLK(clk), .Q(outAddr[13]) );
  DFFX2 \store_reg[12]  ( .D(n77), .CLK(clk), .Q(store[12]), .QN(n39) );
  DFFX2 \outAddr_reg[12]  ( .D(n76), .CLK(clk), .Q(outAddr[12]) );
  DFFX2 \store_reg[11]  ( .D(n75), .CLK(clk), .Q(store[11]), .QN(n38) );
  DFFX2 \outAddr_reg[11]  ( .D(n74), .CLK(clk), .Q(outAddr[11]) );
  DFFX2 \store_reg[10]  ( .D(n73), .CLK(clk), .Q(store[10]), .QN(n37) );
  DFFX2 \outAddr_reg[10]  ( .D(n72), .CLK(clk), .Q(outAddr[10]) );
  DFFX2 \store_reg[9]  ( .D(n71), .CLK(clk), .Q(store[9]), .QN(n51) );
  DFFX2 \outAddr_reg[9]  ( .D(n70), .CLK(clk), .Q(outAddr[9]) );
  DFFX2 \store_reg[8]  ( .D(n69), .CLK(clk), .Q(store[8]), .QN(n50) );
  DFFX2 \outAddr_reg[8]  ( .D(n68), .CLK(clk), .Q(outAddr[8]) );
  DFFX2 \store_reg[7]  ( .D(n67), .CLK(clk), .Q(store[7]), .QN(n49) );
  DFFX2 \outAddr_reg[7]  ( .D(n66), .CLK(clk), .Q(outAddr[7]) );
  DFFX2 \store_reg[6]  ( .D(n65), .CLK(clk), .Q(store[6]), .QN(n48) );
  DFFX2 \outAddr_reg[6]  ( .D(n64), .CLK(clk), .Q(outAddr[6]) );
  DFFX2 \store_reg[5]  ( .D(n63), .CLK(clk), .Q(store[5]), .QN(n47) );
  DFFX2 \outAddr_reg[5]  ( .D(n62), .CLK(clk), .Q(outAddr[5]) );
  DFFX2 \store_reg[4]  ( .D(n61), .CLK(clk), .Q(store[4]), .QN(n46) );
  DFFX2 \outAddr_reg[4]  ( .D(n60), .CLK(clk), .Q(outAddr[4]) );
  DFFX2 \store_reg[3]  ( .D(n59), .CLK(clk), .Q(store[3]), .QN(n45) );
  DFFX2 \outAddr_reg[3]  ( .D(n58), .CLK(clk), .Q(outAddr[3]) );
  DFFX2 \store_reg[2]  ( .D(n57), .CLK(clk), .Q(store[2]), .QN(n44) );
  DFFX2 \outAddr_reg[2]  ( .D(n56), .CLK(clk), .Q(outAddr[2]) );
  DFFX2 \store_reg[1]  ( .D(n55), .CLK(clk), .Q(store[1]), .QN(n43) );
  DFFX2 \outAddr_reg[1]  ( .D(n54), .CLK(clk), .Q(outAddr[1]) );
  DFFX2 \store_reg[0]  ( .D(n53), .CLK(clk), .Q(store[0]), .QN(n36) );
  DFFX2 \outAddr_reg[0]  ( .D(n52), .CLK(clk), .Q(outAddr[0]) );
  AO22X2 U2 ( .IN1(n1), .IN2(n2), .IN3(en), .IN4(addr[9]), .Q(n71) );
  AO22X2 U3 ( .IN1(n1), .IN2(n3), .IN3(addr[8]), .IN4(en), .Q(n69) );
  AO22X2 U4 ( .IN1(n1), .IN2(n4), .IN3(addr[7]), .IN4(en), .Q(n67) );
  AO22X2 U5 ( .IN1(n1), .IN2(n5), .IN3(addr[6]), .IN4(en), .Q(n65) );
  AO22X2 U6 ( .IN1(n1), .IN2(n6), .IN3(addr[5]), .IN4(en), .Q(n63) );
  AO22X2 U7 ( .IN1(n1), .IN2(n7), .IN3(addr[4]), .IN4(en), .Q(n61) );
  AO22X2 U8 ( .IN1(n1), .IN2(n8), .IN3(addr[3]), .IN4(en), .Q(n59) );
  AO22X2 U9 ( .IN1(n1), .IN2(n9), .IN3(addr[2]), .IN4(en), .Q(n57) );
  AO22X2 U10 ( .IN1(n1), .IN2(n10), .IN3(addr[1]), .IN4(en), .Q(n55) );
  AO22X2 U11 ( .IN1(n1), .IN2(n11), .IN3(addr[15]), .IN4(en), .Q(n83) );
  AO22X2 U12 ( .IN1(n1), .IN2(n12), .IN3(addr[14]), .IN4(en), .Q(n81) );
  AO22X2 U13 ( .IN1(n1), .IN2(n13), .IN3(addr[13]), .IN4(en), .Q(n79) );
  AO22X2 U14 ( .IN1(n1), .IN2(n14), .IN3(addr[12]), .IN4(en), .Q(n77) );
  AO22X2 U15 ( .IN1(n1), .IN2(n15), .IN3(addr[11]), .IN4(en), .Q(n75) );
  AO22X2 U16 ( .IN1(n1), .IN2(n16), .IN3(addr[10]), .IN4(en), .Q(n73) );
  AO22X2 U17 ( .IN1(n1), .IN2(n17), .IN3(addr[0]), .IN4(en), .Q(n53) );
  AO22X2 U18 ( .IN1(n84), .IN2(outAddr[9]), .IN3(n85), .IN4(n2), .Q(n70) );
  AO22X2 U20 ( .IN1(n84), .IN2(outAddr[8]), .IN3(n85), .IN4(n3), .Q(n68) );
  AO22X2 U22 ( .IN1(n84), .IN2(outAddr[7]), .IN3(n85), .IN4(n4), .Q(n66) );
  AO22X2 U24 ( .IN1(n84), .IN2(outAddr[6]), .IN3(n85), .IN4(n5), .Q(n64) );
  AO22X2 U26 ( .IN1(n84), .IN2(outAddr[5]), .IN3(n85), .IN4(n6), .Q(n62) );
  AO22X2 U28 ( .IN1(n84), .IN2(outAddr[4]), .IN3(n85), .IN4(n7), .Q(n60) );
  AO22X2 U30 ( .IN1(n84), .IN2(outAddr[3]), .IN3(n85), .IN4(n8), .Q(n58) );
  AO22X2 U32 ( .IN1(n84), .IN2(outAddr[2]), .IN3(n85), .IN4(n9), .Q(n56) );
  AO22X2 U34 ( .IN1(n84), .IN2(outAddr[1]), .IN3(n85), .IN4(n10), .Q(n54) );
  AO22X2 U36 ( .IN1(n84), .IN2(outAddr[15]), .IN3(n85), .IN4(n11), .Q(n82) );
  AO22X2 U38 ( .IN1(n84), .IN2(outAddr[14]), .IN3(n85), .IN4(n12), .Q(n80) );
  AO22X2 U40 ( .IN1(n84), .IN2(outAddr[13]), .IN3(n85), .IN4(n13), .Q(n78) );
  AO22X2 U42 ( .IN1(n84), .IN2(outAddr[12]), .IN3(n85), .IN4(n14), .Q(n76) );
  AO22X2 U44 ( .IN1(n84), .IN2(outAddr[11]), .IN3(n85), .IN4(n15), .Q(n74) );
  AO22X2 U46 ( .IN1(n84), .IN2(outAddr[10]), .IN3(n85), .IN4(n16), .Q(n72) );
  AO22X2 U48 ( .IN1(n84), .IN2(outAddr[0]), .IN3(n85), .IN4(n17), .Q(n52) );
  AOINVX2 U53 ( .IN(n18), .QN(n85) );
  AOINVX2 U54 ( .IN(en), .QN(n1) );
  AOBUFX1 U55 ( .IN(n18), .Q(n84) );
  NAND2X0 U56 ( .IN1(en1), .IN2(n1), .QN(n18) );
  AOINVX1 U57 ( .IN(n36), .QN(n17) );
  AOINVX1 U58 ( .IN(n43), .QN(n10) );
  AOINVX1 U59 ( .IN(n44), .QN(n9) );
  AOINVX1 U60 ( .IN(n45), .QN(n8) );
  AOINVX1 U61 ( .IN(n46), .QN(n7) );
  AOINVX1 U62 ( .IN(n47), .QN(n6) );
  AOINVX1 U63 ( .IN(n48), .QN(n5) );
  AOINVX1 U64 ( .IN(n49), .QN(n4) );
  AOINVX1 U65 ( .IN(n50), .QN(n3) );
  AOINVX1 U66 ( .IN(n51), .QN(n2) );
  AOINVX1 U67 ( .IN(n37), .QN(n16) );
  AOINVX1 U68 ( .IN(n38), .QN(n15) );
  AOINVX1 U69 ( .IN(n39), .QN(n14) );
  AOINVX1 U70 ( .IN(n40), .QN(n13) );
  AOINVX1 U71 ( .IN(n41), .QN(n12) );
  AOINVX1 U72 ( .IN(n42), .QN(n11) );
endmodule


module MDR100 ( clk, reset, memRead, busRead, readFromBus, outToMem, 
        readFromMem, outToBus, outMem, outBus );
  input [15:0] memRead;
  input [15:0] busRead;
  output [15:0] outMem;
  output [15:0] outBus;
  input clk, reset, readFromBus, outToMem, readFromMem, outToBus;
  wire   N48, N49, N51, N52, N54, N55, N57, N58, N60, N61, N63, N64, N66, N67,
         N69, N70, N72, N73, N75, N76, N78, N79, N81, N82, N84, N85, N87, N88,
         N90, N91, N93, N94, N96, N97, N99, N100, N102, N103, N105, N106, N108,
         N109, N111, N112, N114, N115, N117, N118, N120, N121, N123, N124,
         N126, N127, N129, N130, N132, N133, N135, N136, N138, N139, N141,
         N142, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416;
  wire   [15:0] store1;
  wire   [15:0] store2;
  tri   [15:0] outMem;
  tri   [15:0] outBus;

  DFFX2 \outBus_tri_enable_reg[15]  ( .D(n334), .CLK(clk), .Q(N49), .QN(n112)
         );
  DFFX2 \outBus_tri_enable_reg[14]  ( .D(n333), .CLK(clk), .Q(N52), .QN(n114)
         );
  DFFX2 \outBus_tri_enable_reg[13]  ( .D(n332), .CLK(clk), .Q(N55), .QN(n116)
         );
  DFFX2 \outBus_tri_enable_reg[12]  ( .D(n331), .CLK(clk), .Q(N58), .QN(n118)
         );
  DFFX2 \outBus_tri_enable_reg[11]  ( .D(n330), .CLK(clk), .Q(N61), .QN(n120)
         );
  DFFX2 \outBus_tri_enable_reg[10]  ( .D(n329), .CLK(clk), .Q(N64), .QN(n122)
         );
  DFFX2 \outBus_tri_enable_reg[9]  ( .D(n328), .CLK(clk), .Q(N67), .QN(n124)
         );
  DFFX2 \outBus_tri_enable_reg[8]  ( .D(n327), .CLK(clk), .Q(N70), .QN(n126)
         );
  DFFX2 \outBus_tri_enable_reg[7]  ( .D(n326), .CLK(clk), .Q(N73), .QN(n128)
         );
  DFFX2 \outBus_tri_enable_reg[6]  ( .D(n325), .CLK(clk), .Q(N76), .QN(n130)
         );
  DFFX2 \outBus_tri_enable_reg[5]  ( .D(n324), .CLK(clk), .Q(N79), .QN(n132)
         );
  DFFX2 \outBus_tri_enable_reg[4]  ( .D(n323), .CLK(clk), .Q(N82), .QN(n134)
         );
  DFFX2 \outBus_tri_enable_reg[3]  ( .D(n322), .CLK(clk), .Q(N85), .QN(n136)
         );
  DFFX2 \outBus_tri_enable_reg[2]  ( .D(n321), .CLK(clk), .Q(N88), .QN(n138)
         );
  DFFX2 \outBus_tri_enable_reg[1]  ( .D(n320), .CLK(clk), .Q(N91), .QN(n140)
         );
  DFFX2 \outBus_tri_enable_reg[0]  ( .D(n319), .CLK(clk), .Q(N94), .QN(n142)
         );
  DFFX2 \store1_reg[15]  ( .D(n318), .CLK(clk), .Q(store1[15]), .QN(n213) );
  DFFX2 \store1_reg[14]  ( .D(n317), .CLK(clk), .Q(store1[14]), .QN(n212) );
  DFFX2 \store1_reg[13]  ( .D(n316), .CLK(clk), .Q(store1[13]), .QN(n211) );
  DFFX2 \store1_reg[12]  ( .D(n315), .CLK(clk), .Q(store1[12]), .QN(n210) );
  DFFX2 \store1_reg[11]  ( .D(n314), .CLK(clk), .Q(store1[11]), .QN(n209) );
  DFFX2 \store1_reg[10]  ( .D(n313), .CLK(clk), .Q(store1[10]), .QN(n208) );
  DFFX2 \store1_reg[9]  ( .D(n312), .CLK(clk), .Q(store1[9]), .QN(n222) );
  DFFX2 \store1_reg[8]  ( .D(n311), .CLK(clk), .Q(store1[8]), .QN(n221) );
  DFFX2 \store1_reg[7]  ( .D(n310), .CLK(clk), .Q(store1[7]), .QN(n220) );
  DFFX2 \store1_reg[6]  ( .D(n309), .CLK(clk), .Q(store1[6]), .QN(n219) );
  DFFX2 \store1_reg[5]  ( .D(n308), .CLK(clk), .Q(store1[5]), .QN(n218) );
  DFFX2 \store1_reg[4]  ( .D(n307), .CLK(clk), .Q(store1[4]), .QN(n217) );
  DFFX2 \store1_reg[3]  ( .D(n306), .CLK(clk), .Q(store1[3]), .QN(n216) );
  DFFX2 \store1_reg[2]  ( .D(n305), .CLK(clk), .Q(store1[2]), .QN(n215) );
  DFFX2 \store1_reg[1]  ( .D(n304), .CLK(clk), .Q(store1[1]), .QN(n214) );
  DFFX2 \store1_reg[0]  ( .D(n303), .CLK(clk), .Q(store1[0]), .QN(n207) );
  DFFX2 \outMem_reg[15]  ( .D(n302), .CLK(clk), .Q(N96), .QN(n197) );
  DFFX2 \outMem_tri_enable_reg[15]  ( .D(n301), .CLK(clk), .Q(N97), .QN(n144)
         );
  DFFX2 \outMem_reg[14]  ( .D(n300), .CLK(clk), .Q(N99), .QN(n196) );
  DFFX2 \outMem_tri_enable_reg[14]  ( .D(n299), .CLK(clk), .Q(N100), .QN(n146)
         );
  DFFX2 \outMem_reg[13]  ( .D(n298), .CLK(clk), .Q(N102), .QN(n195) );
  DFFX2 \outMem_tri_enable_reg[13]  ( .D(n297), .CLK(clk), .Q(N103), .QN(n148)
         );
  DFFX2 \outMem_reg[12]  ( .D(n296), .CLK(clk), .Q(N105), .QN(n194) );
  DFFX2 \outMem_tri_enable_reg[12]  ( .D(n295), .CLK(clk), .Q(N106), .QN(n150)
         );
  DFFX2 \outMem_reg[11]  ( .D(n294), .CLK(clk), .Q(N108), .QN(n193) );
  DFFX2 \outMem_tri_enable_reg[11]  ( .D(n293), .CLK(clk), .Q(N109), .QN(n152)
         );
  DFFX2 \outMem_reg[10]  ( .D(n292), .CLK(clk), .Q(N111), .QN(n192) );
  DFFX2 \outMem_tri_enable_reg[10]  ( .D(n291), .CLK(clk), .Q(N112), .QN(n154)
         );
  DFFX2 \outMem_reg[9]  ( .D(n290), .CLK(clk), .Q(N114), .QN(n206) );
  DFFX2 \outMem_tri_enable_reg[9]  ( .D(n289), .CLK(clk), .Q(N115), .QN(n156)
         );
  DFFX2 \outMem_reg[8]  ( .D(n288), .CLK(clk), .Q(N117), .QN(n205) );
  DFFX2 \outMem_tri_enable_reg[8]  ( .D(n287), .CLK(clk), .Q(N118), .QN(n158)
         );
  DFFX2 \outMem_reg[7]  ( .D(n286), .CLK(clk), .Q(N120), .QN(n204) );
  DFFX2 \outMem_tri_enable_reg[7]  ( .D(n285), .CLK(clk), .Q(N121), .QN(n160)
         );
  DFFX2 \outMem_reg[6]  ( .D(n284), .CLK(clk), .Q(N123), .QN(n203) );
  DFFX2 \outMem_tri_enable_reg[6]  ( .D(n283), .CLK(clk), .Q(N124), .QN(n162)
         );
  DFFX2 \outMem_reg[5]  ( .D(n282), .CLK(clk), .Q(N126), .QN(n202) );
  DFFX2 \outMem_tri_enable_reg[5]  ( .D(n281), .CLK(clk), .Q(N127), .QN(n164)
         );
  DFFX2 \outMem_reg[4]  ( .D(n280), .CLK(clk), .Q(N129), .QN(n201) );
  DFFX2 \outMem_tri_enable_reg[4]  ( .D(n279), .CLK(clk), .Q(N130), .QN(n166)
         );
  DFFX2 \outMem_reg[3]  ( .D(n278), .CLK(clk), .Q(N132), .QN(n200) );
  DFFX2 \outMem_tri_enable_reg[3]  ( .D(n277), .CLK(clk), .Q(N133), .QN(n168)
         );
  DFFX2 \outMem_reg[2]  ( .D(n276), .CLK(clk), .Q(N135), .QN(n199) );
  DFFX2 \outMem_tri_enable_reg[2]  ( .D(n275), .CLK(clk), .Q(N136), .QN(n170)
         );
  DFFX2 \outMem_reg[1]  ( .D(n274), .CLK(clk), .Q(N138), .QN(n198) );
  DFFX2 \outMem_tri_enable_reg[1]  ( .D(n273), .CLK(clk), .Q(N139), .QN(n172)
         );
  DFFX2 \outMem_reg[0]  ( .D(n272), .CLK(clk), .Q(N141), .QN(n191) );
  DFFX2 \outMem_tri_enable_reg[0]  ( .D(n271), .CLK(clk), .Q(N142), .QN(n174)
         );
  DFFX2 \store2_reg[15]  ( .D(n270), .CLK(clk), .Q(store2[15]), .QN(n229) );
  DFFX2 \outBus_reg[15]  ( .D(n269), .CLK(clk), .Q(N48), .QN(n181) );
  DFFX2 \store2_reg[14]  ( .D(n268), .CLK(clk), .Q(store2[14]), .QN(n228) );
  DFFX2 \outBus_reg[14]  ( .D(n267), .CLK(clk), .Q(N51), .QN(n180) );
  DFFX2 \store2_reg[13]  ( .D(n266), .CLK(clk), .Q(store2[13]), .QN(n227) );
  DFFX2 \outBus_reg[13]  ( .D(n265), .CLK(clk), .Q(N54), .QN(n179) );
  DFFX2 \store2_reg[12]  ( .D(n264), .CLK(clk), .Q(store2[12]), .QN(n226) );
  DFFX2 \outBus_reg[12]  ( .D(n263), .CLK(clk), .Q(N57), .QN(n178) );
  DFFX2 \store2_reg[11]  ( .D(n262), .CLK(clk), .Q(store2[11]), .QN(n225) );
  DFFX2 \outBus_reg[11]  ( .D(n261), .CLK(clk), .Q(N60), .QN(n177) );
  DFFX2 \store2_reg[10]  ( .D(n260), .CLK(clk), .Q(store2[10]), .QN(n224) );
  DFFX2 \outBus_reg[10]  ( .D(n259), .CLK(clk), .Q(N63), .QN(n176) );
  DFFX2 \store2_reg[9]  ( .D(n258), .CLK(clk), .Q(store2[9]), .QN(n238) );
  DFFX2 \outBus_reg[9]  ( .D(n257), .CLK(clk), .Q(N66), .QN(n190) );
  DFFX2 \store2_reg[8]  ( .D(n256), .CLK(clk), .Q(store2[8]), .QN(n237) );
  DFFX2 \outBus_reg[8]  ( .D(n255), .CLK(clk), .Q(N69), .QN(n189) );
  DFFX2 \store2_reg[7]  ( .D(n254), .CLK(clk), .Q(store2[7]), .QN(n236) );
  DFFX2 \outBus_reg[7]  ( .D(n253), .CLK(clk), .Q(N72), .QN(n188) );
  DFFX2 \store2_reg[6]  ( .D(n252), .CLK(clk), .Q(store2[6]), .QN(n235) );
  DFFX2 \outBus_reg[6]  ( .D(n251), .CLK(clk), .Q(N75), .QN(n187) );
  DFFX2 \store2_reg[5]  ( .D(n250), .CLK(clk), .Q(store2[5]), .QN(n234) );
  DFFX2 \outBus_reg[5]  ( .D(n249), .CLK(clk), .Q(N78), .QN(n186) );
  DFFX2 \store2_reg[4]  ( .D(n248), .CLK(clk), .Q(store2[4]), .QN(n233) );
  DFFX2 \outBus_reg[4]  ( .D(n247), .CLK(clk), .Q(N81), .QN(n185) );
  DFFX2 \store2_reg[3]  ( .D(n246), .CLK(clk), .Q(store2[3]), .QN(n232) );
  DFFX2 \outBus_reg[3]  ( .D(n245), .CLK(clk), .Q(N84), .QN(n184) );
  DFFX2 \store2_reg[2]  ( .D(n244), .CLK(clk), .Q(store2[2]), .QN(n231) );
  DFFX2 \outBus_reg[2]  ( .D(n243), .CLK(clk), .Q(N87), .QN(n183) );
  DFFX2 \store2_reg[1]  ( .D(n242), .CLK(clk), .Q(store2[1]), .QN(n230) );
  DFFX2 \outBus_reg[1]  ( .D(n241), .CLK(clk), .Q(N90), .QN(n182) );
  DFFX2 \store2_reg[0]  ( .D(n240), .CLK(clk), .Q(store2[0]), .QN(n223) );
  DFFX2 \outBus_reg[0]  ( .D(n239), .CLK(clk), .Q(N93), .QN(n175) );
  TNBUFFHX8 \outMem_tri[0]  ( .IN(n397), .ENB(n345), .Q(outMem[0]) );
  TNBUFFHX8 \outMem_tri[1]  ( .IN(n396), .ENB(n344), .Q(outMem[1]) );
  TNBUFFHX8 \outMem_tri[2]  ( .IN(n400), .ENB(n353), .Q(outMem[2]) );
  TNBUFFHX8 \outMem_tri[3]  ( .IN(n399), .ENB(n352), .Q(outMem[3]) );
  TNBUFFHX8 \outMem_tri[4]  ( .IN(n372), .ENB(n351), .Q(outMem[4]) );
  TNBUFFHX8 \outMem_tri[5]  ( .IN(n374), .ENB(n350), .Q(outMem[5]) );
  TNBUFFHX8 \outMem_tri[6]  ( .IN(n394), .ENB(n349), .Q(outMem[6]) );
  TNBUFFHX8 \outMem_tri[7]  ( .IN(n390), .ENB(n348), .Q(outMem[7]) );
  TNBUFFHX8 \outMem_tri[8]  ( .IN(n373), .ENB(n347), .Q(outMem[8]) );
  TNBUFFHX8 \outMem_tri[9]  ( .IN(n398), .ENB(n346), .Q(outMem[9]) );
  TNBUFFHX8 \outMem_tri[10]  ( .IN(n393), .ENB(n343), .Q(outMem[10]) );
  TNBUFFHX8 \outMem_tri[11]  ( .IN(n376), .ENB(n342), .Q(outMem[11]) );
  TNBUFFHX8 \outMem_tri[12]  ( .IN(n379), .ENB(n341), .Q(outMem[12]) );
  TNBUFFHX8 \outMem_tri[13]  ( .IN(n370), .ENB(n340), .Q(outMem[13]) );
  TNBUFFHX8 \outMem_tri[14]  ( .IN(n371), .ENB(n339), .Q(outMem[14]) );
  TNBUFFHX8 \outMem_tri[15]  ( .IN(n401), .ENB(n338), .Q(outMem[15]) );
  TNBUFFHX8 \outBus_tri[0]  ( .IN(n378), .ENB(n369), .Q(outBus[0]) );
  TNBUFFHX8 \outBus_tri[1]  ( .IN(n392), .ENB(n368), .Q(outBus[1]) );
  TNBUFFHX8 \outBus_tri[2]  ( .IN(n386), .ENB(n367), .Q(outBus[2]) );
  TNBUFFHX8 \outBus_tri[3]  ( .IN(n377), .ENB(n366), .Q(outBus[3]) );
  TNBUFFHX8 \outBus_tri[4]  ( .IN(n385), .ENB(n365), .Q(outBus[4]) );
  TNBUFFHX8 \outBus_tri[5]  ( .IN(n382), .ENB(n364), .Q(outBus[5]) );
  TNBUFFHX8 \outBus_tri[6]  ( .IN(n381), .ENB(n363), .Q(outBus[6]) );
  TNBUFFHX8 \outBus_tri[7]  ( .IN(n387), .ENB(n362), .Q(outBus[7]) );
  TNBUFFHX8 \outBus_tri[8]  ( .IN(n375), .ENB(n361), .Q(outBus[8]) );
  TNBUFFHX8 \outBus_tri[9]  ( .IN(n383), .ENB(n360), .Q(outBus[9]) );
  TNBUFFHX8 \outBus_tri[10]  ( .IN(n391), .ENB(n359), .Q(outBus[10]) );
  TNBUFFHX8 \outBus_tri[11]  ( .IN(n388), .ENB(n358), .Q(outBus[11]) );
  TNBUFFHX8 \outBus_tri[12]  ( .IN(n395), .ENB(n357), .Q(outBus[12]) );
  TNBUFFHX8 \outBus_tri[13]  ( .IN(n380), .ENB(n356), .Q(outBus[13]) );
  TNBUFFHX8 \outBus_tri[14]  ( .IN(n384), .ENB(n355), .Q(outBus[14]) );
  TNBUFFHX8 \outBus_tri[15]  ( .IN(n389), .ENB(n354), .Q(outBus[15]) );
  AO22X2 U2 ( .IN1(memRead[9]), .IN2(n405), .IN3(n402), .IN4(n35), .Q(n258) );
  AO22X2 U3 ( .IN1(memRead[8]), .IN2(n405), .IN3(n402), .IN4(n36), .Q(n256) );
  AO22X2 U4 ( .IN1(memRead[7]), .IN2(n405), .IN3(n402), .IN4(n37), .Q(n254) );
  AO22X2 U5 ( .IN1(memRead[6]), .IN2(n405), .IN3(n402), .IN4(n38), .Q(n252) );
  AO22X2 U6 ( .IN1(memRead[5]), .IN2(n405), .IN3(n402), .IN4(n39), .Q(n250) );
  AO22X2 U7 ( .IN1(memRead[4]), .IN2(n405), .IN3(n402), .IN4(n40), .Q(n248) );
  AO22X2 U8 ( .IN1(memRead[3]), .IN2(n405), .IN3(n402), .IN4(n41), .Q(n246) );
  AO22X2 U9 ( .IN1(memRead[2]), .IN2(n405), .IN3(n402), .IN4(n42), .Q(n244) );
  AO22X2 U10 ( .IN1(memRead[1]), .IN2(n405), .IN3(n402), .IN4(n43), .Q(n242)
         );
  AO22X2 U11 ( .IN1(memRead[15]), .IN2(n405), .IN3(n402), .IN4(n44), .Q(n270)
         );
  AO22X2 U12 ( .IN1(memRead[14]), .IN2(n405), .IN3(n402), .IN4(n45), .Q(n268)
         );
  AO22X2 U13 ( .IN1(memRead[13]), .IN2(n405), .IN3(n402), .IN4(n46), .Q(n266)
         );
  AO22X2 U14 ( .IN1(memRead[12]), .IN2(n405), .IN3(n402), .IN4(n47), .Q(n264)
         );
  AO22X2 U15 ( .IN1(memRead[11]), .IN2(n405), .IN3(n402), .IN4(n48), .Q(n262)
         );
  AO22X2 U16 ( .IN1(memRead[10]), .IN2(n405), .IN3(n402), .IN4(n49), .Q(n260)
         );
  AO22X2 U17 ( .IN1(memRead[0]), .IN2(n405), .IN3(n402), .IN4(n50), .Q(n240)
         );
  AO22X2 U19 ( .IN1(n51), .IN2(n52), .IN3(readFromBus), .IN4(busRead[9]), .Q(
        n312) );
  AO22X2 U20 ( .IN1(n51), .IN2(n53), .IN3(busRead[8]), .IN4(readFromBus), .Q(
        n311) );
  AO22X2 U21 ( .IN1(n51), .IN2(n54), .IN3(busRead[7]), .IN4(readFromBus), .Q(
        n310) );
  AO22X2 U22 ( .IN1(n51), .IN2(n55), .IN3(busRead[6]), .IN4(readFromBus), .Q(
        n309) );
  AO22X2 U23 ( .IN1(n51), .IN2(n56), .IN3(busRead[5]), .IN4(readFromBus), .Q(
        n308) );
  AO22X2 U24 ( .IN1(n51), .IN2(n57), .IN3(busRead[4]), .IN4(readFromBus), .Q(
        n307) );
  AO22X2 U25 ( .IN1(n51), .IN2(n58), .IN3(busRead[3]), .IN4(readFromBus), .Q(
        n306) );
  AO22X2 U26 ( .IN1(n51), .IN2(n59), .IN3(busRead[2]), .IN4(readFromBus), .Q(
        n305) );
  AO22X2 U27 ( .IN1(n51), .IN2(n60), .IN3(busRead[1]), .IN4(readFromBus), .Q(
        n304) );
  AO22X2 U28 ( .IN1(n51), .IN2(n61), .IN3(busRead[15]), .IN4(readFromBus), .Q(
        n318) );
  AO22X2 U29 ( .IN1(n51), .IN2(n62), .IN3(busRead[14]), .IN4(readFromBus), .Q(
        n317) );
  AO22X2 U30 ( .IN1(n51), .IN2(n63), .IN3(busRead[13]), .IN4(readFromBus), .Q(
        n316) );
  AO22X2 U31 ( .IN1(n51), .IN2(n64), .IN3(busRead[12]), .IN4(readFromBus), .Q(
        n315) );
  AO22X2 U32 ( .IN1(n51), .IN2(n65), .IN3(busRead[11]), .IN4(readFromBus), .Q(
        n314) );
  AO22X2 U33 ( .IN1(n51), .IN2(n66), .IN3(busRead[10]), .IN4(readFromBus), .Q(
        n313) );
  AO22X2 U34 ( .IN1(n51), .IN2(n67), .IN3(busRead[0]), .IN4(readFromBus), .Q(
        n303) );
  NAND2X0 U35 ( .IN1(n68), .IN2(n69), .QN(n289) );
  NAND2X0 U37 ( .IN1(n404), .IN2(n71), .QN(n287) );
  NAND2X0 U39 ( .IN1(n68), .IN2(n72), .QN(n285) );
  NAND2X0 U41 ( .IN1(n404), .IN2(n73), .QN(n283) );
  NAND2X0 U43 ( .IN1(n68), .IN2(n74), .QN(n281) );
  NAND2X0 U45 ( .IN1(n404), .IN2(n75), .QN(n279) );
  NAND2X0 U47 ( .IN1(n68), .IN2(n76), .QN(n277) );
  NAND2X0 U49 ( .IN1(n404), .IN2(n77), .QN(n275) );
  NAND2X0 U51 ( .IN1(n68), .IN2(n78), .QN(n273) );
  NAND2X0 U53 ( .IN1(n404), .IN2(n79), .QN(n301) );
  NAND2X0 U55 ( .IN1(n68), .IN2(n80), .QN(n299) );
  NAND2X0 U57 ( .IN1(n404), .IN2(n81), .QN(n297) );
  NAND2X0 U59 ( .IN1(n68), .IN2(n82), .QN(n295) );
  NAND2X0 U61 ( .IN1(n404), .IN2(n83), .QN(n293) );
  NAND2X0 U63 ( .IN1(n68), .IN2(n84), .QN(n291) );
  NAND2X0 U65 ( .IN1(n404), .IN2(n85), .QN(n271) );
  ISOLANDX1 U67 ( .D(n86), .ISO(readFromBus), .Q(n68) );
  NAND2X0 U68 ( .IN1(n87), .IN2(n88), .QN(n86) );
  AO22X2 U69 ( .IN1(n413), .IN2(n52), .IN3(n416), .IN4(n398), .Q(n290) );
  AO22X2 U72 ( .IN1(n413), .IN2(n53), .IN3(n337), .IN4(n373), .Q(n288) );
  AO22X2 U75 ( .IN1(n413), .IN2(n54), .IN3(n337), .IN4(n390), .Q(n286) );
  AO22X2 U78 ( .IN1(n413), .IN2(n55), .IN3(n337), .IN4(n394), .Q(n284) );
  AO22X2 U81 ( .IN1(n413), .IN2(n56), .IN3(n337), .IN4(n374), .Q(n282) );
  AO22X2 U84 ( .IN1(n413), .IN2(n57), .IN3(n415), .IN4(n372), .Q(n280) );
  AO22X2 U87 ( .IN1(n413), .IN2(n58), .IN3(n416), .IN4(n399), .Q(n278) );
  AO22X2 U90 ( .IN1(n413), .IN2(n59), .IN3(n416), .IN4(n400), .Q(n276) );
  AO22X2 U93 ( .IN1(n414), .IN2(n60), .IN3(n416), .IN4(n396), .Q(n274) );
  AO22X2 U96 ( .IN1(n414), .IN2(n61), .IN3(n416), .IN4(n401), .Q(n302) );
  AO22X2 U99 ( .IN1(n414), .IN2(n62), .IN3(n415), .IN4(n371), .Q(n300) );
  AO22X2 U102 ( .IN1(n414), .IN2(n63), .IN3(n415), .IN4(n370), .Q(n298) );
  AO22X2 U105 ( .IN1(n414), .IN2(n64), .IN3(n415), .IN4(n379), .Q(n296) );
  AO22X2 U108 ( .IN1(n414), .IN2(n65), .IN3(n415), .IN4(n376), .Q(n294) );
  AO22X2 U111 ( .IN1(n414), .IN2(n66), .IN3(n415), .IN4(n393), .Q(n292) );
  AO22X2 U114 ( .IN1(n414), .IN2(n67), .IN3(n415), .IN4(n397), .Q(n272) );
  NAND2X0 U119 ( .IN1(n92), .IN2(n93), .QN(n328) );
  NAND2X0 U121 ( .IN1(n92), .IN2(n94), .QN(n327) );
  NAND2X0 U123 ( .IN1(n92), .IN2(n95), .QN(n326) );
  NAND2X0 U125 ( .IN1(n92), .IN2(n96), .QN(n325) );
  NAND2X0 U127 ( .IN1(n92), .IN2(n97), .QN(n324) );
  NAND2X0 U129 ( .IN1(n92), .IN2(n98), .QN(n323) );
  NAND2X0 U131 ( .IN1(n92), .IN2(n99), .QN(n322) );
  NAND2X0 U133 ( .IN1(n92), .IN2(n100), .QN(n321) );
  NAND2X0 U135 ( .IN1(n92), .IN2(n101), .QN(n320) );
  NAND2X0 U137 ( .IN1(n92), .IN2(n102), .QN(n334) );
  NAND2X0 U139 ( .IN1(n92), .IN2(n103), .QN(n333) );
  NAND2X0 U141 ( .IN1(n92), .IN2(n104), .QN(n332) );
  NAND2X0 U143 ( .IN1(n92), .IN2(n105), .QN(n331) );
  NAND2X0 U145 ( .IN1(n92), .IN2(n106), .QN(n330) );
  NAND2X0 U147 ( .IN1(n92), .IN2(n107), .QN(n329) );
  NAND2X0 U149 ( .IN1(n92), .IN2(n108), .QN(n319) );
  NAND2X0 U152 ( .IN1(n402), .IN2(n91), .QN(n109) );
  NOR2X1 U154 ( .IN1(readFromMem), .IN2(outToBus), .QN(n87) );
  AO22X2 U156 ( .IN1(n409), .IN2(n35), .IN3(n110), .IN4(n383), .Q(n257) );
  AO22X2 U159 ( .IN1(n409), .IN2(n36), .IN3(n110), .IN4(n375), .Q(n255) );
  AO22X2 U162 ( .IN1(n409), .IN2(n37), .IN3(n110), .IN4(n387), .Q(n253) );
  AO22X2 U165 ( .IN1(n409), .IN2(n38), .IN3(n110), .IN4(n381), .Q(n251) );
  AO22X2 U168 ( .IN1(n409), .IN2(n39), .IN3(n110), .IN4(n382), .Q(n249) );
  AO22X2 U171 ( .IN1(n409), .IN2(n40), .IN3(n110), .IN4(n385), .Q(n247) );
  AO22X2 U174 ( .IN1(n410), .IN2(n41), .IN3(n110), .IN4(n377), .Q(n245) );
  AO22X2 U177 ( .IN1(n409), .IN2(n42), .IN3(n110), .IN4(n386), .Q(n243) );
  AO22X2 U180 ( .IN1(n410), .IN2(n43), .IN3(n110), .IN4(n392), .Q(n241) );
  AO22X2 U183 ( .IN1(n410), .IN2(n44), .IN3(n110), .IN4(n389), .Q(n269) );
  AO22X2 U186 ( .IN1(n410), .IN2(n45), .IN3(n110), .IN4(n384), .Q(n267) );
  AO22X2 U189 ( .IN1(n410), .IN2(n46), .IN3(n110), .IN4(n380), .Q(n265) );
  AO22X2 U192 ( .IN1(n410), .IN2(n47), .IN3(n110), .IN4(n395), .Q(n263) );
  AO22X2 U195 ( .IN1(n410), .IN2(n48), .IN3(n110), .IN4(n388), .Q(n261) );
  AO22X2 U198 ( .IN1(n410), .IN2(n49), .IN3(n110), .IN4(n391), .Q(n259) );
  AO22X2 U201 ( .IN1(n409), .IN2(n50), .IN3(n110), .IN4(n378), .Q(n239) );
  AND2X1 U208 ( .IN1(n88), .IN2(n51), .Q(n335) );
  INVX0 U209 ( .IN(n335), .QN(n110) );
  AND2X1 U210 ( .IN1(n406), .IN2(n109), .Q(n336) );
  INVX0 U211 ( .IN(n336), .QN(n92) );
  AND2X1 U212 ( .IN1(n407), .IN2(n91), .Q(n337) );
  ISOLORX2 U213 ( .D(n408), .ISO(n354), .Q(n102) );
  ISOLORX2 U214 ( .D(n412), .ISO(n345), .Q(n85) );
  ISOLORX2 U215 ( .D(n412), .ISO(n344), .Q(n78) );
  ISOLORX2 U216 ( .D(n411), .ISO(n353), .Q(n77) );
  ISOLORX2 U217 ( .D(n411), .ISO(n352), .Q(n76) );
  ISOLORX2 U218 ( .D(n411), .ISO(n351), .Q(n75) );
  ISOLORX2 U219 ( .D(n411), .ISO(n350), .Q(n74) );
  ISOLORX2 U220 ( .D(n411), .ISO(n349), .Q(n73) );
  ISOLORX2 U221 ( .D(n411), .ISO(n348), .Q(n72) );
  ISOLORX2 U222 ( .D(n411), .ISO(n347), .Q(n71) );
  ISOLORX2 U223 ( .D(n411), .ISO(n346), .Q(n69) );
  ISOLORX2 U224 ( .D(n412), .ISO(n343), .Q(n84) );
  ISOLORX2 U225 ( .D(n412), .ISO(n342), .Q(n83) );
  ISOLORX2 U226 ( .D(n412), .ISO(n341), .Q(n82) );
  ISOLORX2 U227 ( .D(n412), .ISO(n340), .Q(n81) );
  ISOLORX2 U228 ( .D(n412), .ISO(n339), .Q(n80) );
  ISOLORX2 U229 ( .D(n412), .ISO(n338), .Q(n79) );
  NBUFFX16 U230 ( .IN(n144), .Q(n338) );
  NBUFFX16 U231 ( .IN(n146), .Q(n339) );
  NBUFFX16 U232 ( .IN(n148), .Q(n340) );
  NBUFFX16 U233 ( .IN(n150), .Q(n341) );
  NBUFFX16 U234 ( .IN(n152), .Q(n342) );
  NBUFFX16 U235 ( .IN(n154), .Q(n343) );
  NBUFFX16 U236 ( .IN(n172), .Q(n344) );
  NBUFFX16 U237 ( .IN(n174), .Q(n345) );
  NBUFFX16 U238 ( .IN(n156), .Q(n346) );
  NBUFFX16 U239 ( .IN(n158), .Q(n347) );
  NBUFFX16 U240 ( .IN(n160), .Q(n348) );
  NBUFFX16 U241 ( .IN(n162), .Q(n349) );
  NBUFFX16 U242 ( .IN(n164), .Q(n350) );
  NBUFFX16 U243 ( .IN(n166), .Q(n351) );
  NBUFFX16 U244 ( .IN(n168), .Q(n352) );
  NBUFFX16 U245 ( .IN(n170), .Q(n353) );
  NBUFFX16 U246 ( .IN(n112), .Q(n354) );
  NBUFFX16 U247 ( .IN(n114), .Q(n355) );
  OR2X2 U248 ( .IN1(n408), .IN2(n355), .Q(n103) );
  NBUFFX16 U249 ( .IN(n116), .Q(n356) );
  OR2X2 U250 ( .IN1(n406), .IN2(n356), .Q(n104) );
  NBUFFX16 U251 ( .IN(n118), .Q(n357) );
  OR2X2 U252 ( .IN1(n408), .IN2(n357), .Q(n105) );
  NBUFFX16 U253 ( .IN(n120), .Q(n358) );
  OR2X2 U254 ( .IN1(n406), .IN2(n358), .Q(n106) );
  NBUFFX16 U255 ( .IN(n122), .Q(n359) );
  OR2X2 U256 ( .IN1(n408), .IN2(n359), .Q(n107) );
  NBUFFX16 U257 ( .IN(n124), .Q(n360) );
  OR2X2 U258 ( .IN1(n408), .IN2(n360), .Q(n93) );
  NBUFFX16 U259 ( .IN(n126), .Q(n361) );
  OR2X2 U260 ( .IN1(n408), .IN2(n361), .Q(n94) );
  NBUFFX16 U261 ( .IN(n128), .Q(n362) );
  OR2X2 U262 ( .IN1(n408), .IN2(n362), .Q(n95) );
  NBUFFX16 U263 ( .IN(n130), .Q(n363) );
  OR2X2 U264 ( .IN1(n408), .IN2(n363), .Q(n96) );
  NBUFFX16 U265 ( .IN(n132), .Q(n364) );
  OR2X2 U266 ( .IN1(n408), .IN2(n364), .Q(n97) );
  NBUFFX16 U267 ( .IN(n134), .Q(n365) );
  OR2X2 U268 ( .IN1(n408), .IN2(n365), .Q(n98) );
  NBUFFX16 U269 ( .IN(n136), .Q(n366) );
  OR2X2 U270 ( .IN1(n408), .IN2(n366), .Q(n99) );
  NBUFFX16 U271 ( .IN(n138), .Q(n367) );
  OR2X2 U272 ( .IN1(n408), .IN2(n367), .Q(n100) );
  NBUFFX16 U273 ( .IN(n140), .Q(n368) );
  OR2X2 U274 ( .IN1(n406), .IN2(n368), .Q(n101) );
  NBUFFX16 U275 ( .IN(n142), .Q(n369) );
  OR2X2 U276 ( .IN1(n408), .IN2(n369), .Q(n108) );
  NBUFFX16 U277 ( .IN(n147), .Q(n370) );
  AOINVX1 U278 ( .IN(n195), .QN(n147) );
  NBUFFX16 U279 ( .IN(n145), .Q(n371) );
  AOINVX1 U280 ( .IN(n196), .QN(n145) );
  NBUFFX16 U281 ( .IN(n165), .Q(n372) );
  AOINVX1 U282 ( .IN(n201), .QN(n165) );
  NBUFFX16 U283 ( .IN(n157), .Q(n373) );
  AOINVX1 U284 ( .IN(n205), .QN(n157) );
  NBUFFX16 U285 ( .IN(n163), .Q(n374) );
  AOINVX1 U286 ( .IN(n202), .QN(n163) );
  NBUFFX16 U287 ( .IN(n125), .Q(n375) );
  AOINVX1 U288 ( .IN(n189), .QN(n125) );
  NBUFFX16 U289 ( .IN(n151), .Q(n376) );
  AOINVX1 U290 ( .IN(n193), .QN(n151) );
  NBUFFX16 U291 ( .IN(n135), .Q(n377) );
  AOINVX1 U292 ( .IN(n184), .QN(n135) );
  NBUFFX16 U293 ( .IN(n141), .Q(n378) );
  AOINVX1 U294 ( .IN(n175), .QN(n141) );
  NBUFFX16 U295 ( .IN(n149), .Q(n379) );
  AOINVX1 U296 ( .IN(n194), .QN(n149) );
  NBUFFX16 U297 ( .IN(n115), .Q(n380) );
  AOINVX1 U298 ( .IN(n179), .QN(n115) );
  NBUFFX16 U299 ( .IN(n129), .Q(n381) );
  AOINVX1 U300 ( .IN(n187), .QN(n129) );
  NBUFFX16 U301 ( .IN(n131), .Q(n382) );
  AOINVX1 U302 ( .IN(n186), .QN(n131) );
  NBUFFX16 U303 ( .IN(n123), .Q(n383) );
  AOINVX1 U304 ( .IN(n190), .QN(n123) );
  NBUFFX16 U305 ( .IN(n113), .Q(n384) );
  AOINVX1 U306 ( .IN(n180), .QN(n113) );
  NBUFFX16 U307 ( .IN(n133), .Q(n385) );
  AOINVX1 U308 ( .IN(n185), .QN(n133) );
  NBUFFX16 U309 ( .IN(n137), .Q(n386) );
  AOINVX1 U310 ( .IN(n183), .QN(n137) );
  NBUFFX16 U311 ( .IN(n127), .Q(n387) );
  AOINVX1 U312 ( .IN(n188), .QN(n127) );
  NBUFFX16 U313 ( .IN(n119), .Q(n388) );
  AOINVX1 U314 ( .IN(n177), .QN(n119) );
  NBUFFX16 U315 ( .IN(n111), .Q(n389) );
  AOINVX1 U316 ( .IN(n181), .QN(n111) );
  NBUFFX16 U317 ( .IN(n159), .Q(n390) );
  AOINVX1 U318 ( .IN(n204), .QN(n159) );
  NBUFFX16 U319 ( .IN(n121), .Q(n391) );
  AOINVX1 U320 ( .IN(n176), .QN(n121) );
  NBUFFX16 U321 ( .IN(n139), .Q(n392) );
  AOINVX1 U322 ( .IN(n182), .QN(n139) );
  NBUFFX16 U323 ( .IN(n153), .Q(n393) );
  AOINVX1 U324 ( .IN(n192), .QN(n153) );
  NBUFFX16 U325 ( .IN(n161), .Q(n394) );
  AOINVX1 U326 ( .IN(n203), .QN(n161) );
  NBUFFX16 U327 ( .IN(n117), .Q(n395) );
  AOINVX1 U328 ( .IN(n178), .QN(n117) );
  NBUFFX16 U329 ( .IN(n171), .Q(n396) );
  AOINVX1 U330 ( .IN(n198), .QN(n171) );
  NBUFFX16 U331 ( .IN(n173), .Q(n397) );
  AOINVX1 U332 ( .IN(n191), .QN(n173) );
  NBUFFX16 U333 ( .IN(n155), .Q(n398) );
  AOINVX1 U334 ( .IN(n206), .QN(n155) );
  NBUFFX16 U335 ( .IN(n167), .Q(n399) );
  AOINVX1 U336 ( .IN(n200), .QN(n167) );
  NBUFFX16 U337 ( .IN(n169), .Q(n400) );
  AOINVX1 U338 ( .IN(n199), .QN(n169) );
  NBUFFX16 U339 ( .IN(n143), .Q(n401) );
  AOINVX1 U340 ( .IN(n197), .QN(n143) );
  AOBUFX1 U341 ( .IN(n34), .Q(n402) );
  AOBUFX1 U342 ( .IN(n406), .Q(n409) );
  AOBUFX1 U343 ( .IN(n406), .Q(n410) );
  AOINVX1 U344 ( .IN(n416), .QN(n412) );
  AOINVX1 U345 ( .IN(n415), .QN(n411) );
  AOINVX1 U346 ( .IN(n416), .QN(n413) );
  AOINVX1 U347 ( .IN(n416), .QN(n414) );
  AOBUFX1 U348 ( .IN(n337), .Q(n415) );
  AOBUFX1 U349 ( .IN(n407), .Q(n406) );
  AOBUFX1 U350 ( .IN(n90), .Q(n407) );
  AOBUFX1 U351 ( .IN(n337), .Q(n416) );
  AOBUFX1 U352 ( .IN(n90), .Q(n408) );
  AOINVX1 U353 ( .IN(n110), .QN(n90) );
  AOINVX1 U354 ( .IN(n87), .QN(n91) );
  AOINVX2 U355 ( .IN(n34), .QN(n405) );
  AOINVX1 U356 ( .IN(n403), .QN(n404) );
  AOINVX1 U357 ( .IN(outToMem), .QN(n88) );
  AOINVX2 U358 ( .IN(readFromBus), .QN(n51) );
  NAND2X0 U359 ( .IN1(readFromMem), .IN2(n90), .QN(n34) );
  AOINVX1 U360 ( .IN(n68), .QN(n403) );
  AOINVX1 U361 ( .IN(n207), .QN(n67) );
  AOINVX1 U362 ( .IN(n214), .QN(n60) );
  AOINVX1 U363 ( .IN(n215), .QN(n59) );
  AOINVX1 U364 ( .IN(n216), .QN(n58) );
  AOINVX1 U365 ( .IN(n217), .QN(n57) );
  AOINVX1 U366 ( .IN(n218), .QN(n56) );
  AOINVX1 U367 ( .IN(n219), .QN(n55) );
  AOINVX1 U368 ( .IN(n220), .QN(n54) );
  AOINVX1 U369 ( .IN(n221), .QN(n53) );
  AOINVX1 U370 ( .IN(n222), .QN(n52) );
  AOINVX1 U371 ( .IN(n208), .QN(n66) );
  AOINVX1 U372 ( .IN(n209), .QN(n65) );
  AOINVX1 U373 ( .IN(n210), .QN(n64) );
  AOINVX1 U374 ( .IN(n211), .QN(n63) );
  AOINVX1 U375 ( .IN(n212), .QN(n62) );
  AOINVX1 U376 ( .IN(n213), .QN(n61) );
  AOINVX1 U377 ( .IN(n223), .QN(n50) );
  AOINVX1 U378 ( .IN(n230), .QN(n43) );
  AOINVX1 U379 ( .IN(n231), .QN(n42) );
  AOINVX1 U380 ( .IN(n232), .QN(n41) );
  AOINVX1 U381 ( .IN(n233), .QN(n40) );
  AOINVX1 U382 ( .IN(n234), .QN(n39) );
  AOINVX1 U383 ( .IN(n235), .QN(n38) );
  AOINVX1 U384 ( .IN(n236), .QN(n37) );
  AOINVX1 U385 ( .IN(n237), .QN(n36) );
  AOINVX1 U386 ( .IN(n238), .QN(n35) );
  AOINVX1 U387 ( .IN(n224), .QN(n49) );
  AOINVX1 U388 ( .IN(n225), .QN(n48) );
  AOINVX1 U389 ( .IN(n226), .QN(n47) );
  AOINVX1 U390 ( .IN(n227), .QN(n46) );
  AOINVX1 U391 ( .IN(n228), .QN(n45) );
  AOINVX1 U392 ( .IN(n229), .QN(n44) );
endmodule


module PC_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HADDX2 U1_1_14 ( .A0(A[14]), .B0(carry[14]), .C1(carry[15]), .SO(SUM[14]) );
  HADDX2 U1_1_13 ( .A0(A[13]), .B0(carry[13]), .C1(carry[14]), .SO(SUM[13]) );
  HADDX2 U1_1_12 ( .A0(A[12]), .B0(carry[12]), .C1(carry[13]), .SO(SUM[12]) );
  HADDX2 U1_1_11 ( .A0(A[11]), .B0(carry[11]), .C1(carry[12]), .SO(SUM[11]) );
  HADDX2 U1_1_10 ( .A0(A[10]), .B0(carry[10]), .C1(carry[11]), .SO(SUM[10]) );
  HADDX2 U1_1_9 ( .A0(A[9]), .B0(carry[9]), .C1(carry[10]), .SO(SUM[9]) );
  HADDX2 U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX2 U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX2 U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX2 U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX2 U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX2 U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX2 U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX2 U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  AOINVX1 U1 ( .IN(A[0]), .QN(SUM[0]) );
  XOR2X2 U2 ( .IN1(carry[15]), .IN2(A[15]), .Q(SUM[15]) );
endmodule


module PC100 ( clk, reset, incr, en, out );
  output [15:0] out;
  input clk, reset, incr, en;
  wire   N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33,
         N34, N35, N37, N40, N43, N46, N49, N52, N55, N58, N61, N64, N67, N70,
         N73, N76, N79, N82, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139;
  wire   [15:0] store;
  tri   [15:0] out;

  DFFX2 \out_reg[15]  ( .D(store[15]), .CLK(clk), .Q(N37) );
  DFFASX2 \out_tri_enable_reg[15]  ( .D(n133), .CLK(clk), .SETB(n137), .QN(n34) );
  DFFX2 \out_reg[14]  ( .D(store[14]), .CLK(clk), .Q(N40) );
  DFFASX2 \out_tri_enable_reg[14]  ( .D(n132), .CLK(clk), .SETB(n137), .QN(n35) );
  DFFX2 \out_reg[13]  ( .D(store[13]), .CLK(clk), .Q(N43) );
  DFFASX2 \out_tri_enable_reg[13]  ( .D(n133), .CLK(clk), .SETB(n137), .QN(n36) );
  DFFX2 \out_reg[12]  ( .D(store[12]), .CLK(clk), .Q(N46) );
  DFFASX2 \out_tri_enable_reg[12]  ( .D(n132), .CLK(clk), .SETB(n137), .QN(n37) );
  DFFX2 \out_reg[11]  ( .D(store[11]), .CLK(clk), .Q(N49) );
  DFFASX2 \out_tri_enable_reg[11]  ( .D(n133), .CLK(clk), .SETB(n136), .QN(n38) );
  DFFX2 \out_reg[10]  ( .D(store[10]), .CLK(clk), .Q(N52) );
  DFFASX2 \out_tri_enable_reg[10]  ( .D(n132), .CLK(clk), .SETB(n136), .QN(n39) );
  DFFX2 \out_reg[9]  ( .D(store[9]), .CLK(clk), .Q(N55) );
  DFFASX2 \out_tri_enable_reg[9]  ( .D(n133), .CLK(clk), .SETB(n136), .QN(n40)
         );
  DFFX2 \out_reg[8]  ( .D(store[8]), .CLK(clk), .Q(N58) );
  DFFASX2 \out_tri_enable_reg[8]  ( .D(n132), .CLK(clk), .SETB(n136), .QN(n41)
         );
  DFFX2 \out_reg[7]  ( .D(store[7]), .CLK(clk), .Q(N61) );
  DFFASX2 \out_tri_enable_reg[7]  ( .D(n133), .CLK(clk), .SETB(n136), .QN(n42)
         );
  DFFX2 \out_reg[6]  ( .D(store[6]), .CLK(clk), .Q(N64) );
  DFFASX2 \out_tri_enable_reg[6]  ( .D(n132), .CLK(clk), .SETB(n136), .QN(n43)
         );
  DFFX2 \out_reg[5]  ( .D(store[5]), .CLK(clk), .Q(N67) );
  DFFASX2 \out_tri_enable_reg[5]  ( .D(n133), .CLK(clk), .SETB(n136), .QN(n44)
         );
  DFFX2 \out_reg[4]  ( .D(store[4]), .CLK(clk), .Q(N70) );
  DFFASX2 \out_tri_enable_reg[4]  ( .D(n132), .CLK(clk), .SETB(n136), .QN(n45)
         );
  DFFX2 \out_reg[3]  ( .D(store[3]), .CLK(clk), .Q(N73) );
  DFFASX2 \out_tri_enable_reg[3]  ( .D(n133), .CLK(clk), .SETB(n136), .QN(n46)
         );
  DFFX2 \out_reg[2]  ( .D(store[2]), .CLK(clk), .Q(N76) );
  DFFASX2 \out_tri_enable_reg[2]  ( .D(n132), .CLK(clk), .SETB(n136), .QN(n47)
         );
  DFFX2 \out_reg[1]  ( .D(store[1]), .CLK(clk), .Q(N79) );
  DFFASX2 \out_tri_enable_reg[1]  ( .D(n133), .CLK(clk), .SETB(n135), .QN(n48)
         );
  DFFX2 \out_reg[0]  ( .D(store[0]), .CLK(clk), .Q(N82) );
  DFFASX2 \out_tri_enable_reg[0]  ( .D(n132), .CLK(clk), .SETB(n135), .QN(n49)
         );
  DFFARX2 \store_reg[0]  ( .D(n98), .CLK(clk), .RSTB(n134), .Q(store[0]) );
  DFFARX2 \store_reg[1]  ( .D(n97), .CLK(clk), .RSTB(n134), .Q(store[1]) );
  DFFARX2 \store_reg[2]  ( .D(n96), .CLK(clk), .RSTB(n135), .Q(store[2]) );
  DFFARX2 \store_reg[3]  ( .D(n95), .CLK(clk), .RSTB(n134), .Q(store[3]) );
  DFFARX2 \store_reg[4]  ( .D(n94), .CLK(clk), .RSTB(n135), .Q(store[4]) );
  DFFARX2 \store_reg[5]  ( .D(n93), .CLK(clk), .RSTB(n134), .Q(store[5]) );
  DFFARX2 \store_reg[6]  ( .D(n92), .CLK(clk), .RSTB(n135), .Q(store[6]) );
  DFFARX2 \store_reg[7]  ( .D(n91), .CLK(clk), .RSTB(n134), .Q(store[7]) );
  DFFARX2 \store_reg[8]  ( .D(n90), .CLK(clk), .RSTB(n135), .Q(store[8]) );
  DFFARX2 \store_reg[9]  ( .D(n89), .CLK(clk), .RSTB(n134), .Q(store[9]) );
  DFFARX2 \store_reg[10]  ( .D(n88), .CLK(clk), .RSTB(n134), .Q(store[10]) );
  DFFARX2 \store_reg[11]  ( .D(n87), .CLK(clk), .RSTB(n135), .Q(store[11]) );
  DFFARX2 \store_reg[12]  ( .D(n86), .CLK(clk), .RSTB(n134), .Q(store[12]) );
  DFFARX2 \store_reg[13]  ( .D(n85), .CLK(clk), .RSTB(n135), .Q(store[13]) );
  DFFARX2 \store_reg[14]  ( .D(n84), .CLK(clk), .RSTB(n134), .Q(store[14]) );
  DFFARX2 \store_reg[15]  ( .D(n83), .CLK(clk), .RSTB(n135), .Q(store[15]) );
  TNBUFFHX8 \out_tri[0]  ( .IN(n113), .ENB(n131), .Q(out[0]) );
  TNBUFFHX8 \out_tri[1]  ( .IN(n112), .ENB(n130), .Q(out[1]) );
  TNBUFFHX8 \out_tri[2]  ( .IN(n129), .ENB(n115), .Q(out[2]) );
  TNBUFFHX8 \out_tri[3]  ( .IN(n128), .ENB(n114), .Q(out[3]) );
  TNBUFFHX8 \out_tri[4]  ( .IN(n127), .ENB(n111), .Q(out[4]) );
  TNBUFFHX8 \out_tri[5]  ( .IN(n126), .ENB(n110), .Q(out[5]) );
  TNBUFFHX8 \out_tri[6]  ( .IN(n125), .ENB(n109), .Q(out[6]) );
  TNBUFFHX8 \out_tri[7]  ( .IN(n124), .ENB(n108), .Q(out[7]) );
  TNBUFFHX8 \out_tri[8]  ( .IN(n123), .ENB(n107), .Q(out[8]) );
  TNBUFFHX8 \out_tri[9]  ( .IN(n122), .ENB(n106), .Q(out[9]) );
  TNBUFFHX8 \out_tri[10]  ( .IN(n121), .ENB(n105), .Q(out[10]) );
  TNBUFFHX8 \out_tri[11]  ( .IN(n120), .ENB(n104), .Q(out[11]) );
  TNBUFFHX8 \out_tri[12]  ( .IN(n119), .ENB(n103), .Q(out[12]) );
  TNBUFFHX8 \out_tri[13]  ( .IN(n118), .ENB(n102), .Q(out[13]) );
  TNBUFFHX8 \out_tri[14]  ( .IN(n117), .ENB(n101), .Q(out[14]) );
  TNBUFFHX8 \out_tri[15]  ( .IN(n116), .ENB(n100), .Q(out[15]) );
  AO22X2 U3 ( .IN1(n139), .IN2(store[9]), .IN3(incr), .IN4(N29), .Q(n89) );
  AO22X2 U5 ( .IN1(n139), .IN2(store[8]), .IN3(N28), .IN4(incr), .Q(n90) );
  AO22X2 U6 ( .IN1(n139), .IN2(store[7]), .IN3(N27), .IN4(incr), .Q(n91) );
  AO22X2 U7 ( .IN1(n139), .IN2(store[6]), .IN3(N26), .IN4(incr), .Q(n92) );
  AO22X2 U8 ( .IN1(n139), .IN2(store[5]), .IN3(N25), .IN4(incr), .Q(n93) );
  AO22X2 U9 ( .IN1(n139), .IN2(store[4]), .IN3(N24), .IN4(incr), .Q(n94) );
  AO22X2 U10 ( .IN1(n139), .IN2(store[3]), .IN3(N23), .IN4(incr), .Q(n95) );
  AO22X2 U11 ( .IN1(n139), .IN2(store[2]), .IN3(N22), .IN4(incr), .Q(n96) );
  AO22X2 U12 ( .IN1(n139), .IN2(store[1]), .IN3(N21), .IN4(incr), .Q(n97) );
  AO22X2 U13 ( .IN1(n139), .IN2(store[15]), .IN3(N35), .IN4(incr), .Q(n83) );
  AO22X2 U14 ( .IN1(n139), .IN2(store[14]), .IN3(N34), .IN4(incr), .Q(n84) );
  AO22X2 U15 ( .IN1(n139), .IN2(store[13]), .IN3(N33), .IN4(incr), .Q(n85) );
  AO22X2 U16 ( .IN1(n139), .IN2(store[12]), .IN3(N32), .IN4(incr), .Q(n86) );
  AO22X2 U17 ( .IN1(n139), .IN2(store[11]), .IN3(N31), .IN4(incr), .Q(n87) );
  AO22X2 U18 ( .IN1(n139), .IN2(store[10]), .IN3(N30), .IN4(incr), .Q(n88) );
  AO22X2 U19 ( .IN1(n139), .IN2(store[0]), .IN3(N20), .IN4(incr), .Q(n98) );
  PC_DW01_inc_0 add_12 ( .A(store), .SUM({N35, N34, N33, N32, N31, N30, N29, 
        N28, N27, N26, N25, N24, N23, N22, N21, N20}) );
  AND2X1 U22 ( .IN1(en), .IN2(n139), .Q(n99) );
  NBUFFX16 U23 ( .IN(n34), .Q(n100) );
  NBUFFX16 U24 ( .IN(n35), .Q(n101) );
  NBUFFX16 U25 ( .IN(n36), .Q(n102) );
  NBUFFX16 U26 ( .IN(n37), .Q(n103) );
  NBUFFX16 U27 ( .IN(n38), .Q(n104) );
  NBUFFX16 U28 ( .IN(n39), .Q(n105) );
  NBUFFX16 U29 ( .IN(n40), .Q(n106) );
  NBUFFX16 U30 ( .IN(n41), .Q(n107) );
  NBUFFX16 U31 ( .IN(n42), .Q(n108) );
  NBUFFX16 U32 ( .IN(n43), .Q(n109) );
  NBUFFX16 U33 ( .IN(n44), .Q(n110) );
  NBUFFX16 U34 ( .IN(n45), .Q(n111) );
  NBUFFX16 U35 ( .IN(N79), .Q(n112) );
  NBUFFX16 U36 ( .IN(N82), .Q(n113) );
  NBUFFX16 U37 ( .IN(n46), .Q(n114) );
  NBUFFX16 U38 ( .IN(n47), .Q(n115) );
  NBUFFX16 U39 ( .IN(N37), .Q(n116) );
  NBUFFX16 U40 ( .IN(N40), .Q(n117) );
  NBUFFX16 U41 ( .IN(N43), .Q(n118) );
  NBUFFX16 U42 ( .IN(N46), .Q(n119) );
  NBUFFX16 U43 ( .IN(N49), .Q(n120) );
  NBUFFX16 U44 ( .IN(N52), .Q(n121) );
  NBUFFX16 U45 ( .IN(N55), .Q(n122) );
  NBUFFX16 U46 ( .IN(N58), .Q(n123) );
  NBUFFX16 U47 ( .IN(N61), .Q(n124) );
  NBUFFX16 U48 ( .IN(N64), .Q(n125) );
  NBUFFX16 U49 ( .IN(N67), .Q(n126) );
  NBUFFX16 U50 ( .IN(N70), .Q(n127) );
  NBUFFX16 U51 ( .IN(N73), .Q(n128) );
  NBUFFX16 U52 ( .IN(N76), .Q(n129) );
  NBUFFX16 U53 ( .IN(n48), .Q(n130) );
  NBUFFX16 U54 ( .IN(n49), .Q(n131) );
  AOINVX1 U55 ( .IN(n99), .QN(n132) );
  AOINVX1 U56 ( .IN(n99), .QN(n133) );
  AOBUFX1 U57 ( .IN(n138), .Q(n136) );
  AOBUFX1 U58 ( .IN(n138), .Q(n134) );
  AOBUFX1 U59 ( .IN(n138), .Q(n135) );
  AOBUFX1 U60 ( .IN(n138), .Q(n137) );
  AOINVX2 U61 ( .IN(incr), .QN(n139) );
  AOINVX1 U62 ( .IN(reset), .QN(n138) );
endmodule



module REG100( clk, data, reset, enSig, outSig, outData );
  input [15:0] data;
  input [5:0] enSig;
  input [5:0] outSig;
  output [15:0] outData;
  input clk, reset;
  wire   N101, N102, N104, N105, N107, N108, N111, N113, N114, N116, N117,
         N120, N122, N123, N125, N126, N128, N129, N131, N132, N134, N135,
         N137, N138, N140, N141, N143, N144, N147, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n182, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n210, n211, n212, n213, n214, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n234, n235, n237, n238, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470;
  wire   [15:0] reg3;
  wire   [15:0] reg2;
  wire   [15:0] reg1;
  wire   [15:0] reg0;
  tri   [15:0] outData;

  DFFX2 \outData_tri_enable_reg[15]  ( .D(n411), .CLK(clk), .Q(N102), .QN(n204) );
  DFFX2 \outData_tri_enable_reg[14]  ( .D(n410), .CLK(clk), .Q(N105), .QN(n206) );
  DFFX2 \outData_tri_enable_reg[13]  ( .D(n409), .CLK(clk), .Q(N108), .QN(n208) );
  DFFX2 \outData_tri_enable_reg[12]  ( .D(n408), .CLK(clk), .Q(N111), .QN(n210) );
  DFFX2 \outData_tri_enable_reg[11]  ( .D(n407), .CLK(clk), .Q(N114), .QN(n212) );
  DFFX2 \outData_tri_enable_reg[10]  ( .D(n406), .CLK(clk), .Q(N117), .QN(n214) );
  DFFX2 \outData_tri_enable_reg[9]  ( .D(n405), .CLK(clk), .Q(N120), .QN(n216)
         );
  DFFX2 \outData_tri_enable_reg[8]  ( .D(n404), .CLK(clk), .Q(N123), .QN(n218)
         );
  DFFX2 \outData_tri_enable_reg[7]  ( .D(n403), .CLK(clk), .Q(N126), .QN(n220)
         );
  DFFX2 \outData_tri_enable_reg[6]  ( .D(n402), .CLK(clk), .Q(N129), .QN(n222)
         );
  DFFX2 \outData_tri_enable_reg[5]  ( .D(n401), .CLK(clk), .Q(N132), .QN(n224)
         );
  DFFX2 \outData_tri_enable_reg[4]  ( .D(n400), .CLK(clk), .Q(N135), .QN(n226)
         );
  DFFX2 \outData_tri_enable_reg[3]  ( .D(n399), .CLK(clk), .Q(N138), .QN(n228)
         );
  DFFX2 \outData_tri_enable_reg[2]  ( .D(n398), .CLK(clk), .Q(N141), .QN(n230)
         );
  DFFX2 \outData_tri_enable_reg[1]  ( .D(n397), .CLK(clk), .Q(N144), .QN(n232)
         );
  DFFX2 \outData_tri_enable_reg[0]  ( .D(n396), .CLK(clk), .Q(N147), .QN(n234)
         );
  DFFARX2 \reg2_reg[15]  ( .D(n395), .CLK(clk), .RSTB(n462), .Q(reg2[15]), 
        .QN(n290) );
  DFFARX2 \reg2_reg[14]  ( .D(n394), .CLK(clk), .RSTB(n466), .Q(reg2[14]), 
        .QN(n289) );
  DFFARX2 \reg2_reg[13]  ( .D(n393), .CLK(clk), .RSTB(n470), .Q(reg2[13]), 
        .QN(n288) );
  DFFARX2 \reg2_reg[12]  ( .D(n392), .CLK(clk), .RSTB(n466), .Q(reg2[12]), 
        .QN(n287) );
  DFFARX2 \reg2_reg[11]  ( .D(n391), .CLK(clk), .RSTB(n463), .Q(reg2[11]), 
        .QN(n286) );
  DFFARX2 \reg2_reg[10]  ( .D(n390), .CLK(clk), .RSTB(n466), .Q(reg2[10]), 
        .QN(n285) );
  DFFARX2 \reg2_reg[9]  ( .D(n389), .CLK(clk), .RSTB(n465), .Q(reg2[9]), .QN(
        n299) );
  DFFARX2 \reg2_reg[8]  ( .D(n388), .CLK(clk), .RSTB(n461), .Q(reg2[8]), .QN(
        n298) );
  DFFARX2 \reg2_reg[7]  ( .D(n387), .CLK(clk), .RSTB(n466), .Q(reg2[7]), .QN(
        n297) );
  DFFARX2 \reg2_reg[6]  ( .D(n386), .CLK(clk), .RSTB(n470), .Q(reg2[6]), .QN(
        n296) );
  DFFARX2 \reg2_reg[5]  ( .D(n385), .CLK(clk), .RSTB(n466), .Q(reg2[5]), .QN(
        n295) );
  DFFARX2 \reg2_reg[4]  ( .D(n384), .CLK(clk), .RSTB(n469), .Q(reg2[4]), .QN(
        n294) );
  DFFARX2 \reg2_reg[3]  ( .D(n383), .CLK(clk), .RSTB(n466), .Q(reg2[3]), .QN(
        n293) );
  DFFARX2 \reg2_reg[2]  ( .D(n382), .CLK(clk), .RSTB(n462), .Q(reg2[2]), .QN(
        n292) );
  DFFARX2 \reg2_reg[1]  ( .D(n381), .CLK(clk), .RSTB(n466), .Q(reg2[1]), .QN(
        n291) );
  DFFARX2 \reg2_reg[0]  ( .D(n380), .CLK(clk), .RSTB(n463), .Q(reg2[0]), .QN(
        n284) );
  DFFARX2 \reg1_reg[15]  ( .D(n379), .CLK(clk), .RSTB(n470), .Q(reg1[15]), 
        .QN(n274) );
  DFFARX2 \reg1_reg[14]  ( .D(n378), .CLK(clk), .RSTB(n467), .Q(reg1[14]), 
        .QN(n273) );
  DFFARX2 \reg1_reg[13]  ( .D(n377), .CLK(clk), .RSTB(n469), .Q(reg1[13]), 
        .QN(n272) );
  DFFARX2 \reg1_reg[12]  ( .D(n376), .CLK(clk), .RSTB(n467), .Q(reg1[12]), 
        .QN(n271) );
  DFFARX2 \reg1_reg[11]  ( .D(n375), .CLK(clk), .RSTB(n468), .Q(reg1[11]), 
        .QN(n270) );
  DFFARX2 \reg1_reg[10]  ( .D(n374), .CLK(clk), .RSTB(n467), .Q(reg1[10]), 
        .QN(n269) );
  DFFARX2 \reg1_reg[9]  ( .D(n373), .CLK(clk), .RSTB(n466), .Q(reg1[9]), .QN(
        n283) );
  DFFARX2 \reg1_reg[8]  ( .D(n372), .CLK(clk), .RSTB(n470), .Q(reg1[8]), .QN(
        n282) );
  DFFARX2 \reg1_reg[7]  ( .D(n371), .CLK(clk), .RSTB(n466), .Q(reg1[7]), .QN(
        n281) );
  DFFARX2 \reg1_reg[6]  ( .D(n370), .CLK(clk), .RSTB(n469), .Q(reg1[6]), .QN(
        n280) );
  DFFARX2 \reg1_reg[5]  ( .D(n369), .CLK(clk), .RSTB(n467), .Q(reg1[5]), .QN(
        n279) );
  DFFARX2 \reg1_reg[4]  ( .D(n368), .CLK(clk), .RSTB(n470), .Q(reg1[4]), .QN(
        n278) );
  DFFARX2 \reg1_reg[3]  ( .D(n367), .CLK(clk), .RSTB(n467), .Q(reg1[3]), .QN(
        n277) );
  DFFARX2 \reg1_reg[2]  ( .D(n366), .CLK(clk), .RSTB(n468), .Q(reg1[2]), .QN(
        n276) );
  DFFARX2 \reg1_reg[1]  ( .D(n365), .CLK(clk), .RSTB(n467), .Q(reg1[1]), .QN(
        n275) );
  DFFARX2 \reg1_reg[0]  ( .D(n364), .CLK(clk), .RSTB(n470), .Q(reg1[0]), .QN(
        n268) );
  DFFARX2 \reg0_reg[15]  ( .D(n363), .CLK(clk), .RSTB(n468), .Q(reg0[15]), 
        .QN(n258) );
  DFFARX2 \reg0_reg[14]  ( .D(n362), .CLK(clk), .RSTB(n468), .Q(reg0[14]), 
        .QN(n257) );
  DFFARX2 \reg0_reg[13]  ( .D(n361), .CLK(clk), .RSTB(n469), .Q(reg0[13]), 
        .QN(n256) );
  DFFARX2 \reg0_reg[12]  ( .D(n360), .CLK(clk), .RSTB(n468), .Q(reg0[12]), 
        .QN(n255) );
  DFFARX2 \reg0_reg[11]  ( .D(n359), .CLK(clk), .RSTB(n469), .Q(reg0[11]), 
        .QN(n254) );
  DFFARX2 \reg0_reg[10]  ( .D(n358), .CLK(clk), .RSTB(n468), .Q(reg0[10]), 
        .QN(n253) );
  DFFARX2 \reg0_reg[9]  ( .D(n357), .CLK(clk), .RSTB(n467), .Q(reg0[9]), .QN(
        n267) );
  DFFARX2 \reg0_reg[8]  ( .D(n356), .CLK(clk), .RSTB(n470), .Q(reg0[8]), .QN(
        n266) );
  DFFARX2 \reg0_reg[7]  ( .D(n355), .CLK(clk), .RSTB(n467), .Q(reg0[7]), .QN(
        n265) );
  DFFARX2 \reg0_reg[6]  ( .D(n354), .CLK(clk), .RSTB(n469), .Q(reg0[6]), .QN(
        n264) );
  DFFARX2 \reg0_reg[5]  ( .D(n353), .CLK(clk), .RSTB(n467), .Q(reg0[5]), .QN(
        n263) );
  DFFARX2 \reg0_reg[4]  ( .D(n352), .CLK(clk), .RSTB(n469), .Q(reg0[4]), .QN(
        n262) );
  DFFARX2 \reg0_reg[3]  ( .D(n351), .CLK(clk), .RSTB(n468), .Q(reg0[3]), .QN(
        n261) );
  DFFARX2 \reg0_reg[2]  ( .D(n350), .CLK(clk), .RSTB(n469), .Q(reg0[2]), .QN(
        n260) );
  DFFARX2 \reg0_reg[1]  ( .D(n349), .CLK(clk), .RSTB(n468), .Q(reg0[1]), .QN(
        n259) );
  DFFARX2 \reg0_reg[0]  ( .D(n348), .CLK(clk), .RSTB(n469), .Q(reg0[0]), .QN(
        n252) );
  DFFARX2 \reg3_reg[15]  ( .D(n347), .CLK(clk), .RSTB(n461), .Q(reg3[15]), 
        .QN(n306) );
  DFFX2 \outData_reg[15]  ( .D(n346), .CLK(clk), .Q(N101), .QN(n242) );
  DFFARX2 \reg3_reg[14]  ( .D(n345), .CLK(clk), .RSTB(n465), .Q(reg3[14]), 
        .QN(n305) );
  DFFX2 \outData_reg[14]  ( .D(n344), .CLK(clk), .Q(N104), .QN(n241) );
  DFFARX2 \reg3_reg[13]  ( .D(n343), .CLK(clk), .RSTB(n470), .Q(reg3[13]), 
        .QN(n304) );
  DFFX2 \outData_reg[13]  ( .D(n342), .CLK(clk), .Q(N107), .QN(n240) );
  DFFARX2 \reg3_reg[12]  ( .D(n341), .CLK(clk), .RSTB(n465), .Q(reg3[12]), 
        .QN(n303) );
  DFFX2 \outData_reg[12]  ( .D(n340), .CLK(clk), .Q(n416) );
  DFFARX2 \reg3_reg[11]  ( .D(n339), .CLK(clk), .RSTB(n462), .Q(reg3[11]), 
        .QN(n302) );
  DFFX2 \outData_reg[11]  ( .D(n338), .CLK(clk), .Q(N113), .QN(n238) );
  DFFARX2 \reg3_reg[10]  ( .D(n337), .CLK(clk), .RSTB(n465), .Q(reg3[10]), 
        .QN(n301) );
  DFFX2 \outData_reg[10]  ( .D(n336), .CLK(clk), .Q(N116), .QN(n237) );
  DFFARX2 \reg3_reg[9]  ( .D(n335), .CLK(clk), .RSTB(n468), .Q(reg3[9]), .QN(
        n315) );
  DFFX2 \outData_reg[9]  ( .D(n334), .CLK(clk), .Q(n417) );
  DFFARX2 \reg3_reg[8]  ( .D(n333), .CLK(clk), .RSTB(n465), .Q(reg3[8]), .QN(
        n314) );
  DFFX2 \outData_reg[8]  ( .D(n332), .CLK(clk), .Q(N122), .QN(n250) );
  DFFARX2 \reg3_reg[7]  ( .D(n331), .CLK(clk), .RSTB(n465), .Q(reg3[7]), .QN(
        n313) );
  DFFX2 \outData_reg[7]  ( .D(n330), .CLK(clk), .Q(N125), .QN(n249) );
  DFFARX2 \reg3_reg[6]  ( .D(n329), .CLK(clk), .RSTB(n470), .Q(reg3[6]), .QN(
        n312) );
  DFFX2 \outData_reg[6]  ( .D(n328), .CLK(clk), .Q(N128), .QN(n248) );
  DFFARX2 \reg3_reg[5]  ( .D(n327), .CLK(clk), .RSTB(n465), .Q(reg3[5]), .QN(
        n311) );
  DFFX2 \outData_reg[5]  ( .D(n326), .CLK(clk), .Q(N131), .QN(n247) );
  DFFARX2 \reg3_reg[4]  ( .D(n325), .CLK(clk), .RSTB(n462), .Q(reg3[4]), .QN(
        n310) );
  DFFX2 \outData_reg[4]  ( .D(n324), .CLK(clk), .Q(N134), .QN(n246) );
  DFFARX2 \reg3_reg[3]  ( .D(n323), .CLK(clk), .RSTB(n465), .Q(reg3[3]), .QN(
        n309) );
  DFFX2 \outData_reg[3]  ( .D(n322), .CLK(clk), .Q(N137), .QN(n245) );
  DFFARX2 \reg3_reg[2]  ( .D(n321), .CLK(clk), .RSTB(n463), .Q(reg3[2]), .QN(
        n308) );
  DFFX2 \outData_reg[2]  ( .D(n320), .CLK(clk), .Q(N140), .QN(n244) );
  DFFARX2 \reg3_reg[1]  ( .D(n319), .CLK(clk), .RSTB(n465), .Q(reg3[1]), .QN(
        n307) );
  DFFX2 \outData_reg[1]  ( .D(n318), .CLK(clk), .Q(N143), .QN(n243) );
  DFFARX2 \reg3_reg[0]  ( .D(n317), .CLK(clk), .RSTB(n461), .Q(reg3[0]), .QN(
        n300) );
  DFFX2 \outData_reg[0]  ( .D(n316), .CLK(clk), .Q(n418) );
  TNBUFFHX8 \outData_tri[0]  ( .IN(n441), .ENB(n434), .Q(outData[0]) );
  TNBUFFHX8 \outData_tri[1]  ( .IN(n438), .ENB(n433), .Q(outData[1]) );
  TNBUFFHX8 \outData_tri[2]  ( .IN(n442), .ENB(n432), .Q(outData[2]) );
  TNBUFFHX8 \outData_tri[3]  ( .IN(n435), .ENB(n431), .Q(outData[3]) );
  TNBUFFHX8 \outData_tri[4]  ( .IN(n447), .ENB(n430), .Q(outData[4]) );
  TNBUFFHX8 \outData_tri[5]  ( .IN(n439), .ENB(n429), .Q(outData[5]) );
  TNBUFFHX8 \outData_tri[6]  ( .IN(n449), .ENB(n428), .Q(outData[6]) );
  TNBUFFHX8 \outData_tri[7]  ( .IN(n440), .ENB(n427), .Q(outData[7]) );
  TNBUFFHX8 \outData_tri[8]  ( .IN(n443), .ENB(n426), .Q(outData[8]) );
  TNBUFFHX8 \outData_tri[9]  ( .IN(n436), .ENB(n425), .Q(outData[9]) );
  TNBUFFHX8 \outData_tri[10]  ( .IN(n437), .ENB(n424), .Q(outData[10]) );
  TNBUFFHX8 \outData_tri[11]  ( .IN(n444), .ENB(n423), .Q(outData[11]) );
  TNBUFFHX8 \outData_tri[12]  ( .IN(n445), .ENB(n422), .Q(outData[12]) );
  TNBUFFHX8 \outData_tri[13]  ( .IN(n448), .ENB(n421), .Q(outData[13]) );
  TNBUFFHX8 \outData_tri[14]  ( .IN(n450), .ENB(n420), .Q(outData[14]) );
  TNBUFFHX8 \outData_tri[15]  ( .IN(n446), .ENB(n419), .Q(outData[15]) );
  AO22X2 U2 ( .IN1(data[9]), .IN2(n460), .IN3(n459), .IN4(n83), .Q(n335) );
  AO22X2 U3 ( .IN1(data[8]), .IN2(n460), .IN3(n459), .IN4(n84), .Q(n333) );
  AO22X2 U4 ( .IN1(data[7]), .IN2(n460), .IN3(n459), .IN4(n85), .Q(n331) );
  AO22X2 U5 ( .IN1(data[6]), .IN2(n460), .IN3(n459), .IN4(n86), .Q(n329) );
  AO22X2 U6 ( .IN1(data[5]), .IN2(n460), .IN3(n459), .IN4(n87), .Q(n327) );
  AO22X2 U7 ( .IN1(data[4]), .IN2(n460), .IN3(n459), .IN4(n88), .Q(n325) );
  AO22X2 U8 ( .IN1(data[3]), .IN2(n460), .IN3(n459), .IN4(n89), .Q(n323) );
  AO22X2 U9 ( .IN1(data[2]), .IN2(n460), .IN3(n459), .IN4(n90), .Q(n321) );
  AO22X2 U10 ( .IN1(data[1]), .IN2(n460), .IN3(n459), .IN4(n91), .Q(n319) );
  AO22X2 U11 ( .IN1(data[15]), .IN2(n460), .IN3(n459), .IN4(n92), .Q(n347) );
  AO22X2 U12 ( .IN1(data[14]), .IN2(n460), .IN3(n459), .IN4(n93), .Q(n345) );
  AO22X2 U13 ( .IN1(data[13]), .IN2(n460), .IN3(n459), .IN4(n94), .Q(n343) );
  AO22X2 U14 ( .IN1(data[12]), .IN2(n460), .IN3(n459), .IN4(n95), .Q(n341) );
  AO22X2 U15 ( .IN1(data[11]), .IN2(n460), .IN3(n459), .IN4(n96), .Q(n339) );
  AO22X2 U16 ( .IN1(data[10]), .IN2(n460), .IN3(n459), .IN4(n97), .Q(n337) );
  AO22X2 U17 ( .IN1(data[0]), .IN2(n460), .IN3(n459), .IN4(n98), .Q(n317) );
  NAND4X0 U19 ( .IN1(enSig[2]), .IN2(enSig[1]), .IN3(enSig[0]), .IN4(n99), 
        .QN(n82) );
  AO22X2 U20 ( .IN1(n458), .IN2(data[9]), .IN3(n457), .IN4(n102), .Q(n389) );
  AO22X2 U21 ( .IN1(n458), .IN2(data[8]), .IN3(n457), .IN4(n103), .Q(n388) );
  AO22X2 U22 ( .IN1(n458), .IN2(data[7]), .IN3(n457), .IN4(n104), .Q(n387) );
  AO22X2 U23 ( .IN1(n458), .IN2(data[6]), .IN3(n457), .IN4(n105), .Q(n386) );
  AO22X2 U24 ( .IN1(n458), .IN2(data[5]), .IN3(n457), .IN4(n106), .Q(n385) );
  AO22X2 U25 ( .IN1(n458), .IN2(data[4]), .IN3(n457), .IN4(n107), .Q(n384) );
  AO22X2 U26 ( .IN1(n458), .IN2(data[3]), .IN3(n457), .IN4(n108), .Q(n383) );
  AO22X2 U27 ( .IN1(n458), .IN2(data[2]), .IN3(n457), .IN4(n109), .Q(n382) );
  AO22X2 U28 ( .IN1(n458), .IN2(data[1]), .IN3(n457), .IN4(n110), .Q(n381) );
  AO22X2 U29 ( .IN1(n458), .IN2(data[15]), .IN3(n457), .IN4(n111), .Q(n395) );
  AO22X2 U30 ( .IN1(n458), .IN2(data[14]), .IN3(n457), .IN4(n112), .Q(n394) );
  AO22X2 U31 ( .IN1(n458), .IN2(data[13]), .IN3(n457), .IN4(n113), .Q(n393) );
  AO22X2 U32 ( .IN1(n458), .IN2(data[12]), .IN3(n457), .IN4(n114), .Q(n392) );
  AO22X2 U33 ( .IN1(n458), .IN2(data[11]), .IN3(n457), .IN4(n115), .Q(n391) );
  AO22X2 U34 ( .IN1(n458), .IN2(data[10]), .IN3(n457), .IN4(n116), .Q(n390) );
  AO22X2 U35 ( .IN1(n458), .IN2(data[0]), .IN3(n457), .IN4(n117), .Q(n380) );
  NAND3X0 U37 ( .IN1(enSig[1]), .IN2(enSig[0]), .IN3(n118), .QN(n101) );
  AO22X2 U38 ( .IN1(n456), .IN2(data[9]), .IN3(n455), .IN4(n121), .Q(n373) );
  AO22X2 U39 ( .IN1(n456), .IN2(data[8]), .IN3(n455), .IN4(n122), .Q(n372) );
  AO22X2 U40 ( .IN1(n456), .IN2(data[7]), .IN3(n455), .IN4(n123), .Q(n371) );
  AO22X2 U41 ( .IN1(n456), .IN2(data[6]), .IN3(n455), .IN4(n124), .Q(n370) );
  AO22X2 U42 ( .IN1(n456), .IN2(data[5]), .IN3(n455), .IN4(n125), .Q(n369) );
  AO22X2 U43 ( .IN1(n456), .IN2(data[4]), .IN3(n455), .IN4(n126), .Q(n368) );
  AO22X2 U44 ( .IN1(n456), .IN2(data[3]), .IN3(n455), .IN4(n127), .Q(n367) );
  AO22X2 U45 ( .IN1(n456), .IN2(data[2]), .IN3(n455), .IN4(n128), .Q(n366) );
  AO22X2 U46 ( .IN1(n456), .IN2(data[1]), .IN3(n455), .IN4(n129), .Q(n365) );
  AO22X2 U47 ( .IN1(n456), .IN2(data[15]), .IN3(n455), .IN4(n130), .Q(n379) );
  AO22X2 U48 ( .IN1(n456), .IN2(data[14]), .IN3(n455), .IN4(n131), .Q(n378) );
  AO22X2 U49 ( .IN1(n456), .IN2(data[13]), .IN3(n455), .IN4(n132), .Q(n377) );
  AO22X2 U50 ( .IN1(n456), .IN2(data[12]), .IN3(n455), .IN4(n133), .Q(n376) );
  AO22X2 U51 ( .IN1(n456), .IN2(data[11]), .IN3(n455), .IN4(n134), .Q(n375) );
  AO22X2 U52 ( .IN1(n456), .IN2(data[10]), .IN3(n455), .IN4(n135), .Q(n374) );
  AO22X2 U53 ( .IN1(n456), .IN2(data[0]), .IN3(n455), .IN4(n136), .Q(n364) );
  NAND3X0 U55 ( .IN1(enSig[0]), .IN2(n137), .IN3(n118), .QN(n120) );
  AO22X2 U56 ( .IN1(n454), .IN2(data[9]), .IN3(n453), .IN4(n140), .Q(n357) );
  AO22X2 U57 ( .IN1(n454), .IN2(data[8]), .IN3(n453), .IN4(n141), .Q(n356) );
  AO22X2 U58 ( .IN1(n454), .IN2(data[7]), .IN3(n453), .IN4(n142), .Q(n355) );
  AO22X2 U59 ( .IN1(n454), .IN2(data[6]), .IN3(n453), .IN4(n143), .Q(n354) );
  AO22X2 U60 ( .IN1(n454), .IN2(data[5]), .IN3(n453), .IN4(n144), .Q(n353) );
  AO22X2 U61 ( .IN1(n454), .IN2(data[4]), .IN3(n453), .IN4(n145), .Q(n352) );
  AO22X2 U62 ( .IN1(n454), .IN2(data[3]), .IN3(n453), .IN4(n146), .Q(n351) );
  AO22X2 U63 ( .IN1(n454), .IN2(data[2]), .IN3(n453), .IN4(n147), .Q(n350) );
  AO22X2 U64 ( .IN1(n454), .IN2(data[1]), .IN3(n453), .IN4(n148), .Q(n349) );
  AO22X2 U65 ( .IN1(n454), .IN2(data[15]), .IN3(n453), .IN4(n149), .Q(n363) );
  AO22X2 U66 ( .IN1(n454), .IN2(data[14]), .IN3(n453), .IN4(n150), .Q(n362) );
  AO22X2 U67 ( .IN1(n454), .IN2(data[13]), .IN3(n453), .IN4(n151), .Q(n361) );
  AO22X2 U68 ( .IN1(n454), .IN2(data[12]), .IN3(n453), .IN4(n152), .Q(n360) );
  AO22X2 U69 ( .IN1(n454), .IN2(data[11]), .IN3(n453), .IN4(n153), .Q(n359) );
  AO22X2 U70 ( .IN1(n454), .IN2(data[10]), .IN3(n453), .IN4(n154), .Q(n358) );
  AO22X2 U71 ( .IN1(n454), .IN2(data[0]), .IN3(n453), .IN4(n155), .Q(n348) );
  NAND3X0 U73 ( .IN1(n156), .IN2(n137), .IN3(n118), .QN(n139) );
  ISOLANDX1 U74 ( .D(n99), .ISO(enSig[2]), .Q(n118) );
  NOR3X0 U75 ( .IN1(enSig[5]), .IN2(enSig[4]), .IN3(enSig[3]), .QN(n99) );
  NAND2X0 U78 ( .IN1(n157), .IN2(n158), .QN(n405) );
  NAND2X0 U80 ( .IN1(n157), .IN2(n159), .QN(n404) );
  NAND2X0 U82 ( .IN1(n157), .IN2(n160), .QN(n403) );
  NAND2X0 U84 ( .IN1(n157), .IN2(n161), .QN(n402) );
  NAND2X0 U86 ( .IN1(n157), .IN2(n162), .QN(n401) );
  NAND2X0 U88 ( .IN1(n157), .IN2(n163), .QN(n400) );
  NAND2X0 U90 ( .IN1(n157), .IN2(n164), .QN(n399) );
  NAND2X0 U92 ( .IN1(n157), .IN2(n165), .QN(n398) );
  NAND2X0 U94 ( .IN1(n157), .IN2(n166), .QN(n397) );
  NAND2X0 U96 ( .IN1(n157), .IN2(n167), .QN(n411) );
  NAND2X0 U98 ( .IN1(n157), .IN2(n168), .QN(n410) );
  NAND2X0 U100 ( .IN1(n157), .IN2(n169), .QN(n409) );
  NAND2X0 U102 ( .IN1(n157), .IN2(n170), .QN(n408) );
  NAND2X0 U104 ( .IN1(n157), .IN2(n171), .QN(n407) );
  NAND2X0 U106 ( .IN1(n157), .IN2(n172), .QN(n406) );
  NAND2X0 U108 ( .IN1(n157), .IN2(n173), .QN(n396) );
  NOR2X1 U112 ( .IN1(reset), .IN2(n178), .QN(n176) );
  AO221X2 U113 ( .IN1(n179), .IN2(n102), .IN3(reset), .IN4(n436), .IN5(n180), 
        .Q(n334) );
  AO222X2 U114 ( .IN1(n451), .IN2(n140), .IN3(n182), .IN4(n83), .IN5(n452), 
        .IN6(n121), .Q(n180) );
  AO221X2 U120 ( .IN1(n179), .IN2(n103), .IN3(reset), .IN4(n443), .IN5(n184), 
        .Q(n332) );
  AO222X2 U121 ( .IN1(n451), .IN2(n141), .IN3(n182), .IN4(n84), .IN5(n452), 
        .IN6(n122), .Q(n184) );
  AO221X2 U127 ( .IN1(n179), .IN2(n104), .IN3(reset), .IN4(n440), .IN5(n185), 
        .Q(n330) );
  AO222X2 U128 ( .IN1(n451), .IN2(n142), .IN3(n182), .IN4(n85), .IN5(n452), 
        .IN6(n123), .Q(n185) );
  AO221X2 U134 ( .IN1(n179), .IN2(n105), .IN3(reset), .IN4(n449), .IN5(n186), 
        .Q(n328) );
  AO222X2 U135 ( .IN1(n451), .IN2(n143), .IN3(n182), .IN4(n86), .IN5(n452), 
        .IN6(n124), .Q(n186) );
  AO221X2 U141 ( .IN1(n179), .IN2(n106), .IN3(reset), .IN4(n439), .IN5(n187), 
        .Q(n326) );
  AO222X2 U142 ( .IN1(n451), .IN2(n144), .IN3(n182), .IN4(n87), .IN5(n452), 
        .IN6(n125), .Q(n187) );
  AO221X2 U148 ( .IN1(n179), .IN2(n107), .IN3(reset), .IN4(n447), .IN5(n188), 
        .Q(n324) );
  AO222X2 U149 ( .IN1(n451), .IN2(n145), .IN3(n182), .IN4(n88), .IN5(n452), 
        .IN6(n126), .Q(n188) );
  AO221X2 U155 ( .IN1(n179), .IN2(n108), .IN3(reset), .IN4(n435), .IN5(n189), 
        .Q(n322) );
  AO222X2 U156 ( .IN1(n451), .IN2(n146), .IN3(n182), .IN4(n89), .IN5(n452), 
        .IN6(n127), .Q(n189) );
  AO221X2 U162 ( .IN1(n179), .IN2(n109), .IN3(reset), .IN4(n442), .IN5(n190), 
        .Q(n320) );
  AO222X2 U163 ( .IN1(n451), .IN2(n147), .IN3(n182), .IN4(n90), .IN5(n452), 
        .IN6(n128), .Q(n190) );
  AO221X2 U169 ( .IN1(n179), .IN2(n110), .IN3(reset), .IN4(n438), .IN5(n191), 
        .Q(n318) );
  AO222X2 U170 ( .IN1(n451), .IN2(n148), .IN3(n182), .IN4(n91), .IN5(n452), 
        .IN6(n129), .Q(n191) );
  AO221X2 U176 ( .IN1(n179), .IN2(n111), .IN3(reset), .IN4(n446), .IN5(n192), 
        .Q(n346) );
  AO222X2 U177 ( .IN1(n451), .IN2(n149), .IN3(n182), .IN4(n92), .IN5(n452), 
        .IN6(n130), .Q(n192) );
  AO221X2 U183 ( .IN1(n179), .IN2(n112), .IN3(reset), .IN4(n450), .IN5(n193), 
        .Q(n344) );
  AO222X2 U184 ( .IN1(n451), .IN2(n150), .IN3(n182), .IN4(n93), .IN5(n452), 
        .IN6(n131), .Q(n193) );
  AO221X2 U190 ( .IN1(n179), .IN2(n113), .IN3(reset), .IN4(n448), .IN5(n194), 
        .Q(n342) );
  AO222X2 U191 ( .IN1(n451), .IN2(n151), .IN3(n182), .IN4(n94), .IN5(n452), 
        .IN6(n132), .Q(n194) );
  AO221X2 U197 ( .IN1(n179), .IN2(n114), .IN3(reset), .IN4(n445), .IN5(n195), 
        .Q(n340) );
  AO222X2 U198 ( .IN1(n451), .IN2(n152), .IN3(n182), .IN4(n95), .IN5(n452), 
        .IN6(n133), .Q(n195) );
  AO221X2 U204 ( .IN1(n179), .IN2(n115), .IN3(reset), .IN4(n444), .IN5(n196), 
        .Q(n338) );
  AO222X2 U205 ( .IN1(n451), .IN2(n153), .IN3(n182), .IN4(n96), .IN5(n452), 
        .IN6(n134), .Q(n196) );
  AO221X2 U211 ( .IN1(n179), .IN2(n116), .IN3(reset), .IN4(n437), .IN5(n197), 
        .Q(n336) );
  AO222X2 U212 ( .IN1(n451), .IN2(n154), .IN3(n182), .IN4(n97), .IN5(n452), 
        .IN6(n135), .Q(n197) );
  AO221X2 U218 ( .IN1(n179), .IN2(n117), .IN3(reset), .IN4(n441), .IN5(n198), 
        .Q(n316) );
  AO222X2 U219 ( .IN1(n451), .IN2(n155), .IN3(n182), .IN4(n98), .IN5(n452), 
        .IN6(n136), .Q(n198) );
  NAND3X0 U222 ( .IN1(n199), .IN2(n200), .IN3(outSig[0]), .QN(n177) );
  NAND4X0 U225 ( .IN1(outSig[2]), .IN2(outSig[1]), .IN3(outSig[0]), .IN4(n201), 
        .QN(n174) );
  NAND3X0 U228 ( .IN1(n202), .IN2(n200), .IN3(n199), .QN(n175) );
  ISOLANDX1 U233 ( .D(n178), .ISO(reset), .Q(n179) );
  AND3X1 U234 ( .IN1(outSig[0]), .IN2(n199), .IN3(outSig[1]), .Q(n178) );
  ISOLANDX1 U235 ( .D(n201), .ISO(outSig[2]), .Q(n199) );
  NOR3X0 U236 ( .IN1(outSig[5]), .IN2(outSig[4]), .IN3(outSig[3]), .QN(n201)
         );
  ISOLORX2 U237 ( .D(n175), .ISO(reset), .Q(n412) );
  ISOLORX2 U238 ( .D(n177), .ISO(reset), .Q(n413) );
  ISOLORX2 U239 ( .D(n174), .ISO(reset), .Q(n414) );
  INVX0 U240 ( .IN(n414), .QN(n182) );
  AND4X1 U241 ( .IN1(n174), .IN2(n175), .IN3(n176), .IN4(n177), .Q(n415) );
  INVX0 U242 ( .IN(n415), .QN(n157) );
  ISOLORX2 U243 ( .D(n464), .ISO(n434), .Q(n173) );
  ISOLORX2 U244 ( .D(n464), .ISO(n433), .Q(n166) );
  ISOLORX2 U245 ( .D(n464), .ISO(n429), .Q(n162) );
  ISOLORX2 U246 ( .D(n464), .ISO(n425), .Q(n158) );
  ISOLORX2 U247 ( .D(n464), .ISO(n423), .Q(n171) );
  ISOLORX2 U248 ( .D(n464), .ISO(n422), .Q(n170) );
  ISOLORX2 U249 ( .D(n464), .ISO(n420), .Q(n168) );
  NBUFFX16 U250 ( .IN(n204), .Q(n419) );
  OR2X2 U251 ( .IN1(n235), .IN2(n419), .Q(n167) );
  NBUFFX16 U252 ( .IN(n206), .Q(n420) );
  NBUFFX16 U253 ( .IN(n208), .Q(n421) );
  OR2X2 U254 ( .IN1(n235), .IN2(n421), .Q(n169) );
  NBUFFX16 U255 ( .IN(n210), .Q(n422) );
  NBUFFX16 U256 ( .IN(n212), .Q(n423) );
  NBUFFX16 U257 ( .IN(n214), .Q(n424) );
  OR2X2 U258 ( .IN1(n235), .IN2(n424), .Q(n172) );
  NBUFFX16 U259 ( .IN(n216), .Q(n425) );
  NBUFFX16 U260 ( .IN(n218), .Q(n426) );
  OR2X2 U261 ( .IN1(n235), .IN2(n426), .Q(n159) );
  NBUFFX16 U262 ( .IN(n220), .Q(n427) );
  OR2X2 U263 ( .IN1(n235), .IN2(n427), .Q(n160) );
  NBUFFX16 U264 ( .IN(n222), .Q(n428) );
  OR2X2 U265 ( .IN1(n235), .IN2(n428), .Q(n161) );
  NBUFFX16 U266 ( .IN(n224), .Q(n429) );
  NBUFFX16 U267 ( .IN(n226), .Q(n430) );
  OR2X2 U268 ( .IN1(n235), .IN2(n430), .Q(n163) );
  NBUFFX16 U269 ( .IN(n228), .Q(n431) );
  OR2X2 U270 ( .IN1(n235), .IN2(n431), .Q(n164) );
  NBUFFX16 U271 ( .IN(n230), .Q(n432) );
  OR2X2 U272 ( .IN1(n235), .IN2(n432), .Q(n165) );
  NBUFFX16 U273 ( .IN(n232), .Q(n433) );
  NBUFFX16 U274 ( .IN(n234), .Q(n434) );
  NBUFFX16 U275 ( .IN(n227), .Q(n435) );
  AOINVX1 U276 ( .IN(n245), .QN(n227) );
  NBUFFX16 U277 ( .IN(n417), .Q(n436) );
  NBUFFX16 U278 ( .IN(n213), .Q(n437) );
  AOINVX1 U279 ( .IN(n237), .QN(n213) );
  NBUFFX16 U280 ( .IN(n231), .Q(n438) );
  AOINVX1 U281 ( .IN(n243), .QN(n231) );
  NBUFFX16 U282 ( .IN(n223), .Q(n439) );
  AOINVX1 U283 ( .IN(n247), .QN(n223) );
  NBUFFX16 U284 ( .IN(n219), .Q(n440) );
  AOINVX1 U285 ( .IN(n249), .QN(n219) );
  NBUFFX16 U286 ( .IN(n418), .Q(n441) );
  NBUFFX16 U287 ( .IN(n229), .Q(n442) );
  AOINVX1 U288 ( .IN(n244), .QN(n229) );
  NBUFFX16 U289 ( .IN(n217), .Q(n443) );
  AOINVX1 U290 ( .IN(n250), .QN(n217) );
  NBUFFX16 U291 ( .IN(n211), .Q(n444) );
  AOINVX1 U292 ( .IN(n238), .QN(n211) );
  NBUFFX16 U293 ( .IN(n416), .Q(n445) );
  NBUFFX16 U294 ( .IN(n203), .Q(n446) );
  AOINVX1 U295 ( .IN(n242), .QN(n203) );
  NBUFFX16 U296 ( .IN(n225), .Q(n447) );
  AOINVX1 U297 ( .IN(n246), .QN(n225) );
  NBUFFX16 U298 ( .IN(n207), .Q(n448) );
  AOINVX1 U299 ( .IN(n240), .QN(n207) );
  NBUFFX16 U300 ( .IN(n221), .Q(n449) );
  AOINVX1 U301 ( .IN(n248), .QN(n221) );
  NBUFFX16 U302 ( .IN(n205), .Q(n450) );
  AOINVX1 U303 ( .IN(n241), .QN(n205) );
  AOBUFX1 U304 ( .IN(n462), .Q(n468) );
  AOBUFX1 U305 ( .IN(n462), .Q(n467) );
  AOBUFX1 U306 ( .IN(n463), .Q(n469) );
  AOBUFX1 U307 ( .IN(n463), .Q(n470) );
  AOBUFX1 U308 ( .IN(n461), .Q(n465) );
  AOBUFX1 U309 ( .IN(n461), .Q(n466) );
  AOBUFX1 U310 ( .IN(n461), .Q(n462) );
  AOBUFX1 U311 ( .IN(n461), .Q(n463) );
  AOINVX2 U312 ( .IN(n82), .QN(n460) );
  AOINVX2 U313 ( .IN(n139), .QN(n454) );
  AOINVX2 U314 ( .IN(n120), .QN(n456) );
  AOINVX2 U315 ( .IN(n101), .QN(n458) );
  AOBUFX1 U316 ( .IN(n464), .Q(n461) );
  AOBUFX1 U317 ( .IN(n235), .Q(n464) );
  AOINVX1 U318 ( .IN(outSig[0]), .QN(n202) );
  AOINVX2 U319 ( .IN(n412), .QN(n451) );
  AOINVX1 U320 ( .IN(reset), .QN(n235) );
  AOBUFX1 U321 ( .IN(n82), .Q(n459) );
  AOINVX1 U322 ( .IN(outSig[1]), .QN(n200) );
  AOINVX1 U323 ( .IN(enSig[1]), .QN(n137) );
  AOINVX2 U324 ( .IN(n413), .QN(n452) );
  AOBUFX1 U325 ( .IN(n139), .Q(n453) );
  AOINVX1 U326 ( .IN(enSig[0]), .QN(n156) );
  AOBUFX1 U327 ( .IN(n120), .Q(n455) );
  AOBUFX1 U328 ( .IN(n101), .Q(n457) );
  AOINVX1 U329 ( .IN(n284), .QN(n117) );
  AOINVX1 U330 ( .IN(n291), .QN(n110) );
  AOINVX1 U331 ( .IN(n292), .QN(n109) );
  AOINVX1 U332 ( .IN(n293), .QN(n108) );
  AOINVX1 U333 ( .IN(n294), .QN(n107) );
  AOINVX1 U334 ( .IN(n295), .QN(n106) );
  AOINVX1 U335 ( .IN(n296), .QN(n105) );
  AOINVX1 U336 ( .IN(n297), .QN(n104) );
  AOINVX1 U337 ( .IN(n298), .QN(n103) );
  AOINVX1 U338 ( .IN(n299), .QN(n102) );
  AOINVX1 U339 ( .IN(n285), .QN(n116) );
  AOINVX1 U340 ( .IN(n286), .QN(n115) );
  AOINVX1 U341 ( .IN(n287), .QN(n114) );
  AOINVX1 U342 ( .IN(n288), .QN(n113) );
  AOINVX1 U343 ( .IN(n289), .QN(n112) );
  AOINVX1 U344 ( .IN(n290), .QN(n111) );
  AOINVX1 U345 ( .IN(n300), .QN(n98) );
  AOINVX1 U346 ( .IN(n307), .QN(n91) );
  AOINVX1 U347 ( .IN(n308), .QN(n90) );
  AOINVX1 U348 ( .IN(n309), .QN(n89) );
  AOINVX1 U349 ( .IN(n310), .QN(n88) );
  AOINVX1 U350 ( .IN(n311), .QN(n87) );
  AOINVX1 U351 ( .IN(n312), .QN(n86) );
  AOINVX1 U352 ( .IN(n313), .QN(n85) );
  AOINVX1 U353 ( .IN(n314), .QN(n84) );
  AOINVX1 U354 ( .IN(n315), .QN(n83) );
  AOINVX1 U355 ( .IN(n301), .QN(n97) );
  AOINVX1 U356 ( .IN(n302), .QN(n96) );
  AOINVX1 U357 ( .IN(n303), .QN(n95) );
  AOINVX1 U358 ( .IN(n304), .QN(n94) );
  AOINVX1 U359 ( .IN(n305), .QN(n93) );
  AOINVX1 U360 ( .IN(n306), .QN(n92) );
  AOINVX1 U361 ( .IN(n268), .QN(n136) );
  AOINVX1 U362 ( .IN(n275), .QN(n129) );
  AOINVX1 U363 ( .IN(n276), .QN(n128) );
  AOINVX1 U364 ( .IN(n277), .QN(n127) );
  AOINVX1 U365 ( .IN(n278), .QN(n126) );
  AOINVX1 U366 ( .IN(n279), .QN(n125) );
  AOINVX1 U367 ( .IN(n280), .QN(n124) );
  AOINVX1 U368 ( .IN(n281), .QN(n123) );
  AOINVX1 U369 ( .IN(n282), .QN(n122) );
  AOINVX1 U370 ( .IN(n283), .QN(n121) );
  AOINVX1 U371 ( .IN(n269), .QN(n135) );
  AOINVX1 U372 ( .IN(n270), .QN(n134) );
  AOINVX1 U373 ( .IN(n271), .QN(n133) );
  AOINVX1 U374 ( .IN(n272), .QN(n132) );
  AOINVX1 U375 ( .IN(n273), .QN(n131) );
  AOINVX1 U376 ( .IN(n274), .QN(n130) );
  AOINVX1 U377 ( .IN(n252), .QN(n155) );
  AOINVX1 U378 ( .IN(n259), .QN(n148) );
  AOINVX1 U379 ( .IN(n260), .QN(n147) );
  AOINVX1 U380 ( .IN(n261), .QN(n146) );
  AOINVX1 U381 ( .IN(n262), .QN(n145) );
  AOINVX1 U382 ( .IN(n263), .QN(n144) );
  AOINVX1 U383 ( .IN(n264), .QN(n143) );
  AOINVX1 U384 ( .IN(n265), .QN(n142) );
  AOINVX1 U385 ( .IN(n266), .QN(n141) );
  AOINVX1 U386 ( .IN(n267), .QN(n140) );
  AOINVX1 U387 ( .IN(n253), .QN(n154) );
  AOINVX1 U388 ( .IN(n254), .QN(n153) );
  AOINVX1 U389 ( .IN(n255), .QN(n152) );
  AOINVX1 U390 ( .IN(n256), .QN(n151) );
  AOINVX1 U391 ( .IN(n257), .QN(n150) );
  AOINVX1 U392 ( .IN(n258), .QN(n149) );
endmodule




