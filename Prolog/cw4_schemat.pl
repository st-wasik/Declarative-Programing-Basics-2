*/ mniejszenazero(L1,L2).
*/ w definicji rekurencyjnej od najprostszego wypadku.
*/ w def rekurencyjnej wiem jak bêdzie wygl¹daæ ogon.
mnz([],[]).
mnz([H|T], [H|T1]):-
	H>0,
	mnz(T,T1).
*/ mniejsze na zero.
mnz([H|T], [0|T1]):-
	H<0,
	mnz(T,T1).
	
*/ usuwanie - w ostatnim zamiast 0|T1 jest samo T1.

*/ przesuwanie na koniec - przekszta³canie ogona i append.

*/ iteracja.
*/ imnz(L1,L2).

imnz(L1, L2):-
mnz(L1, [], L2).
mnz([], L, L).
mnz([H|T], A, L):-
	H>=0,
	append(A, [H], A1),
	mnz(T1,A1,L).

mnz([H|T], A, L):-
	H<0,
	append(A,[0],A1).