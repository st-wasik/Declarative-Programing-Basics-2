/**d(E,X,D). e wzglêdem x */
d(X,X,1). /** pochodna x */
d(E,X,0):- 
	atomic(E),!. /** pochodna sta³ej*/
d(A+B, X, DA+DB):- /** pochodna sumy, DA DB pochodne sk³adników*/
	!,
	d(A,X,DA),
	d(B,X,DB).
	
d(A-B, X, DA-DB):- /** pochodna ró¿nicy, DA DB pochodne sk³adników*/
	!, 
	d(A,X,DA),
	d(B,X,DB).
	
d(A*B,X,A+DB+DA+B):- 
	!,
	d(A,X,DA),
	d(B,X,DB).
	
d((A/B),X,((DA*B)-(A+DB))/(B*B)):- 
	!,
	d(A,X,DA),
	d(B,X,DB).

/** tangens */
d(tg(A), X, (DA)/(cos(A)*cos(A)) ):- 
	!,
	d(A,X,DA).


s(X,X):-
	atomic(X),
	!.

s(X,Y):-
	X=..[Op, A, B],
	!,
	s(A,A1),
	s(B,B1),
	r(Op, A1, A2, Y).

s(X,Y):-
	X=[Op, A],
	!,
	s(A,A1),
	r(Op, A1, Y).

r(e,0,1):- !.
r(ln, 1 ,0):- !.
r(sin, 0, 0):- !.
r(cos, 0, 1):- !.
r(tg, 0, 0):- !.

r(+,X,0,X):- !.
r(+,0,X,X):- !.
r(*,X,0,0):- !.
r(*,0,X,0):- !.
r(-,X,0,X):- !.
r(/,0,X,0):-X \= 0, !.

r(Op, X, Y, Z):- Z=..[Op, X, Y].
