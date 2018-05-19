module zero_checker(zero, in);
    output zero;
    input [31:0] in;
    wire  [31:1] chain;

    or o1(chain[1], in[1], in[0]);
    or o2(chain[2], in[2], chain[1]);
    or o3(chain[3], in[3], chain[2]);
    or o4(chain[4], in[4], chain[3]);
    or o5(chain[5], in[5], chain[4]);
    or o6(chain[6], in[6], chain[5]);
    or o7(chain[7], in[7], chain[6]);
    or o8(chain[8], in[8], chain[7]);
    or o9(chain[9], in[9], chain[8]);
    or o10(chain[10], in[10], chain[9]);
    or o11(chain[11], in[11], chain[10]);
    or o12(chain[12], in[12], chain[11]);
    or o13(chain[13], in[13], chain[12]);
    or o14(chain[14], in[14], chain[13]);
    or o15(chain[15], in[15], chain[14]);
    or o16(chain[16], in[16], chain[15]);
    or o17(chain[17], in[17], chain[16]);
    or o18(chain[18], in[18], chain[17]);
    or o19(chain[19], in[19], chain[18]);
    or o20(chain[20], in[20], chain[19]);
    or o21(chain[21], in[21], chain[20]);
    or o22(chain[22], in[22], chain[21]);
    or o23(chain[23], in[23], chain[22]);
    or o24(chain[24], in[24], chain[23]);
    or o25(chain[25], in[25], chain[24]);
    or o26(chain[26], in[26], chain[25]);
    or o27(chain[27], in[27], chain[26]);
    or o28(chain[28], in[28], chain[27]);
    or o29(chain[29], in[29], chain[28]);
    or o30(chain[30], in[30], chain[29]);
    or o31(chain[31], in[31], chain[30]);

    not n0(zero, chain[31]);
endmodule
