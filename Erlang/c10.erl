-module(c10).
-export([factorial_i/1, factorial/1, del3/1, replace_last/2]).

factorial_i(N) -> f(N,1).
f(0,A) -> A;
f(N,A) -> f(N-1,A*N).

factorial(0)-> 1;
factorial(N)->N*factorial(N-1).

del3([])-> [];
del3([H|T])->
	if 
		H == 3 -> del3(T);
		true -> [H|del3(T)]
	end.
	
replace_last([],_)->[];
replace_last([_], X)->[X];
replace_last([H|T], X) -> [H|replace_last(T,X)].
	