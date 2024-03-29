/*posicaoCorreta(+Nodo,+X,+Y) - Retorna a posi��o (X, Y) correta de uma pe�a do tabuleiro (Nodo)*/
posicaoCorreta(0, 3, 3) :- !.
posicaoCorreta(N, X, Y) :-
	N1 is N-1,
	X is N1 // 4,
	Y is N1 rem 4.

/*distManhattan(+XOrig, +YOrig, +XDest, +YDest, -Dist) - Dada uma origem (XOrig, YOrig) e um destino (XDest, YDest), calcula a dist�ncia de Manhattan em Dist*/
distManhattan(XOrig, YOrig, XDest, YDest, Dist) :-
	X1 is XDest - XOrig,
	Y1 is YDest - YOrig,
	X2 is abs(X1),
	Y2 is abs(Y1),
	Dist is X2 + Y2.

/*valorTabuleiro(+Tabuleiro, -Valor) - Calcula o Valor de um Tabuleiro*/
valorTabuleiro([], -1). 
valorTabuleiro([Linha1, Linha2, Linha3, Linha4], Valor) :-
	valorLinha(Linha1, 0, Valor1),
	valorLinha(Linha2, 1, Valor2),
	valorLinha(Linha3, 2, Valor3),
	valorLinha(Linha4, 3, Valor4),
	Valor is Valor1 + Valor2 + Valor3 + Valor4.

/*valorLinha(+Linha, +N�mero da Linha, -Valor) - Com base no N�mero da Linha, calcula o Valor de uma Linha do tabuleiro*/
valorLinha(Linha, NLinha, Valor) :-
	valorLinha(Linha, NLinha, 0, Valor, 0).
valorLinha([], _, _, Valor, Valor).
valorLinha([E|L], NLinha, NColuna, Valor, Acc) :-
	posicaoCorreta(E, XCorreto, YCorreto),
	distManhattan(NLinha, NColuna, XCorreto, YCorreto, Dist),
	Acc1 is Acc + Dist,
	NColuna1 is NColuna + 1,
	valorLinha(L, NLinha, NColuna1, Valor, Acc1).
	
