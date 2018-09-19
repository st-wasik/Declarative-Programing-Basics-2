-module(sort).
-export([insertsort/1, insert/2, partition/2, quicksort/1, selectsort/1, min/1, del_e/2, map_add/2, map_find/2]).

insert(A,[]) -> [A];
insert(A,[H|T]) when A < H -> [A,H|T];
insert(A, [H|T]) -> [H|insert(A,T)].

insertsort([]) -> [];
insertsort([H]) -> [H];
insertsort([H|T]) -> insert(H, insertsort(T)).


quicksort([]) -> [];
quicksort([H|T]) -> 
	{S,L} = partition(H,T),
	quicksort(S) ++ [H] ++ quicksort(L).

fst({A,_}) -> A.
snd ({_,B}) -> B.
	
partition(_, []) -> {[],[]};
partition(A, [H|T]) when A > H ->  
	{S,L} = partition(A,T),
	{[H|S], L};
	
partition(A, [H|T]) ->  
	{S,L} = partition(A,T),
	{S, [H|L]}.
	
	
	
min([A]) -> A;
min([H|T]) ->
	Min = min(T),
	if(Min < H) -> Min;
	true -> H
end.

del_e(_,[]) ->[];
del_e(E,[H|T]) when E =:= H -> T;
del_e(E,[H|T]) -> [H|del_e(E,T)]. 

selectsort([L]) -> [L];
selectsort(L) -> 
	M = min(L),
	List = del_e(M,L),
	[M|selectsort(List)].
	
	
%[{Key, Value}]

map_add([{Key, Value}| T], {K, V}) -> [{Key, Value}]++map_add(T, {K, V});
map_add([], {K, V}) -> [{K,V}].

map_find([], _) -> {};
map_find([{Key, Value}| _], K) when Key =:= K -> {Value};
map_find([_| T], K) ->map_find(T, K).



	


	
	
	
	
	