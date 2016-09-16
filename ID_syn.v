
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

