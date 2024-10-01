module display_seteSeg (
    input wire ERRO,
	 output wire D1,
    output wire D2,
    output wire D3,
    output wire D4,
	 output wire SEG_A,
    output wire SEG_B,
    output wire SEG_C,
	 output wire SEG_D,
    output wire SEG_E,
    output wire SEG_F,
    output wire SEG_G,
	 output wire SEG_P
);

    // Inverter a lógica dos segmentos usando NAND para simular o NOT
    
    nor nor1 (D1, 1'b0, ERRO);
	 
	 nand nand1 (D2, 1'b0, ERRO);
	 
	 nand nand2 (D3, 1'b0, ERRO);
	 
	 nand nand3 (D4, 1'b0, ERRO);
	 
	 nor nor2 (SEG_A, 1'b0, ERRO);
	 
	 nand nand4 (SEG_B, 1'b0, ERRO);
	 
	 nand nand5 (SEG_C, 1'b0, ERRO);
	 
	 nor nor3 (SEG_D, 1'b0, ERRO);
	  
	 nor nor4 (SEG_E, 1'b0, ERRO);
	 
	 nor nor5 (SEG_F, 1'b0, ERRO);
	 
	 nor nor6 (SEG_G, 1'b0, ERRO);
	 
	 nor nor7 (SEG_P, 1'b0, ERRO);
	 
endmodule

