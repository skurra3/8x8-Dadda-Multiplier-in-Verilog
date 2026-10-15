`timescale 1ns/1ps

//half adder
module HA (
    input x,
    input y,
    output s,
    output c
    ); 
    
    xor (s, x, y);
    and (c, x, y);
    
endmodule
    
//Full adder  
module FA(
    input x,
    input y,
    input cin,
    output s,
    output cout
    );
    
    wire w1, w2, w3;

    xor (s, x, y, cin);
    and (w1, x, y);
    and (w2, x, cin);
    and (w3, y, cin);
    or  (cout, w1, w2, w3);
    
endmodule
    
module Dadda8x8(
    input [7:0] a,
    input [7:0] b,
    output [15:0] prod
);    
 
//AND terms
wire g0h1, f0h1, e0h1, d0h1, c0h1, b0h1, a0h1;
wire h0g1, g0g1, f0g1, e0g1, d0g1, c0g1, b0g1, a0g1;
wire h0f1, g0f1, f0f1, e0f1, d0f1, c0f1, b0f1, a0f1;
wire h0e1, g0e1, f0e1, e0e1, d0e1, c0e1, b0e1, a0e1;
wire h0d1, g0d1, f0d1, e0d1, d0d1, c0d1, b0d1, a0d1;
wire h0c1, g0c1, f0c1, e0c1, d0c1, c0c1, b0c1, a0c1;
wire h0b1, g0b1, f0b1, e0b1, d0b1, c0b1, b0b1, a0b1;
wire h0a1, g0a1, f0a1, e0a1, d0a1, c0a1, b0a1, a0a1;

//changed naming conventions to match autograder
and AND1(prod[0], a[0], b[0]);
and AND2(g0h1, a[1], b[0]);
and AND3(f0h1, a[2], b[0]);
and AND4(e0h1, a[3], b[0]);
and AND5(d0h1, a[4], b[0]);
and AND6(c0h1, a[5], b[0]);
and AND7(b0h1, a[6], b[0]);
and AND8(a0h1, a[7], b[0]);

and AND9(h0g1, a[0], b[1]);
and AND10(g0g1, a[1], b[1]);
and AND11(f0g1, a[2], b[1]);
and AND12(e0g1, a[3], b[1]);
and AND13(d0g1, a[4], b[1]);
and AND14(c0g1, a[5], b[1]);
and AND15(b0g1, a[6], b[1]);
and AND16(a0g1, a[7], b[1]);

and AND17(h0f1, a[0], b[2]);
and AND18(g0f1, a[1], b[2]);
and AND19(f0f1, a[2], b[2]);
and AND20(e0f1, a[3], b[2]);
and AND21(d0f1, a[4], b[2]);
and AND22(c0f1, a[5], b[2]);
and AND23(b0f1, a[6], b[2]);
and AND24(a0f1, a[7], b[2]);

and AND25(h0e1, a[0], b[3]);
and AND26(g0e1, a[1], b[3]);
and AND27(f0e1, a[2], b[3]);
and AND28(e0e1, a[3], b[3]);
and AND29(d0e1, a[4], b[3]);
and AND30(c0e1, a[5], b[3]);
and AND31(b0e1, a[6], b[3]);
and AND32(a0e1, a[7], b[3]);

and AND33(h0d1, a[0], b[4]);
and AND34(g0d1, a[1], b[4]);
and AND35(f0d1, a[2], b[4]);
and AND36(e0d1, a[3], b[4]);
and AND37(d0d1, a[4], b[4]);
and AND38(c0d1, a[5], b[4]);
and AND39(b0d1, a[6], b[4]);
and AND40(a0d1, a[7], b[4]);

and AND41(h0c1, a[0], b[5]);
and AND42(g0c1, a[1], b[5]);
and AND43(f0c1, a[2], b[5]);
and AND44(e0c1, a[3], b[5]);
and AND45(d0c1, a[4], b[5]);
and AND46(c0c1, a[5], b[5]);
and AND47(b0c1, a[6], b[5]);
and AND48(a0c1, a[7], b[5]);

and AND49(h0b1, a[0], b[6]);
and AND50(g0b1, a[1], b[6]);
and AND51(f0b1, a[2], b[6]);
and AND52(e0b1, a[3], b[6]);
and AND53(d0b1, a[4], b[6]);
and AND54(c0b1, a[5], b[6]);
and AND55(b0b1, a[6], b[6]);
and AND56(a0b1, a[7], b[6]);

and AND57(h0a1, a[0], b[7]);
and AND58(g0a1, a[1], b[7]);
and AND59(f0a1, a[2], b[7]);
and AND60(e0a1, a[3], b[7]);
and AND61(d0a1, a[4], b[7]);
and AND62(c0a1, a[5], b[7]);
and AND63(b0a1, a[6], b[7]);
and AND64(a0a1, a[7], b[7]);
   
// d=6 stage wires
wire [3:1] D6_SF, D6_CF;
wire [3:1] D6_SH, D6_CH;

// d=4 stage wires
wire [12:1] D4_SF, D4_CF;
wire [2:1]  D4_SH, D4_CH;

// d=3 stage wires
wire [9:1] D3_SF, D3_CF;
wire D3_SH, D3_CH;

// d=2 wires
wire [11:1] D2_SF, D2_CF;
wire D2_SH, D2_CH;

//d=6 stage
HA H3_D6(b0h1, c0g1, D6_SH[3], D6_CH[3]);
FA F3_D6(D6_CH[3], a0h1, b0g1, D6_SF[3], D6_CF[3]);
HA H2_D6(c0f1, d0e1, D6_SH[2], D6_CH[2]);
FA F2_D6(D6_CF[3], D6_CH[2], a0g1, D6_SF[2], D6_CF[2]);
HA H1_D6(b0f1, c0e1, D6_SH[1], D6_CH[1]);
FA F1_D6(D6_CF[2], D6_CH[1], a0f1, D6_SF[1], D6_CF[1]);


//d=4 stage
HA H1_D4(d0h1, e0g1, D4_SH[1], D4_CH[1]);
FA F1_D4(D4_CH[1], c0h1, d0g1, D4_SF[1], D4_CF[1]);
HA H2_D4(e0f1, f0e1, D4_SH[2], D4_CH[2]);
FA F2_D4(D4_CF[1], D4_CH[2], D6_SH[3], D4_SF[2], D4_CF[2]);
FA F3_D4(d0f1, e0e1, f0d1, D4_SF[3], D4_CF[3]);
FA F4_D4(D4_CF[2], D4_CF[3], D6_SF[3], D4_SF[4], D4_CF[4]);
FA F5_D4(D6_SH[2], e0d1, f0c1, D4_SF[5], D4_CF[5]);
FA F6_D4(D4_CF[4], D4_CF[5], D6_SF[2], D4_SF[6], D4_CF[6]);
FA F7_D4(D6_SH[1], d0d1, e0c1, D4_SF[7], D4_CF[7]);
FA F8_D4(D4_CF[6], D4_CF[7], D6_SF[1], D4_SF[8], D4_CF[8]);
FA F9_D4(b0e1, c0d1, d0c1, D4_SF[9], D4_CF[9]);
FA F10_D4(D4_CF[8], D4_CF[9], D6_CF[1], D4_SF[10], D4_CF[10]);
FA F11_D4(a0e1, b0d1, c0c1, D4_SF[11], D4_CF[11]);
FA F12_D4(D4_CF[10], D4_CF[11], a0d1, D4_SF[12], D4_CF[12]);

//D = 3 stage
HA H1_D3(e0h1, f0g1, D3_SH, D3_CH);
FA F1_D3(D3_CH, D4_SH[1], f0f1, D3_SF[1], D3_CF[1]);
FA F2_D3(D3_CF[1], D4_SF[1], D4_SH[2], D3_SF[2], D3_CF[2]);
FA F3_D3(D3_CF[2], D4_SF[2], D4_SF[3], D3_SF[3], D3_CF[3]);
FA F4_D3(D3_CF[3], D4_SF[4], D4_SF[5], D3_SF[4], D3_CF[4]);
FA F5_D3(D3_CF[4], D4_SF[6], D4_SF[7], D3_SF[5], D3_CF[5]);
FA F6_D3(D3_CF[5], D4_SF[8], D4_SF[9], D3_SF[6], D3_CF[6]);
FA F7_D3(D3_CF[6], D4_SF[10], D4_SF[11], D3_SF[7], D3_CF[7]);
FA F8_D3(D3_CF[7], D4_SF[12], b0c1, D3_SF[8], D3_CF[8]);
FA F9_D3(D3_CF[8], D4_CF[12], a0c1, D3_SF[9], D3_CF[9]);


//D=2 stage
HA H1_D2(f0h1, g0g1, D2_SH, D2_CH);
FA F1_D2(D2_CH, D3_SH, g0f1, D2_SF[1], D2_CF[1]);
FA F2_D2(D2_CF[1], D3_SF[1], g0e1, D2_SF[2], D2_CF[2]);
FA F3_D2(D2_CF[2], D3_SF[2], g0d1, D2_SF[3], D2_CF[3]);
FA F4_D2(D2_CF[3], D3_SF[3], g0c1, D2_SF[4], D2_CF[4]);
FA F5_D2(D2_CF[4], D3_SF[4], g0b1, D2_SF[5], D2_CF[5]);
FA F6_D2(D2_CF[5], D3_SF[5], f0b1, D2_SF[6], D2_CF[6]);
FA F7_D2(D2_CF[6], D3_SF[6], e0b1, D2_SF[7], D2_CF[7]);
FA F8_D2(D2_CF[7], D3_SF[7], d0b1, D2_SF[8], D2_CF[8]);
FA F9_D2(D2_CF[8], D3_SF[8], c0b1, D2_SF[9], D2_CF[9]);
FA F10_D2(D2_CF[9], D3_SF[9], b0b1, D2_SF[10], D2_CF[10]);
FA F11_D2(D2_CF[10], D3_CF[9], a0b1, D2_SF[11], D2_CF[11]);


//RCA additions
wire [14:1] RC;

//removed the first full adder R[0] because its only one term and stored it in prod[0], which passes the test case for fewer adders
HA R1(g0h1, h0g1, prod[1], RC[2]);
FA R2(D2_SH, h0f1, RC[2], prod[2], RC[3]);
FA R3(D2_SF[1], h0e1, RC[3], prod[3], RC[4]);
FA R4(D2_SF[2], h0d1, RC[4], prod[4], RC[5]);
FA R5(D2_SF[3], h0c1, RC[5], prod[5], RC[6]);
FA R6(D2_SF[4], h0b1, RC[6], prod[6], RC[7]);
FA R7(D2_SF[5], h0a1, RC[7], prod[7], RC[8]);
FA R8(D2_SF[6], g0a1, RC[8], prod[8], RC[9]);
FA R9(D2_SF[7], f0a1, RC[9], prod[9], RC[10]);
FA R10(D2_SF[8], e0a1, RC[10], prod[10], RC[11]);
FA R11(D2_SF[9], d0a1, RC[11], prod[11], RC[12]);
FA R12(D2_SF[10], c0a1, RC[12], prod[12], RC[13]);
FA R13(D2_SF[11], b0a1, RC[13], prod[13], RC[14]);
FA R14(D2_CF[11], a0a1, RC[14], prod[14], prod[15]);

endmodule


