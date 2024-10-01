// Módulo nivel_bateria que controla o estado dos LEDs
module nivel_bateria (
    input wire control,      // Entrada de controle da saída do módulo ligar
    output wire led1,        // LEDs que indicam que a bateria está no nível 1
    output wire led2,
    output wire led3,
    output wire led4,
    output wire led5,
    output wire led6,
    output wire led7,
    output wire led8,
    output wire led0
);

    // Fios intermediários para controlar os LEDs
    wire not_control;   // Fio para a inversão do controle

    // Inversor para o sinal de controle
    not inv1 (not_control, control);

    // Controle do LED 0 - acende apenas quando control = 0
    //and and_led0 (led0, not_control, 1'b1); 

    // Controle dos LEDs 1 a 9 - acendem somente quando control = 1
    and and_led1 (led1, control, 1'b1);
    and and_led2 (led2, control, 1'b1);
    and and_led3 (led3, control, 1'b1);
    and and_led4 (led4, control, 1'b1);
    and and_led5 (led5, control, 1'b1);
    and and_led6 (led6, control, 1'b1);
    and and_led7 (led7, control, 1'b1);
    and and_led8 (led8, control, 1'b1);
    and and_led0 (led0, control, 1'b1);

endmodule