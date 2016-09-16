
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

