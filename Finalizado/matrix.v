module matrix (

	input wire Frente, RotR, RotL,
	output wire always_active1, always_active2, always_active3, always_active0, RotR1, RotR2, RotL1, RotL2
);

	// Declaração dos fios negados
	
	wire not_F, not_R, not_L, S1, S2, S3, S4, S_aux1, S_aux2;
	
	// Entradas negadas
	
	not not1 (not_F, Frente);
	not not2 (not_R, RotR);
	not not3	(not_L, RotL);
	
	// Desligar Esquerda
	
	and andL1 (S1, Frente, RotL);
	and andL2 (S2, not_F, not_L);
	
	nor orL (RotL1, S1, S2, RotR);
	
	// Desligar Direita

	and andR1 (S3, Frente, RotR);
	and andR2 (S4, not_F, not_R);
	
	nor orR (RotR1, S3, S4, RotL);
	
	// Designação de saídas para o restante dos pinos
	
	//pinos sempre ativos (puxar de outro módulo)
	
	or (always_active0, RotR1, RotL1, Frente); 
	or (always_active1, RotR1, RotL1, Frente);
	or (always_active2, RotR1, RotL1, Frente); 
	or (always_active3, RotR1, RotL1, Frente); 
	
	// Pinos adicionais na esquerda e direita
	
	not (S_aux1, RotL1);
	not (RotL2, S_aux1);
	
	
	not (S_aux2, RotR1);
	not (RotR2, S_aux2);
	

endmodule