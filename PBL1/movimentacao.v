module movimentacao (
    input wire A, D, E, F,          // Entradas do circuito
    output wire Frente,             // Primeira saída
    output wire FrenteAtras,        // Segunda saída
    output wire AtrasFrente         // Terceira saída
);

    // Declaração dos fios intermediários para as negações
    wire not_A, not_D, not_E, not_F;

    // Inversores para obter as entradas negadas
    not (not_A, A);
    not (not_D, D);
    not (not_E, E);
    not (not_F, F);

    // Implementação da saída Frente: Frente = ~E~F~D
    and (Frente, not_E, not_F, not_D);

    // Implementação da saída FrenteAtras: FrenteAtras = ~A F ~D + ~A E ~D
    wire term1, term2;
    and (term1, not_A, F, not_D);       // ~A F ~D
    and (term2, not_A, E, not_D);       // ~A E ~D
    or  (FrenteAtras, term1, term2);    // ~A F ~D + ~A E ~D

    // Implementação da saída AtrasFrente: AtrasFrente = ~A ~E D
    and (AtrasFrente, not_A, not_E, D);

endmodule
