/* wielomian E ze wzgledu na X*/
wyraz(1, [H|T], H):- 
	!.
wyraz(N,[H|T], Arg):-
	N1 is N-1,
	wyraz(N1, T, Arg).
sa(E):-
	number(E).
sa(+(E)):-
	sa(E).
sa(-(E)):-
	sa(E).
sa(E1+E2):-
	sa(E1),
	sa(E2).
sa(E1-E2):-
	sa(E1),
	sa(E2).
sa(E1*E2):-
	sa(E1),
	sa(E2).
sa(E1/E2):-
	sa(E1),
	sa(E2).

wielomian(E,X):-
	number(E),
	!.
	
wielomian(X,X):-
	!.

wielomian(W1+W2, X):-
	!,
	wielomian(W1,X),
	wielomian(W2,X).
	
wielomian(W1-W2, X):-
	!,
	wielomian(W1,X),
	wielomian(W2,X).	
	
wielomian(W1*W2, X):-
	!,
	wielomian(W1,X),
	wielomian(W2,X).	

wielomian(W/N, X):-
	!,
	wielomian(W,X),
	number(N),
	N \= 0.
	
wielomian(W^N, X):-
	!,
	wielomian(W,X),
	integer(N),
	N >= 0.
   
	 




/**
 *    0(11|10)*00(10|001)+11 
 */


a([0|T]):-
	a1(T).
a1([1,1|T]):-
	a1(T).
a1([1,0|T]):-
	a1(T).
a1([0,0|T]):-
	a2.
a2([1,0|T]):-
	a3(T).
a3([0,0,1|T]):-
	a3(T).
a3([1,0|T]):-
	a3(T).
a3([0,0,1|T]):-
	a3(T).
a3([1,1]).

/** 
 *   (01|00)+11(0|010)*1(101)*
 */

b([0,1|T]):-
	b3(T).
b([0,0|T]):-
	b3(T).
b3([0,1|T]):-
	b3(T).
b3([0,0|T]):-
	b3(T).
	
b3([1,1|T]):-
	b1(T).
	
b1([0|T]):-
	b1(T).
b1([0,1,0|T]):-
	b1(T).
	
b1([1|T]):-
	b2(T).
	
b2([1,0,1|T]):-
	b2(T).
b2([]).


