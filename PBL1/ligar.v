module ligar (bateria, botao, out1);

    input bateria, botao;
    output out1;

    wire not_bateria;

    not not1 (not_bateria, bateria);
    and And01 (out1, not_bateria, botao);

endmodule