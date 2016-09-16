
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

