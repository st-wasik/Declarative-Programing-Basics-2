-module(rpn).
-export([rpn/1, op/3]).

op(H, A, B) -> 
	if
		H =:= "+" ->A+B;
		H =:= "-" ->A-B;
		H =:= "*" ->A*B;
		H =:= "/" ->A/B;
		true -> 0
	end.
	
sign(H) -> if H =:= "+"; H =:= "-"; H =:= "*"; H =:= "/" -> true; true -> false end.

%reverse polish notation

rpn(Wyr) -> X = string:tokens(Wyr, " "), rpn(X,[]).

rpn([],[A]) -> A;
rpn([H|T], Stos) ->  
	Is_sign = sign(H),
	if
		Is_sign -> [A,B|St] = Stos, X = op(H, A, B), rpn(T, [X|St]);
		true -> {Fst,_} = string:to_integer(H), rpn(T, [Fst|Stos])
	end.

