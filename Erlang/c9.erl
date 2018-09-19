-module(c9).
-export([factorial/1, fib/1, even/1, elem/2, merge/2, len/1, factorial_i/1, i_length/1, i_sum/1,
 subtractN/2, i_subtractN/2, append/2, negativAtTheEnd/1, i_negativAtTheEnd/1]).

factorial(0) -> 1;
factorial(N) -> N* factorial(N-1).

fib(1) -> 1;
fib(2) -> 1;
fib(N) -> fib(N-1) + fib(N-2).

even(N) when (N rem 2) =:= 0 -> true;
even(_) -> false.

elem(_, []) -> false;
elem(N,[H|_]) when N =:= H -> true;
elem(N,[_|T]) -> elem(N,T).

merge([], List) -> List;
merge(List,[]) -> List;
merge([H|T],List) -> [H|merge(T,List)].

len([]) -> 0;
len([_|T]) -> len(T) + 1. 


factorial_i(N) -> factorial_i(N,1).

factorial_i(0,Ret) -> Ret;
factorial_i(N,Ret) -> factorial_i(N-1,Ret*N).


i_length(List) -> i_length(List,0).

i_length([], Ret) -> Ret;
i_length([_|T], Ret) -> i_length(T,Ret+1).


i_sum(List) -> i_sum(List,0).

i_sum([], Ret) -> Ret;
i_sum([H|T],Ret) -> i_sum(T, Ret+H).

subtractN(_,[]) -> [];
subtractN(N,[H|T]) -> [H-N|subtractN(N,T)].


append(E,[]) -> [E];
append(E,[H|T]) -> [H|append(E,T)].


i_subtractN(N, List) -> i_subtractN(N, List, []).

i_subtractN(_,[],RetList) -> RetList;
i_subtractN(N,[H|T], RetList) -> i_subtractN(N,T, RetList++[H-N]).

negativAtTheEnd([]) -> [];
negativAtTheEnd([H|T]) when H < 0 -> negativAtTheEnd(T) ++ [H];
negativAtTheEnd([H|T])-> [H|negativAtTheEnd(T)].


i_negativAtTheEnd(List) -> i_negativAtTheEnd(List, []).

i_negativAtTheEnd([],RetList) ->RetList;
i_negativAtTheEnd([H|T],RetList) when H < 0 -> i_negativAtTheEnd(T, RetList ++ [H]) ;
i_negativAtTheEnd([H|T],RetList) -> i_negativAtTheEnd(T, [H|RetList]).




