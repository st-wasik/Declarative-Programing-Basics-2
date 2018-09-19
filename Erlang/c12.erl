-module(c12).
-export([palindrome/1, palindrome_v2/1, elem/2, before/3, accept_reg/1]).

last([H]) -> H;
last([_|T]) -> last(T).

delete_last([_]) -> [];
delete_last([_|T]) -> delete_last(T).

palindrome([]) -> true;
palindrome([_]) -> true;
palindrome([H|T]) -> 
	Temp = last(T),
	if H =:= Temp -> palindrome(delete_last(T));
	true -> false
end.

palindrome_v2([]) -> true;
palindrome_v2([_]) -> true;
palindrome_v2([H|T]) -> 
	Temp = lists:last(T),
	if H =:= Temp -> palindrome_v2(lists:droplast(T));
	true -> false
end.

elem(_, []) -> false;
elem(A, [H|_]) when A =:= H -> true;
elem(A,[_|T]) -> elem(A,T).

before(_,_,[]) -> false;
before(_,_,[_]) -> false;
before(A,B,[H|T]) ->
	Temp = before(B,T),
	if 
		A =:= H, Temp -> true;
		true -> before(A,B,T)
	end.

% 110(11|10)+00(10|110)*00

% 110
accept_reg([1,1,0|T]) -> accept_reg2(T);
accept_reg(_) -> false.

% (11|10)+
accept_reg2([1,1|T]) -> accept_reg3(T);
accept_reg2([1,0|T]) -> accept_reg3(T);
accept_reg2(_) -> false.

% (11|10)+00
accept_reg3([1,1|T]) -> accept_reg3(T);
accept_reg3([1,0|T]) -> accept_reg3(T);
accept_reg3([0,0|T]) -> accept_reg5(T);
accept_reg3(_) -> false.

% (10|110)*00
accept_reg5([1,0|T]) -> accept_reg5(T);
accept_reg5([1,1,0|T]) -> accept_reg5(T);
accept_reg5([0,0]) -> true;
accept_reg5(_) -> false.