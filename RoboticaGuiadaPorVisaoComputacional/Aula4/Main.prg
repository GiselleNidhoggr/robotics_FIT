Function main
Fend
Function Data_Receiver

   OpenNet #201 As Server
   Print("Aguardando conexao do cliente TCP")
   WaitNet #201, 30
    Print "  cliente TCP conectado"
    Do
        
          String action$
   
        
        Input #201, action$
          Print " Comando recebido: ", action$
  		
  		Call movimenta_robo(action$)
          
          Print #201, "OK"
    Loop
	   Print " Fechando conex?o #201"
          CloseNet #201
Fend
Function movimenta_robo(coordenada$ As String)
Integer coordy, coordx
String toks$(0)

	ParseStr coordenada$, toks$(), ";"
	coordy = Val(toks$(1))
	coordx = Val(toks$(2))

Go referencia +X(coordx) +Y(coordy)

Fend

