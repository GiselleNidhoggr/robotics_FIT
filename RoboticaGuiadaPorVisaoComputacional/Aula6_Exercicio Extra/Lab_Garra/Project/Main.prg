Function main

Call habilitabraco

Integer count

	Call reset_pallet	        'reinicia o simulador

	Go Quadrado_1 +Z(50)         ' vai até Q1 deslocado Z +50mm
	Move Quadrado_1		         ' Move em linha reta até Q1 para pegar
		Call fechamento_garra(1) 'Chama a função que fecha a garra com a peça 1
	Wait Sw(Garra_fechada)		 'Aguarda o sensor de garra fechada
	Move Quadrado_1 +Z(50)		 'Move para Q1 deslocado Z +50mm
	
	Go Quadrado_2 +Z(50)	 	 'Vai até Q2 deslocado em Z +50mm
		Call abertura_garra(1)   'Chama a função que abre a garra com a peça 1
	Wait Not Sw(Garra_fechada)   'Aguarda o sensor de garra fechada ficar falso
	
	Move Quadrado_2 +Z(100)      'Move para Q2 deslocado em Z +100 (agora temos 2 blocos de 50)
	Go Quadrado_3 +Z(100)	     'Move até Q3 deslocado em Z +100
	Move Quadrado_3			  	 'Move para pegar Q3
		Call fechamento_garra(3) 'Chama a função que fecha a garra com a peça 3 
	Wait Sw(Garra_fechada)		 'Aguarda o sensor de garra fechada
	Move Quadrado_3 +Z(100)		 'Move para Q3 deslocado em Z +100mm
	
	Go Quadrado_2 +Z(100)		 'Vai até Q2 deslocado em Z +100mm
		Call abertura_garra(3)   'Abre a garra que está com a peça 3
	Wait Not Sw(Garra_fechada)   'Aguarda o sensor de garra fechada ficar falso
	Move Quadrado_2 +Z(150)		 'Move até Q2 deslocado em +Z 150mm
	
	'
	'
	'Agora, retire as peças da pilha e volte elas para a posição.
	'
	'
	Print "Programa finalizado"

Fend

Function fechamento_garra(index As Integer)
	On fechar_garra	    ' fecha a garra
	Call pick_simulador(index)
	Print "Aguardando fechamento da garra"
Fend
Function abertura_garra(index As Integer)
	Off fechar_garra    'abre a garra
	Call place_simulador(index)
	Print "Aguardando abertura da garra"
Fend
Function habilitabraco
	If ErrorOn Then Reset
	If Not Motor Then Motor On
	Power High
	
	Speed 10
	Accel 10, 10
	
	SpeedS 100
	AccelS 100, 100
	
	
Fend
Function reset_pallet
OnErr GoTo handling
	SimSet robot1.Place, Q1
	SimSet robot1.Place, Q2
	SimSet robot1.Place, Q3
	
	SimSet ResetCollision
	
	SimSet robot1.Hand.PositionZ, 3
	SimSet robot1.Hand.RotationX, -90
	
	SimSet Q1.PositionX, 145
	SimSet Q1.PositionY, 373
	SimSet Q1.PositionZ, 147
	SimSet Q1.RotationX, 0
	SimSet Q1.RotationY, 0
	SimSet Q1.RotationZ, 0

	SimSet Q2.PositionX, 22
	SimSet Q2.PositionY, 428
	SimSet Q2.PositionZ, 146
	SimSet Q2.RotationX, 0
	SimSet Q2.RotationY, 0
	SimSet Q2.RotationZ, 0
	
	SimSet Q3.PositionX, -85
	SimSet Q3.PositionY, 487
	SimSet Q3.PositionZ, 146
	SimSet Q3.RotationX, 0
	SimSet Q3.RotationY, 0
	SimSet Q3.RotationZ, 0
	
handling:
	EResume Next
Fend
Function pick_simulador(index As Integer)
 Select index
 	Case 1
 		SimSet robot1.Pick, Q1
 	Case 2
 		SimSet robot1.Pick, Q2
 	Case 3
 		SimSet robot1.Pick, Q3
 Send
		
Fend
Function place_simulador(count As Integer)
 Select count
 	Case 1
 		SimSet robot1.Place, Q1
 	Case 2
 		SimSet robot1.Place, Q2
 	Case 3
 		SimSet robot1.Place, Q3
 Send
		 
Fend

