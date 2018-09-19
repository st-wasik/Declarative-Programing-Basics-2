silnia(0,1):- !.
silnia(N,S):-
	N>0,
	N1 is N-1,
	silnia(N1,S1),
	S is N*S1.
	
revert([],[]):-
	!.
revert([H|T], L).

input:-
	write('Wpisz coś'), nl,
	read(X), !,
	check(X).


check(stop).
check(X):-
	write('stala: ')
	write(X), nl.
	
	
echo:-
	read(X),
	X \= stop,
	write('stala: '),
	write(X), nl,
	echo.
echo.