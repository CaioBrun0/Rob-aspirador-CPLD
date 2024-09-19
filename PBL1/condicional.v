module condicional (F, LE, LD, T, ERRO);

    input F, LE, LD, T;
    output ERRO;

    wire S1, S2, S3, S4;

    and and1(S1, F, T);
    and and2(S2, T, LD);
    and and3(S3, T, LE);
    and and4(S4, LE, LD);

    or or1(ERRO, S1, S2, S3, S4);

endmodule