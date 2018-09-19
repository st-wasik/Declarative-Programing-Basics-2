kobieta(ewa).
kobieta(ala).
kobieta(ola).
kobieta(marta).
kobieta(anna).
kobieta(iza).

mezczyzna(adam).
mezczyzna(piotr).
mezczyzna(pawel).
mezczyzna(roman).
mezczyzna(tomasz).
mezczyzna(jan).


rodzic(adam,ala).
rodzic(adam,piotr).
rodzic(adam,ola).
rodzic(adam,pawel).

rodzic(ewa,ala).
rodzic(ewa,piotr).
rodzic(ewa,ola).
rodzic(ewa,pawel).

rodzic(jan,tomasz).
rodzic(jan,anna).

rodzic(marta,tomasz).
rodzic(marta,anna).

rodzic(pawel,iza).
rodzic(anna,iza).

rodzic(ola,roman).
rodzic(tomasz, roman).



matka(X,Y):-
	kobieta(X),
	rodzic(X,Y).

ojciec(X,Y):-
	mezczyzna(X),
	rodzic(X,Y).

corka(X,Y)
	kobieta(X),
	rodzic(Y,X).

syn(X,Y)
	mezczyzna(X),
	rodzic(Y,X).

brat(X,Y)
	mezczyzna(Y),
	syn(Y,C),
	corka(Y,C),
	X\=Y.

siostra(X,Y)
	kobieta(Y),
	syn(Y,C),
	corka(Y,C),
	X\=Y.


przodek(X,Y) :- rodzic(Y,X).
przodek(X,Y) :- przodek(Y,przodek(X)).


