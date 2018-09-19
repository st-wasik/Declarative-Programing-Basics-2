del(E, [E | T], T):-
	!.
del(E, [H | T], [H | T1]) :- del(E, T, T1).

perm([ ], [ ]):-
	!.
perm(L, [H | T]) :- del(H, L, L1), perm(L1, T).

sorted([ ]):-
	!.
sorted([ _ ]):-
	!.
sorted([X, Y | T]) :- X =< Y, sorted([Y | T]).

slowsort(L1, L2) :- perm(L1, L2), sorted(L2).


m1([E],[],[E]):- 
	!.
m1([H1|T1], [H2|T2], L):-
	H1 > H2, !,
	merge(T1, [H2|T2], [H1|L]).
m1([H1|T1], [H2|T2], L):-
	H1<=H2,
	merge([H1|T1], T2, [H2|L]).
	

/* insert_sort(L1,L2)*/
/* wstaw podejœciu rekurencyjnym wiem jak wygl¹da ogon
/* wstaw g³owê do posortwanego ogona 

insert_sort([],[]):-
	!.
insert_sort([H],[H]):-
	!.
insert_sort([H|T], L):-
	insert_sort(T,T1),
	wstaw(H,T1,L).	
	
wstaw(E,[],[E]):-
	!.
wstaw(E, [H|T], [E,H|T]):-
	E=<H.
wstaw(E, [H|T], [H|T1]):-
	E>H,
	wstaw(E, T, T1).
	
/* select_sort(L1,L2).
select_sort([],[]):- 
	!.
select_sort([H],[H]):-
	!.
select_sort(L, [Min|T]):-
	min1(L, Min, L1), %znajdz najmniejszy element na liscie
	select_sort(L1, T).
	
/* min1(L, Min, L1).
min1([E], E, []):-
	!.
min1([],E,[]):-
	!.
min1([H|T], Min, T1)
	H< Min,
	Min1 is H,
	min1(T,Min1, T1).
min1([H|T], Min, T1)
	H>= Min,
	min1(T,Min, T1).
	
/*wiem jaki elelemt jest najmniejszy w ogonie. czyli albo H albo M.
min([E],E,[]):-
	!.
min([H|T],M,[H|T1]):-
	min(T,M,T1),
	H>M.	
min([H|T],H,T):-
	min(T,M,T1),
	H=<M.
	
	
	
	

	
	
/*quicksort(L1,L2).

quicksort([],[]):-
	!.
quicksort([H],[H]):-
	!.
quicksort([H|T], L):-
	rozdziel(H, T, T1, T2), /*ze wzgledu na H ogon T na liste t1 i t2
	quicksort(T1,T11),
	quicksort(T2,T22),
	append(T11,[H|T22], L). /*T11 s¹ mniejsze od wybranego.
	
rozdziel(H, [], [], []):- 
	!.
rozdziel(H,[H1|T1], T2, T3):-
	H1<H, !,
	rozdziel(H,T1,T2,T3).
rozdziel(H,[H1|T1], T2, T3):-
	H1>=H,
	rozdziel(H,T1,T2,T3).
	
rozdziel(H, T, T1, T2):-
T1 is [],
T2 is T.










