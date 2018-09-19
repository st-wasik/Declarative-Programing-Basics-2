silnia(0,1):-
	!.
silnia(N,X) :-
	N>0,
	N1 is N-1,
	silnia(N1,X1),
	X is N*X1.
	
		
sili(N,X):-
	N>0,
	sili(N,1,X).
sili(0,A,A):-
	!.
sili(N,A,X) :-
	N>0,
	A1 is A*N,
	N1 is N-1,
	sili(N1,A1,X).
	
parzysta(0):-
	!.
parzysta(X):-
	X > 1, !,
	X1 is X-2,
	parzysta(X1).
parzysta(X):-
	X < 1,
	X1 is X+2,
	parzysta(X1).
	
podzielna_przez_3(0):-
	!.
podzielna_przez_3(X):-
	X>1, !,
	N1 is X - 3,
	podzielna_przez_3(N1).
podzielna_przez_3(X):-
	X<1,
	N1 is X + 3,
	podzielna_przez_3(N1).
	
nieparzysta(1):-
	!.
nieparzysta(X):-
	X>1, !,
	X1 is X-2,
	nieparzysta(X1).
nieparzysta(X):-
	X<0,
	X1 is X+2,
	nieparzysta(X1).
	
fib(0,0):-
	!.
fib(1,1):-
	!.
fib(X,Y):-
	X1 is X-1,
	X2 is X-2,
	fib(X1,N1),
	fib(X2,N2),
	Y is N1+N2.
	
fibi(0,0).
fibi(1,1).
fibi(X,Y):-
	X>1,
	fibi(0,X,0,1,Y).
fibi(I,I,N1,N2,Result).
fibi(I,N,N1,N2,Result) :-
	I>0,
	I<=N,
	Result is N1+N2,
	I1 is I+1,
	fibi(I1, N, N2, Result, Y).
	
	

