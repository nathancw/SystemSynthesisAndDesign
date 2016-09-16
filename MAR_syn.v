
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

