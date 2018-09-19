zeronakoniec([],[]).
zeronakoniec([H|T], L):-
	H = 0, !,
	zeronakoniec(T,L1),
	add(0,L1,L).
	
zeronakoniec([H|T], [H|L]):-
	H \= 0,
	zeronakoniec(T,L).
	
add(A,[], [A]).
add(A,[H|T], [H|L]):-
	add(A,T, L).
	
quicksort([],[]):- !.
quicksort([H],[H]):- !.
quicksort([H|T],L):- !,

  partition(H, T, L1, L2),
  quicksort(L1,R1),
  quicksort(L2,R2),
  append(R1,[H],R3),
  append(R3,R2,L).
  
partition(E, [H], [H], []):-
  H < E.
partition(E, [H], [], [H]):-
  H >= E.
  
partition(E,[H|T],[H|Lt],Gt):-
  H < E,
  partition(E,T,Lt,Gt).

partition(E,[H|T],Lt,[H|Gt]):-
  H >= E,
  partition(E,T,Lt,Gt).
 

pary([H1,H2], [(H1,H2)]).
pary([H1,H2|T], [(H1,H2)|L]):-
  pary([H2|T], L).
 
merge([],[],[]).
merge([],[H|T],[H|T]).
merge([H|T],[],[H|T]).
	
merge([H1|T1],[H2|T2],[H1|L]):-
	H1<H2,
	merge(T1, [H2|T2], L).
	
merge([H1|T1],[H2|T2],[H2|L]):-
	H1>=H2,
	merge([H1|T1], T2, L).
	
  
  
mergesort([],[]).
mergesort([H],[H]).

mergesort([H|T],L):-
  mergesort(T,L2),
  merge([H],L2,L).
  
  
  
abs(A,X):-
  (A >=0 -> X is A; X is -A).
  
absList([],[]).
absList([H|T], [H1|L]):-
  abs(H,H1),
  absList(T,L).
  
nalezy([H|_], A):-
  H = A, !.
nalezy([H|T], A):-
  H \= A, !,
  nalezy(T,A).
  
  
przed([H|T],A,B):-
  H = A,
  nalezy(T,B).
  
przed([H|T], A, B):-
  H \= A,
  przed(T,A,B).

otoczenie([A1,A,A2|_],A,A1,A2).
otoczenie([_|T],A,A1,A2):-
  otoczenie(T,A,A1,A2).
  

  
ot([A1,A,A2|_],A,[A1,A2]).  
ot([A,A2|_],A,A2).
ot([_|T],A, L):-
  ot(T,A,L).
  
  
otoczenie3([A1,A2,A,A3,A4|_],A,L):-
  append([A1,A2,A3,A4], [], L).
otoczenie3([_|T],A,L):-
  otoczenie3(T,A,L).
  
  

prz([H,A|_],A,[H]).
prz([H1,H2,A|_],A,[H1,H2]).
prz([],_,[]).
prz([_|T], A, L):-
  prz(T,A,L).

po([A,H1,H2|_],A,[H1,H2]).
po([A,H|_],A,[H]).
po([],_,[]).
po([_|T],A,L):-
    po(T,A,L).

ot3(L, A, Ret):-
  prz(L,A,L1),
  po(L,A,L2),
  append(L1, L2, Ret).

zmiana(A,L):-
  partition(A,L1,L2),
  append(L1,L2,L).
  
partition([],[],[]).
partition([H|T],[H|L1], L2):-
  H<0,
  partition(T,L1,L2).
partition([H|T],L1,[H|L2]):-
  H>=0,
  partition(T,L1,L2).
  
polacz([],[],[]).
polacz([H],[],[H]).
polacz([],[H],[H]).
polacz([H1|T1], [H2|T2], [H1,H2|L]):-
  polacz(T1,T2,L).
 
onp(E,[E]):-
  atomic(E).
onp(E, L):-
  E=..[F,A1,A2],
  onp(A1,A11),
  onp(A2,A22),
  append(A11,A22,L1),
  append(L1, [F], L).
 
 
in2pre(E1,E2):-
  E1=..[F,A1,A2],
  in2pre(A1,A11),
  in2pre(A2,A22),
  E2=..[F,A11,A22].
  
pre2in(E1,E1):-
  atomic(E1).
pre2in(E1,E2):-
  E1=..[F,A1,A2],
  pre2in(A1,A11),
  pre2in(A2,A22),
  E2=..[F,A11,A22].
  
len([],0).  
len([_|T], A):-
  len(T,A1),
  A is A1 +1.
 
at(0, [H|_], H).
at(A,[_|T],Val):-
  A1 is A - 1,
  at(A1, T, Val).
  
mid([H],H).
mid(T, Val):-
  len(T,Le),
  Le1 is (Le-1)/2,
  at(Le1, T, Val).

min([H],H).

min([H|T], A):-
  min(T, X1),
  X1 > H,
  A is H.
  
min([H|T],A):-
  min(T,X1),
  X1 =< H,
  A is X1.
  
del(_,[],[]).
del(E, [H|T], L1):-
  E = H,
  del(E,T,L1).
del(E,[H|T],[H|L1]):-
  E \= H,
  del(E,T,L1).
 
minNaKoniec(T, L):-
  min(T,Min),
  del(Min,T,L1),
  append(L1,[Min],L).
  
app([],L,L).
app([H|T],L, [H|Ret]):-
  app(T,L,Ret).

  

para([A,B|_],A,B).
para([_,X|T],A,B):- para([X|T],A,B).

wypiszPary(T,A,B):-
  para(T,A,B).
wypiszPary(_,_,_).



my_arg(N, Term, Arg):-
  Term=..L,
  at(N, L, Arg).
  
my_functor(Term, F, N):-
  Term=..[F|T],
  len(T,N).

/** [1,2,3,[4,5,6]] */
splaszcz([H|T], L):-
  splaszcz(H,H1),
  splaszcz(T,T1),
  L is [H1|T1].
splaszcz([],[]).
splaszcz(H,H).

flatten([],[]).
flatten([H|T],[H|T1]):-
  atomic(H), 
  !,
  flatten(T,T1).
flatten([H|T],L):-
  flatten(H,H1),
  flatten(T,T1),
  append(H1,T1,L).
  
usunPowt([H|T],L):-
  nalezy(T,H),
  !,
  usunPowt(T,L).

usunPowt([H|T],[H|L]):-
  usunPowt(T,L).

usunPowt([],[]).
  
  
  
silnia(0,1).
silnia(N,S):-
  N1 is N-1,
  silnia(N1, S1),
    S is N*S1.
    
silniaI(N,S):-
  silniaI(N,1,S).
  
silniaI(0, S, S).
silniaI(N, A, S):-
  N1 is N-1,
  A1 is N*A,
  silniaI(N1,A1,S).
    
lenI(L, S):-
    lenI(L, 0, S).
    
lenI([], S, S).
lenI([H|T], A, S):-
  A1 is A + 1,
  lenI(T,A1,S).

wypisz([H,T], [H]).
wypisz([H|T],[H|L]):-
  wypisz(T,L).
wypisz([_|T],L):-
  wypisz(T,L).

wypisz2(L,L).
wypisz2([_|T],L):-
  wypisz2(T,L).
  
  
wyp(T):-
  wypisz2(T,L),
  write(L), nl,
  fail.
wyp(_).

diff(T1,T2,L1):-
  diff2(T1,T2,A),
  diff2(T2,T1,B),
  append(A,B,C),
  usunPowt(C,L1).

diff2([H1|T1], T, L):-
  member(H1,T), !,
  diff2(T1,T,L).
  
diff2([H1|T1], T, [H1|L]):-
  \+ member(H1,T),
  diff2(T1,T,L).

diff2([],T,[]).


in(X):-
  not(atomic(X)).
  
trans(Expr, Expr):- atomic(Expr).
trans(Expr, [R1, R2, F]):-
	Expr =.. [F, H1, H2],
	trans(H1, R1),
	trans(H2, R2).

