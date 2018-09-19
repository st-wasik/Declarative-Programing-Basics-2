nalezy(H,[H|T]).
nalezy(E,[H|T]):-
	E \= H,
	nalezy(E,T).
	
polacz([],L,L).
polacz([H|T], L, [H|T1]) :-
	polacz(T,L,T1).

length([],0):-
	!.
length([H|T],Result):-
	R1 is Result +1,
	length(T,R1).

odwroc([],[]):-
	!.
odwroc([H|T], L):-
		odwroc(T,L1),
		polacz(L1,[H],L).
	
i_odwroc(L,Res) :-
	i_odwroc(L,0,Res).
	
i_odwroc([H|T], L, Res) :- 
	!,
	i_odwroc(T, [H|L] , Res).
	
i_odwroc([],Acc,Acc).


	/* wszystkie wartosci na wart bezwzgledna*/

bez([],[]):-	
	!.

bez([H|T], Result) :-
	H>0,
	append(H, R),
	bez(T,R1),
	polacz(R1,R,Result).


