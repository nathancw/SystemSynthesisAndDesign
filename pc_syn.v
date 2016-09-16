
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

