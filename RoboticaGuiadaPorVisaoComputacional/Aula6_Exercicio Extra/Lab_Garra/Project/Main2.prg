Function main2

Call habilitabraco

Integer count

	Call reset_pallet	        'reinicia o simulador

	Go Quadrado_1 +Z(50)         ' vai at� Q1 deslocado Z +50mm
	Move Quadrado_1		         ' Move em linha reta at� Q1 para pegar
		Call fechamento_garra(1) 'Chama a fun��o que fecha a garra com a pe�a 1
	Wait Sw(Garra_fechada)		 'Aguarda o sensor de garra fechada
	Move Quadrado_1 +Z(50)		 'Move para Q1 deslocado Z +50mm
	
	Go Quadrado_2 +Z(50)	 	 'Vai at� Q2 deslocado em Z +50mm
		Call abertura_garra(1)   'Chama a fun��o que abre a garra com a pe�a 1
	Wait Not Sw(Garra_fechada)   'Aguarda o sensor de garra fechada ficar falso
	
	Move Quadrado_2 +Z(100)      'Move para Q2 deslocado em Z +100 (agora temos 2 blocos de 50)
	Go Quadrado_3 +Z(100)	     'Move at� Q3 deslocado em Z +100
	Move Quadrado_3			  	 'Move para pegar Q3
		Call fechamento_garra(3) 'Chama a fun��o que fecha a garra com a pe�a 3 
	Wait Sw(Garra_fechada)		 'Aguarda o sensor de garra fechada
	Move Quadrado_3 +Z(100)		 'Move para Q3 deslocado em Z +100mm
	
	Go Quadrado_2 +Z(150)        'Vai at� Q2 deslocado em Z +150mm
	Move Quadrado_2 +Z(100)		 'Vai at� Q2 deslocado em Z +100mm
		Call abertura_garra(3)   'Abre a garra que est� com a pe�a 3
	Wait Not Sw(Garra_fechada)   'Aguarda o sensor de garra fechada ficar falso
	Move Quadrado_2 +Z(150)		 'Move at� Q2 deslocado em +Z 150mm
	
	Move Quadrado_2 +Z(100)
		Call fechamento_garra(3)
		Wait Sw(Garra_fechada)
	Move Quadrado_2 +Z(150)
	
	Go Quadrado_3 +Z(100)
	Move Quadrado_3
		Call abertura_garra(3)
		Wait Not Sw(Garra_fechada)
	Move Quadrado_3 +Z(100)
	
	Go Quadrado_2 +Z(100)
	Move Quadrado_2 +Z(50)
		Call fechamento_garra(1)
		Wait Sw(Garra_fechada)
	Go Quadrado_2 +Z(100)

	Go Quadrado_1 +Z(50)
	Move Quadrado_1
			Call abertura_garra(1)
	Wait Not Sw(Garra_fechada)
	
	Print "Programa finalizado"

Fend
