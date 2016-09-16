
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

