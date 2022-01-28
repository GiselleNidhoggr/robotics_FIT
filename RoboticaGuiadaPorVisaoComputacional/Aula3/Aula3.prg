
Function main
	Motor On
	If Sw(insere_bisturi) Then
		Go P0
		Go P1
		Go P0
	EndIf
	On realiza_corte
	
	Do While insere_bisturi = False 'Cria uma sequencia de cortes infinitos se verdadeiro :) - Melhor usar ForLoop
		Go P1
		Go P0
		Go P1
	Loop
	
	Integer contador
	For contador = 0 To 2 'Repete o contador
		Go P(contador)
	Next
Fend

