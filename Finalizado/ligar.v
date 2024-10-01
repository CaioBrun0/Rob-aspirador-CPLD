module ligar (
    input wire bateria, botao,    // Entradas de bateria e botão
    output wire out1,            // Saída de controle do sistema
    output wire led1, led2, led3, led4, led5, led6, led7, led8, led0 // Saídas dos LEDs
);

    wire not_bateria;             // Fio para a inversão da entrada bateria

    // Inversor que nega o sinal da bateria
    not not1 (not_bateria, bateria);
	     
    // Porta AND que controla a saída out1 com a bateria e o botão
    and And01 (out1, not_bateria, botao);
    
    // Instância do módulo nivel_bateria para controlar os LEDs
    nivel_bateria nivel_bateria_inst (
        .control(out1),   // Passa o sinal da saída out1 como entrada de controle
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

endmodule