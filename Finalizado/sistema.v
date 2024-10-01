module sistema (
    input wire F, T, LE, LD, bateria, botao, // Entradas gerais do sistema
    output wire led0, led1, led2, led3, led4, led5, led6, led7, led8, led9, outled, // Saídas dos LEDs
    output wire D1, D2, D3, D4,           // Saídas de controle dos dígitos do display
    output wire SEG_A, SEG_B, SEG_C, SEG_D, SEG_E, SEG_F, SEG_G, SEG_P, // Saídas dos segmentos do display
    output wire always_active1, always_active2, always_active3, always_active0, RotR1, RotR2, RotL1, RotL2 // Saídas da matriz
);

    // Sinais intermediários para conexão entre os módulos
    wire liga_out;         // Sinal de controle do módulo ligar
    wire cond_ERRO;        // Saída do módulo Conditional
    wire not_ERRO;         // Sinal invertido de cond_ERRO
    wire Fc;               // Sinal para movimentação
	 
	 // Acende o LED quando o sistema eh ligado
	 
	 and And_LEDRGB (outled, 1'b1, botao);
	 
	 // Verificaçao da operacao do sistema para exibicao no display
	 
	 wire outcheck;
	 and and_display (outcheck, cond_ERRO, botao);

    // Condicional para manutenção da movimentação para frente
	 
    and and0 (Fc, liga_out, not_ERRO);

    // Segundo output para o botão de liga/desliga
    wire aux;
    not(aux, botao);
    not(led9, aux);
    
    // Instanciação do módulo Ligar com as saídas dos LEDs
    ligar ligar_inst (
        .bateria(bateria),
        .botao(botao),
        .out1(liga_out),
        .led1(led1),
        .led2(led2),
        .led3(led3),
        .led4(led4),
        .led5(led5),
        .led6(led6),
        .led7(led7),
        .led8(led8),
        .led0(led0)
    );

    // Instanciação do módulo Conditional
    condicional condicional_inst (
        .F(F),
        .LE(LE),
        .LD(LD),
        .T(T),
        .ERRO(cond_ERRO)
    );

    // Instanciação do módulo Movimentacao
    wire Front_W, Left_W, Right_W;

    movimentacao movimentacao_inst (
        .A(traseiro),
        .D(esquerda),
        .E(direita),
        .F(frontal),
        .Frente(Front_W),
        .FrenteAtras(Left_W),
        .AtrasFrente(Right_W),
        .Fc(Fc)
    );

    // Instanciação do display de sete segmentos com lógica invertida
    display_seteSeg seteSeg_inst (
        .ERRO(outcheck),
		  .D1(D1),
		  .D2(D2),
		  .D3(D3),
		  .D4(D4),
		  .SEG_A(SEG_A),
		  .SEG_B(SEG_B),
		  .SEG_C(SEG_C),
		  .SEG_D(SEG_D),
		  .SEG_E(SEG_E),
		  .SEG_F(SEG_F),
		  .SEG_G(SEG_G),
		  .SEG_P(SEG_P),
    );

    // Instaciação da matriz de LEDs
    matrix matrix_inst (
        .Frente(Front_W),
        .RotL(Left_W),
        .RotR(Right_W),
        .always_active1(always_active1), 
        .always_active2(always_active2), 
        .always_active3(always_active3), 
        .always_active0(always_active0), 
        .RotR1(RotR1), 
        .RotR2(RotR2), 
        .RotL1(RotL1), 
        .RotL2(RotL2)
    );
    
    // Controle adicional de movimentação e leds
    not out3 (not_ERRO, cond_ERRO);
    and and5(out_func, liga_out, not_ERRO);
    
    and and6(frontal, out_func, F);
    and and7(esquerda, out_func, LE);
    and and8(direita, out_func, LD);
    and and9(traseiro, out_func, T);

endmodule
