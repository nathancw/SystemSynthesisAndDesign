
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
         N120, N122, N124, N126, N130, N132, N134, N136, N138, N140, N143, n27,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n1;
  wire   [3:0] next_state;
  wire   [3:0] pres_state;

  LATCHX2 \next_state_reg[0]  ( .CLK(N58), .D(N55), .Q(next_state[0]) );
  DFFASX2 \pres_state_reg[0]  ( .D(n73), .CLK(clk), .SETB(n27), .Q(
        pres_state[0]) );
  LATCHX2 \next_state_reg[2]  ( .CLK(N58), .D(N57), .Q(next_state[2]) );
  DFFASX2 \pres_state_reg[2]  ( .D(n70), .CLK(clk), .SETB(n27), .Q(
        pres_state[2]), .QN(n38) );
  LATCHX2 \next_state_reg[1]  ( .CLK(N58), .D(N56), .Q(next_state[1]) );
  DFFASX2 \pres_state_reg[1]  ( .D(n72), .CLK(clk), .SETB(n27), .Q(
        pres_state[1]), .QN(n39) );
  LATCHX2 \next_state_reg[3]  ( .CLK(N58), .D(N59), .Q(next_state[3]) );
  DFFARX2 \pres_state_reg[3]  ( .D(n71), .CLK(clk), .RSTB(n27), .Q(
        pres_state[3]), .QN(n34) );
  LATCHX2 aluOutRegIn_reg ( .CLK(N143), .D(n32), .Q(aluOutRegIn) );
  LATCHX2 aluOutRegOut_reg ( .CLK(N143), .D(n35), .Q(aluOutRegOut) );
  LATCHX2 incr_reg ( .CLK(N143), .D(n36), .Q(incr) );
  LATCHX2 \regIn_reg[5]  ( .CLK(n1), .D(N140), .Q(regIn[5]) );
  LATCHX2 \regIn_reg[4]  ( .CLK(n1), .D(N138), .Q(regIn[4]) );
  LATCHX2 \regIn_reg[3]  ( .CLK(n1), .D(N136), .Q(regIn[3]) );
  LATCHX2 \regIn_reg[2]  ( .CLK(n1), .D(N134), .Q(regIn[2]) );
  LATCHX2 \regIn_reg[1]  ( .CLK(n1), .D(N132), .Q(regIn[1]) );
  LATCHX2 \regIn_reg[0]  ( .CLK(n1), .D(N130), .Q(regIn[0]) );
  LATCHX2 fetch_reg ( .CLK(n1), .D(n35), .Q(fetch) );
  LATCHX2 \paraOut_reg[5]  ( .CLK(N143), .D(N115), .Q(paraOut[5]) );
  LATCHX2 \paraOut_reg[4]  ( .CLK(N143), .D(N113), .Q(paraOut[4]) );
  LATCHX2 \paraOut_reg[3]  ( .CLK(N143), .D(N111), .Q(paraOut[3]) );
  LATCHX2 \paraOut_reg[2]  ( .CLK(N143), .D(N109), .Q(paraOut[2]) );
  LATCHX2 \paraOut_reg[1]  ( .CLK(N143), .D(N107), .Q(paraOut[1]) );
  LATCHX2 \paraOut_reg[0]  ( .CLK(N143), .D(N105), .Q(paraOut[0]) );
  LATCHX2 aluIn1_reg ( .CLK(n1), .D(N117), .Q(aluIn1) );
  LATCHX2 aluIn2_reg ( .CLK(n1), .D(n31), .Q(aluIn2) );
  LATCHX2 \control_reg[3]  ( .CLK(n1), .D(N126), .Q(control[3]) );
  LATCHX2 \control_reg[2]  ( .CLK(n1), .D(N124), .Q(control[2]) );
  LATCHX2 \control_reg[1]  ( .CLK(n1), .D(N122), .Q(control[1]) );
  LATCHX2 \control_reg[0]  ( .CLK(n1), .D(N120), .Q(control[0]) );
  NAND4X0 U59 ( .IN1(n51), .IN2(n52), .IN3(n53), .IN4(n54), .QN(N58) );
  NAND4X0 U60 ( .IN1(n58), .IN2(n56), .IN3(n55), .IN4(n59), .QN(N55) );
  AO221X2 U61 ( .IN1(para1[5]), .IN2(n64), .IN3(para2[5]), .IN4(n65), .IN5(n66), .Q(N115) );
  AO221X2 U62 ( .IN1(para1[4]), .IN2(n64), .IN3(para2[4]), .IN4(n65), .IN5(n66), .Q(N113) );
  AO221X2 U63 ( .IN1(para1[3]), .IN2(n64), .IN3(para2[3]), .IN4(n65), .IN5(n66), .Q(N111) );
  AO221X2 U64 ( .IN1(para1[2]), .IN2(n64), .IN3(para2[2]), .IN4(n65), .IN5(n66), .Q(N109) );
  AO221X2 U65 ( .IN1(para1[1]), .IN2(n64), .IN3(para2[1]), .IN4(n65), .IN5(n66), .Q(N107) );
  AO221X2 U66 ( .IN1(para1[0]), .IN2(n64), .IN3(para2[0]), .IN4(n65), .IN5(n66), .Q(N105) );
  NAND4X0 U67 ( .IN1(n30), .IN2(n58), .IN3(n49), .IN4(n47), .QN(N143) );
  AOBUFX1 U3 ( .IN(N143), .Q(n1) );
  NAND2X0 U4 ( .IN1(n37), .IN2(n33), .QN(n50) );
  NOR2X1 U5 ( .IN1(n32), .IN2(n35), .QN(n51) );
  NAND2X0 U6 ( .IN1(n49), .IN2(n50), .QN(N59) );
  AND2X1 U7 ( .IN1(n61), .IN2(n51), .Q(n67) );
  AOINVX1 U8 ( .IN(n49), .QN(n36) );
  AOINVX1 U9 ( .IN(n52), .QN(n33) );
  AOINVX1 U10 ( .IN(n62), .QN(n30) );
  AND2X1 U11 ( .IN1(n55), .IN2(n56), .Q(n53) );
  NAND2X0 U12 ( .IN1(n67), .IN2(n47), .QN(n66) );
  NAND2X0 U13 ( .IN1(n48), .IN2(n50), .QN(n65) );
  NAND2X0 U14 ( .IN1(n68), .IN2(n37), .QN(n49) );
  NAND2X0 U15 ( .IN1(n67), .IN2(n48), .QN(n62) );
  AND4X1 U16 ( .IN1(n61), .IN2(n62), .IN3(n48), .IN4(n63), .Q(n60) );
  AND2X1 U17 ( .IN1(n57), .IN2(n55), .Q(n61) );
  ISOLORX2 U18 ( .D(n36), .ISO(N117), .Q(n64) );
  NAND2X0 U19 ( .IN1(n57), .IN2(n51), .QN(N57) );
  AOINVX1 U20 ( .IN(n54), .QN(n37) );
  ISOLANDX1 U21 ( .D(n50), .ISO(N117), .Q(n58) );
  NAND3X0 U22 ( .IN1(n55), .IN2(n48), .IN3(n51), .QN(N56) );
  AOINVX1 U23 ( .IN(n59), .QN(n35) );
  AOINVX1 U24 ( .IN(n63), .QN(n32) );
  AOINVX1 U25 ( .IN(n48), .QN(n31) );
  NOR2X1 U26 ( .IN1(start), .IN2(n47), .QN(n46) );
  ISOLORX2 U27 ( .D(n46), .ISO(next_state[1]), .Q(n72) );
  ISOLORX2 U28 ( .D(n46), .ISO(next_state[2]), .Q(n70) );
  ISOLORX2 U29 ( .D(n46), .ISO(next_state[0]), .Q(n73) );
  ISOLANDX1 U30 ( .D(next_state[3]), .ISO(n46), .Q(n71) );
  NAND2X0 U31 ( .IN1(pres_state[0]), .IN2(n34), .QN(n52) );
  NAND3X0 U32 ( .IN1(pres_state[1]), .IN2(n33), .IN3(pres_state[2]), .QN(n47)
         );
  AOINVX1 U33 ( .IN(reset), .QN(n27) );
  NAND2X0 U34 ( .IN1(n38), .IN2(n39), .QN(n54) );
  NOR2X1 U35 ( .IN1(pres_state[3]), .IN2(pres_state[0]), .QN(n68) );
  NAND3X0 U36 ( .IN1(n37), .IN2(pres_state[0]), .IN3(pres_state[3]), .QN(n48)
         );
  NAND2X0 U37 ( .IN1(n60), .IN2(n45), .QN(N130) );
  AOINVX1 U38 ( .IN(para1[0]), .QN(n45) );
  NAND2X0 U39 ( .IN1(n60), .IN2(n44), .QN(N132) );
  AOINVX1 U40 ( .IN(para1[1]), .QN(n44) );
  NAND2X0 U41 ( .IN1(n60), .IN2(n43), .QN(N134) );
  AOINVX1 U42 ( .IN(para1[2]), .QN(n43) );
  NAND2X0 U43 ( .IN1(n60), .IN2(n42), .QN(N136) );
  AOINVX1 U44 ( .IN(para1[3]), .QN(n42) );
  NAND2X0 U45 ( .IN1(n60), .IN2(n41), .QN(N138) );
  AOINVX1 U46 ( .IN(para1[4]), .QN(n41) );
  NAND2X0 U47 ( .IN1(n60), .IN2(n40), .QN(N140) );
  AOINVX1 U48 ( .IN(para1[5]), .QN(n40) );
  NAND3X0 U49 ( .IN1(pres_state[2]), .IN2(pres_state[1]), .IN3(n68), .QN(n59)
         );
  NAND3X0 U50 ( .IN1(n33), .IN2(n39), .IN3(pres_state[2]), .QN(n63) );
  NAND3X0 U51 ( .IN1(pres_state[1]), .IN2(n38), .IN3(n68), .QN(n55) );
  NAND3X0 U52 ( .IN1(pres_state[2]), .IN2(n39), .IN3(n68), .QN(n56) );
  NOR3X0 U53 ( .IN1(n54), .IN2(pres_state[0]), .IN3(n34), .QN(N117) );
  AND2X1 U54 ( .IN1(n56), .IN2(n69), .Q(n57) );
  NAND3X0 U55 ( .IN1(n33), .IN2(n38), .IN3(pres_state[1]), .QN(n69) );
  ISOLANDX1 U56 ( .D(opCode[0]), .ISO(n61), .Q(N120) );
  ISOLANDX1 U57 ( .D(opCode[1]), .ISO(n61), .Q(N122) );
  ISOLANDX1 U58 ( .D(opCode[2]), .ISO(n61), .Q(N124) );
  ISOLANDX1 U68 ( .D(opCode[3]), .ISO(n61), .Q(N126) );
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


module LOAD_FSM100 ( clk, reset, start, opCode, para1, para2, MFC, address, 
        marIn, MemEN, marOut, RW, readFromMem, outToBus, readFromBus, outToMem, 
        regIn, regOut, incr, fetch );
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
         N797, N798, N799, N811, N813, N815, N817, N819, N821, N822, N855,
         N861, N863, N867, N871, N873, N875, N877, N879, N881, N883, N885,
         N887, N889, N891, N893, N895, N898, N899, N901, N904, N907, N910,
         N913, N916, N919, N922, N925, N928, N930, N931, N933, N934, N936,
         N937, N939, N940, N942, N943, N945, N946, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n164, n165, n166, n167, n176, n177, n178, n179, n1, n2, n3, n4,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
;
  wire   [3:0] pres_state;
  wire   [15:0] addressStore;
  tri   [15:0] address;

  DFFASX2 \pres_state_reg[0]  ( .D(n179), .CLK(clk), .SETB(n164), .Q(
        pres_state[0]) );
  DFFARX2 \pres_state_reg[3]  ( .D(n178), .CLK(clk), .RSTB(n164), .Q(
        pres_state[3]) );
  DFFASX2 \pres_state_reg[2]  ( .D(n177), .CLK(clk), .SETB(n164), .Q(
        pres_state[2]) );
  DFFARX2 \pres_state_reg[1]  ( .D(n176), .CLK(clk), .RSTB(n164), .Q(
        pres_state[1]) );
  LATCHX2 incr_reg ( .CLK(n19), .D(n165), .Q(incr) );
  LATCHX2 fetch_reg ( .CLK(n19), .D(N899), .Q(fetch) );
  LATCHX2 \addressStore_reg[5]  ( .CLK(N798), .D(N799), .Q(addressStore[5]) );
  LATCHX2 \addressStore_reg[4]  ( .CLK(N798), .D(N797), .Q(addressStore[4]) );
  LATCHX2 \addressStore_reg[3]  ( .CLK(N798), .D(N795), .Q(addressStore[3]) );
  LATCHX2 \addressStore_reg[2]  ( .CLK(N798), .D(N793), .Q(addressStore[2]) );
  LATCHX2 \addressStore_reg[1]  ( .CLK(N798), .D(N791), .Q(addressStore[1]) );
  LATCHX2 \addressStore_reg[0]  ( .CLK(N798), .D(N789), .Q(addressStore[0]) );
  LATCHX2 \regStore_reg[5]  ( .CLK(N822), .D(N821), .Q(n42) );
  LATCHX2 \regOut_reg[5]  ( .CLK(n20), .D(N895), .Q(regOut[5]) );
  LATCHX2 \regIn_reg[5]  ( .CLK(N898), .D(N883), .Q(regIn[5]) );
  LATCHX2 \regStore_reg[4]  ( .CLK(N822), .D(N819), .Q(n43) );
  LATCHX2 \regOut_reg[4]  ( .CLK(n20), .D(N893), .Q(regOut[4]) );
  LATCHX2 \regIn_reg[4]  ( .CLK(n19), .D(N881), .Q(regIn[4]) );
  LATCHX2 \regStore_reg[3]  ( .CLK(N822), .D(N817), .Q(n44) );
  LATCHX2 \regOut_reg[3]  ( .CLK(n20), .D(N891), .Q(regOut[3]) );
  LATCHX2 \regIn_reg[3]  ( .CLK(n19), .D(N879), .Q(regIn[3]) );
  LATCHX2 \regStore_reg[2]  ( .CLK(N822), .D(N815), .Q(n45) );
  LATCHX2 \regOut_reg[2]  ( .CLK(n20), .D(N889), .Q(regOut[2]) );
  LATCHX2 \regIn_reg[2]  ( .CLK(n20), .D(N877), .Q(regIn[2]) );
  LATCHX2 \regStore_reg[1]  ( .CLK(N822), .D(N813), .Q(n46) );
  LATCHX2 \regOut_reg[1]  ( .CLK(N898), .D(N887), .Q(regOut[1]) );
  LATCHX2 \regIn_reg[1]  ( .CLK(n19), .D(N875), .Q(regIn[1]) );
  LATCHX2 \regStore_reg[0]  ( .CLK(N822), .D(N811), .Q(n47) );
  LATCHX2 \regOut_reg[0]  ( .CLK(n19), .D(N885), .Q(regOut[0]) );
  LATCHX2 \regIn_reg[0]  ( .CLK(N898), .D(N873), .Q(regIn[0]) );
  LATCHX2 RWstore_reg ( .CLK(N822), .D(n18), .Q(RWstore), .QN(n48) );
  LATCHX2 \address_tri_enable_reg[15]  ( .CLK(N898), .D(N855), .Q(N901), .QN(
        n120) );
  LATCHX2 \address_tri_enable_reg[14]  ( .CLK(n19), .D(N855), .Q(N904), .QN(
        n121) );
  LATCHX2 \address_tri_enable_reg[13]  ( .CLK(N898), .D(N855), .Q(N907), .QN(
        n122) );
  LATCHX2 \address_tri_enable_reg[12]  ( .CLK(n19), .D(N855), .Q(N910), .QN(
        n123) );
  LATCHX2 \address_tri_enable_reg[11]  ( .CLK(N898), .D(N855), .Q(N913), .QN(
        n124) );
  LATCHX2 \address_tri_enable_reg[10]  ( .CLK(N898), .D(N855), .Q(N916), .QN(
        n125) );
  LATCHX2 \address_tri_enable_reg[9]  ( .CLK(n19), .D(N855), .Q(N919), .QN(
        n126) );
  LATCHX2 \address_tri_enable_reg[8]  ( .CLK(N898), .D(N855), .Q(N922), .QN(
        n127) );
  LATCHX2 \address_tri_enable_reg[7]  ( .CLK(n19), .D(N855), .Q(N925), .QN(
        n128) );
  LATCHX2 \address_tri_enable_reg[6]  ( .CLK(n19), .D(N855), .Q(N928), .QN(
        n129) );
  LATCHX2 \address_reg[5]  ( .CLK(N898), .D(N228), .Q(N930) );
  LATCHX2 \address_tri_enable_reg[5]  ( .CLK(n20), .D(N855), .Q(N931), .QN(
        n130) );
  LATCHX2 \address_reg[4]  ( .CLK(n19), .D(N226), .Q(N933) );
  LATCHX2 \address_tri_enable_reg[4]  ( .CLK(n19), .D(N855), .Q(N934), .QN(
        n131) );
  LATCHX2 \address_reg[3]  ( .CLK(n20), .D(N224), .Q(N936) );
  LATCHX2 \address_tri_enable_reg[3]  ( .CLK(n19), .D(N855), .Q(N937), .QN(
        n132) );
  LATCHX2 \address_reg[2]  ( .CLK(n20), .D(N222), .Q(N939) );
  LATCHX2 \address_tri_enable_reg[2]  ( .CLK(n19), .D(N855), .Q(N940), .QN(
        n133) );
  LATCHX2 \address_reg[1]  ( .CLK(n19), .D(N220), .Q(N942) );
  LATCHX2 \address_tri_enable_reg[1]  ( .CLK(n20), .D(N855), .Q(N943), .QN(
        n134) );
  LATCHX2 \address_reg[0]  ( .CLK(N898), .D(N218), .Q(N945) );
  LATCHX2 \address_tri_enable_reg[0]  ( .CLK(n19), .D(N855), .Q(N946), .QN(
        n135) );
  LATCHX2 marIn_reg ( .CLK(n20), .D(n165), .Q(marIn) );
  LATCHX2 MemEN_reg ( .CLK(n20), .D(N861), .Q(MemEN) );
  LATCHX2 marOut_reg ( .CLK(n20), .D(N861), .Q(marOut) );
  LATCHX2 RW_reg ( .CLK(n20), .D(N863), .Q(RW) );
  LATCHX2 readFromMem_reg ( .CLK(n20), .D(n167), .Q(readFromMem) );
  LATCHX2 outToBus_reg ( .CLK(n20), .D(N867), .Q(outToBus) );
  LATCHX2 readFromBus_reg ( .CLK(n20), .D(n166), .Q(readFromBus) );
  LATCHX2 outToMem_reg ( .CLK(n20), .D(N871), .Q(outToMem) );
  TNBUFFHX8 \address_tri[0]  ( .IN(n15), .ENB(n135), .Q(address[0]) );
  TNBUFFHX8 \address_tri[1]  ( .IN(n13), .ENB(n134), .Q(address[1]) );
  TNBUFFHX8 \address_tri[2]  ( .IN(n11), .ENB(n133), .Q(address[2]) );
  TNBUFFHX8 \address_tri[3]  ( .IN(n9), .ENB(n132), .Q(address[3]) );
  TNBUFFHX8 \address_tri[4]  ( .IN(n7), .ENB(n131), .Q(address[4]) );
  TNBUFFHX8 \address_tri[5]  ( .IN(n4), .ENB(n130), .Q(address[5]) );
  TNBUFFHX8 \address_tri[6]  ( .IN(1'b0), .ENB(n129), .Q(address[6]) );
  TNBUFFHX8 \address_tri[7]  ( .IN(1'b0), .ENB(n128), .Q(address[7]) );
  TNBUFFHX8 \address_tri[8]  ( .IN(1'b0), .ENB(n127), .Q(address[8]) );
  TNBUFFHX8 \address_tri[9]  ( .IN(1'b0), .ENB(n126), .Q(address[9]) );
  TNBUFFHX8 \address_tri[10]  ( .IN(1'b0), .ENB(n125), .Q(address[10]) );
  TNBUFFHX8 \address_tri[11]  ( .IN(1'b0), .ENB(n124), .Q(address[11]) );
  TNBUFFHX8 \address_tri[12]  ( .IN(1'b0), .ENB(n123), .Q(address[12]) );
  TNBUFFHX8 \address_tri[13]  ( .IN(1'b0), .ENB(n122), .Q(address[13]) );
  TNBUFFHX8 \address_tri[14]  ( .IN(1'b0), .ENB(n121), .Q(address[14]) );
  TNBUFFHX8 \address_tri[15]  ( .IN(1'b0), .ENB(n120), .Q(address[15]) );
  NAND4X0 U6 ( .IN1(n51), .IN2(n52), .IN3(n53), .IN4(n54), .QN(n176) );
  NAND2X0 U7 ( .IN1(n165), .IN2(n55), .QN(n52) );
  AO22X2 U8 ( .IN1(n56), .IN2(pres_state[2]), .IN3(n57), .IN4(n58), .Q(n177)
         );
  AO221X2 U9 ( .IN1(n59), .IN2(n55), .IN3(pres_state[3]), .IN4(pres_state[1]), 
        .IN5(n60), .Q(n57) );
  NAND4X0 U10 ( .IN1(n61), .IN2(n62), .IN3(n53), .IN4(n63), .QN(n178) );
  OA21X1 U11 ( .IN1(n56), .IN2(n64), .IN3(n65), .Q(n63) );
  OA21X1 U12 ( .IN1(n66), .IN2(n67), .IN3(n50), .Q(n64) );
  AO221X2 U13 ( .IN1(n56), .IN2(pres_state[0]), .IN3(n68), .IN4(n58), .IN5(n69), .Q(n179) );
  NAND4X0 U14 ( .IN1(n67), .IN2(n70), .IN3(n49), .IN4(n71), .QN(n68) );
  NAND4X0 U16 ( .IN1(n51), .IN2(n72), .IN3(n73), .IN4(n50), .QN(n60) );
  NAND3X0 U17 ( .IN1(n74), .IN2(n75), .IN3(n76), .QN(n73) );
  NAND3X0 U18 ( .IN1(pres_state[2]), .IN2(n77), .IN3(pres_state[1]), .QN(n72)
         );
  NOR2X1 U19 ( .IN1(n165), .IN2(n59), .QN(n67) );
  NOR3X0 U20 ( .IN1(n78), .IN2(n69), .IN3(n58), .QN(n56) );
  AO22X2 U21 ( .IN1(n79), .IN2(n80), .IN3(MFC), .IN4(n59), .Q(n58) );
  NAND4X0 U24 ( .IN1(opCode[2]), .IN2(n81), .IN3(start), .IN4(n82), .QN(n62)
         );
  NOR3X0 U25 ( .IN1(n83), .IN2(opCode[1]), .IN3(opCode[0]), .QN(n82) );
  NAND3X0 U28 ( .IN1(start), .IN2(n81), .IN3(n66), .QN(n65) );
  NAND4X0 U30 ( .IN1(opCode[3]), .IN2(opCode[1]), .IN3(opCode[0]), .IN4(n84), 
        .QN(n55) );
  NAND3X0 U33 ( .IN1(n86), .IN2(n87), .IN3(n51), .QN(N898) );
  NAND2X0 U35 ( .IN1(n88), .IN2(n89), .QN(N895) );
  NAND2X0 U36 ( .IN1(n90), .IN2(n89), .QN(N893) );
  NAND2X0 U37 ( .IN1(n91), .IN2(n89), .QN(N891) );
  NAND2X0 U38 ( .IN1(n92), .IN2(n89), .QN(N889) );
  NAND2X0 U39 ( .IN1(n93), .IN2(n89), .QN(N887) );
  NAND2X0 U40 ( .IN1(n94), .IN2(n89), .QN(N885) );
  NAND2X0 U41 ( .IN1(n95), .IN2(n88), .QN(N883) );
  NAND2X0 U43 ( .IN1(n95), .IN2(n90), .QN(N881) );
  NAND2X0 U45 ( .IN1(n95), .IN2(n91), .QN(N879) );
  NAND2X0 U47 ( .IN1(n95), .IN2(n92), .QN(N877) );
  NAND2X0 U49 ( .IN1(n95), .IN2(n93), .QN(N875) );
  NAND2X0 U51 ( .IN1(n95), .IN2(n94), .QN(N873) );
  NAND2X0 U54 ( .IN1(n97), .IN2(n54), .QN(N871) );
  NAND2X0 U55 ( .IN1(n53), .IN2(n96), .QN(N867) );
  NOR2X1 U56 ( .IN1(n48), .IN2(n54), .QN(N863) );
  NOR3X0 U58 ( .IN1(n89), .IN2(n99), .IN3(n81), .QN(n98) );
  NAND2X0 U60 ( .IN1(n100), .IN2(n101), .QN(n53) );
  NAND2X0 U61 ( .IN1(n49), .IN2(n61), .QN(n89) );
  NAND3X0 U62 ( .IN1(pres_state[3]), .IN2(pres_state[1]), .IN3(n102), .QN(n61)
         );
  NAND3X0 U63 ( .IN1(pres_state[2]), .IN2(n77), .IN3(n100), .QN(n49) );
  NAND2X0 U64 ( .IN1(n102), .IN2(n103), .QN(n50) );
  NAND2X0 U66 ( .IN1(n96), .IN2(n97), .QN(N899) );
  NAND3X0 U67 ( .IN1(n101), .IN2(pres_state[1]), .IN3(pres_state[3]), .QN(n97)
         );
  NAND3X0 U68 ( .IN1(pres_state[3]), .IN2(pres_state[1]), .IN3(n104), .QN(n96)
         );
  NAND2X0 U70 ( .IN1(n80), .IN2(n105), .QN(N861) );
  NAND3X0 U71 ( .IN1(n74), .IN2(n75), .IN3(n102), .QN(n105) );
  NAND2X0 U73 ( .IN1(n104), .IN2(n103), .QN(n80) );
  NAND2X0 U74 ( .IN1(n18), .IN2(n106), .QN(N822) );
  AO22X2 U75 ( .IN1(para2[5]), .IN2(n18), .IN3(para1[5]), .IN4(n107), .Q(N821)
         );
  AO22X2 U76 ( .IN1(para2[4]), .IN2(n18), .IN3(para1[4]), .IN4(n17), .Q(N819)
         );
  AO22X2 U77 ( .IN1(para2[3]), .IN2(n18), .IN3(para1[3]), .IN4(n17), .Q(N817)
         );
  AO22X2 U78 ( .IN1(para2[2]), .IN2(n18), .IN3(para1[2]), .IN4(n107), .Q(N815)
         );
  AO22X2 U79 ( .IN1(para2[1]), .IN2(n18), .IN3(para1[1]), .IN4(n107), .Q(N813)
         );
  AO22X2 U80 ( .IN1(para2[0]), .IN2(n18), .IN3(para1[0]), .IN4(n17), .Q(N811)
         );
  AO22X2 U81 ( .IN1(para1[5]), .IN2(n18), .IN3(para2[5]), .IN4(n17), .Q(N799)
         );
  NAND2X0 U82 ( .IN1(n51), .IN2(n79), .QN(N798) );
  ISOLANDX1 U83 ( .D(n106), .ISO(n17), .Q(n51) );
  NAND2X0 U84 ( .IN1(n104), .IN2(n100), .QN(n106) );
  NOR2X1 U85 ( .IN1(pres_state[2]), .IN2(pres_state[0]), .QN(n104) );
  AO22X2 U86 ( .IN1(para1[4]), .IN2(n18), .IN3(para2[4]), .IN4(n107), .Q(N797)
         );
  AO22X2 U87 ( .IN1(para1[3]), .IN2(n18), .IN3(para2[3]), .IN4(n107), .Q(N795)
         );
  AO22X2 U88 ( .IN1(para1[2]), .IN2(n18), .IN3(para2[2]), .IN4(n17), .Q(N793)
         );
  AO22X2 U89 ( .IN1(para1[1]), .IN2(n18), .IN3(para2[1]), .IN4(n17), .Q(N791)
         );
  AO22X2 U90 ( .IN1(para1[0]), .IN2(n18), .IN3(para2[0]), .IN4(n107), .Q(N789)
         );
  NAND3X0 U93 ( .IN1(n74), .IN2(n75), .IN3(n101), .QN(n79) );
  AO222X2 U94 ( .IN1(para2[5]), .IN2(n107), .IN3(n108), .IN4(para1[5]), .IN5(
        n165), .IN6(addressStore[5]), .Q(N228) );
  AO222X2 U95 ( .IN1(para2[4]), .IN2(n17), .IN3(n108), .IN4(para1[4]), .IN5(
        n165), .IN6(addressStore[4]), .Q(N226) );
  AO222X2 U96 ( .IN1(para2[3]), .IN2(n17), .IN3(n108), .IN4(para1[3]), .IN5(
        n165), .IN6(addressStore[3]), .Q(N224) );
  AO222X2 U97 ( .IN1(para2[2]), .IN2(n107), .IN3(n108), .IN4(para1[2]), .IN5(
        n165), .IN6(addressStore[2]), .Q(N222) );
  AO222X2 U98 ( .IN1(para2[1]), .IN2(n107), .IN3(n108), .IN4(para1[1]), .IN5(
        n165), .IN6(addressStore[1]), .Q(N220) );
  AO222X2 U99 ( .IN1(para2[0]), .IN2(n17), .IN3(n108), .IN4(para1[0]), .IN5(
        n165), .IN6(addressStore[0]), .Q(N218) );
  NOR2X1 U100 ( .IN1(n107), .IN2(n165), .QN(n108) );
  NAND2X0 U102 ( .IN1(n101), .IN2(n103), .QN(n86) );
  NOR2X1 U103 ( .IN1(n74), .IN2(pres_state[3]), .QN(n103) );
  NOR2X1 U105 ( .IN1(n109), .IN2(n77), .QN(n101) );
  ISOLANDX1 U107 ( .D(n100), .ISO(n76), .Q(n107) );
  NAND2X0 U108 ( .IN1(pres_state[0]), .IN2(n109), .QN(n76) );
  NOR2X1 U110 ( .IN1(n75), .IN2(pres_state[1]), .QN(n100) );
  AND4X1 U3 ( .IN1(n54), .IN2(n71), .IN3(n50), .IN4(n98), .Q(n1) );
  INVX0 U4 ( .IN(n1), .QN(N855) );
  ISOLORX2 U5 ( .D(n81), .ISO(n17), .Q(n2) );
  AOINVX1 U15 ( .IN(N930), .QN(n3) );
  INVX8 U22 ( .IN(n3), .QN(n4) );
  AOINVX1 U23 ( .IN(N933), .QN(n6) );
  INVX8 U26 ( .IN(n6), .QN(n7) );
  AOINVX1 U27 ( .IN(N936), .QN(n8) );
  INVX8 U29 ( .IN(n8), .QN(n9) );
  AOINVX1 U31 ( .IN(N939), .QN(n10) );
  INVX8 U34 ( .IN(n10), .QN(n11) );
  AOINVX1 U42 ( .IN(N942), .QN(n12) );
  INVX8 U44 ( .IN(n12), .QN(n13) );
  AOINVX1 U46 ( .IN(N945), .QN(n14) );
  INVX8 U48 ( .IN(n14), .QN(n15) );
  AOBUFX1 U50 ( .IN(N898), .Q(n20) );
  AOINVX2 U52 ( .IN(n2), .QN(n18) );
  AOBUFX1 U53 ( .IN(N898), .Q(n19) );
  AOINVX1 U57 ( .IN(n79), .QN(n81) );
  AOINVX1 U59 ( .IN(N861), .QN(n54) );
  AOINVX1 U65 ( .IN(n80), .QN(n59) );
  AOINVX1 U69 ( .IN(N899), .QN(n71) );
  AOINVX1 U72 ( .IN(n16), .QN(n17) );
  AOINVX1 U91 ( .IN(n86), .QN(n165) );
  AOINVX1 U92 ( .IN(N855), .QN(n87) );
  AOINVX1 U101 ( .IN(n50), .QN(n167) );
  AOINVX1 U104 ( .IN(n53), .QN(n99) );
  AOINVX1 U106 ( .IN(n65), .QN(n78) );
  AOINVX1 U109 ( .IN(n62), .QN(n69) );
  AOINVX1 U111 ( .IN(n55), .QN(n66) );
  AOINVX1 U112 ( .IN(n76), .QN(n102) );
  AOINVX1 U113 ( .IN(n107), .QN(n16) );
  AOINVX1 U114 ( .IN(n96), .QN(n95) );
  AOINVX1 U115 ( .IN(n49), .QN(n166) );
  AOINVX1 U116 ( .IN(opCode[3]), .QN(n83) );
  AOINVX1 U117 ( .IN(n60), .QN(n70) );
  AOINVX1 U118 ( .IN(opCode[2]), .QN(n84) );
  AOINVX1 U119 ( .IN(pres_state[3]), .QN(n75) );
  AOINVX1 U120 ( .IN(pres_state[1]), .QN(n74) );
  AOINVX1 U121 ( .IN(pres_state[0]), .QN(n77) );
  AOINVX1 U122 ( .IN(pres_state[2]), .QN(n109) );
  AOINVX1 U123 ( .IN(reset), .QN(n164) );
  AOINVX1 U124 ( .IN(n47), .QN(n94) );
  AOINVX1 U125 ( .IN(n46), .QN(n93) );
  AOINVX1 U126 ( .IN(n45), .QN(n92) );
  AOINVX1 U127 ( .IN(n44), .QN(n91) );
  AOINVX1 U128 ( .IN(n43), .QN(n90) );
  AOINVX1 U129 ( .IN(n42), .QN(n88) );
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

