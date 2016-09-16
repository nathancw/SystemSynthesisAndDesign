
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

