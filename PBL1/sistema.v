module sistema (
    input wire F, T, LE, LD, bateria, botao, // Entradas gerais do sistema
    output wire Frente,                  // Saída Frente
    output wire FrenteAtras,             // Saída FrenteAtras
    output wire AtrasFrente            // Saída AtrasFrente
);

    // Sinais intermediários para conexão entre os módulos
    wire liga_out; // Sinais do módulo Ligar
    wire cond_ERRO;            // Saída do módulo Conditional

    // Instanciação do módulo Ligar
    ligar ligar_inst (
        .bateria(bateria),
        .botao(botao),
        .out1(liga_out)      // Sinal que pode controlar o Conditional ou Movimentacao
    );

    // Instanciação do módulo Conditional
    condicional condicional_inst (
        .F(F),
        .LE(LE),
        .LD(LD),
        .T(T),
        .ERRO(cond_ERRO)       // Saída que habilita a movimentação
    );

    // Instanciação do módulo Movimentacao
    movimentacao movimentacao_inst (
        .A(traseiro),
        .D(esquerda),
        .E(direita),
        .F(frontal),
        .Frente(Frente),
        .FrenteAtras(FrenteAtras),
        .AtrasFrente(AtrasFrente)
    );
	 
	 not out3 (not_ERRO, cond_ERRO);
	 and and1(out_func, liga_out, not_ERRO);
	 
	 and and2(frontal, out_func, F);
	 and and3(esquerda, out_func, LE);
	 and and4(direita, out_func, LD);
	 and and5(traseiro, out_func, T);
	 
	 
	 
	 

endmodule
