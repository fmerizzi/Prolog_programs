% render solutions nicely.
:- use_rendering(chess).

%%	n_queens(?N, ?Cols) is nondet.
%
%	@param The k-th element of Cols is the column number of the
%	queen in row k.
%	@author Markus Triska

:- use_module(library(clpfd)).

% given two queens, which differ of R rows, and are on column M and N, when do they threaten each other?
% 1) if they are on the same column: M=N
% 2) if they differ of exactly R: abs(M-N) = R


n_queens(N, Qs) :-
	length(Qs, N), % proper length
	Qs ins 1..N, % define domain
	safe_queens(Qs). % impose constraints

safe_queens([]). % base case
safe_queens([Q|Qs]) :- % pops out one queen Q
	noattack(Qs, Q, 1), % constraints on Q: must not threaten Qs
	safe_queens(Qs). % impose constrains on Qs: must not threaten each other

noattack([], _, _).
noattack([Q|Qs], Q0, D) :- % constraints on Q0: must not threaten Q (difference in row=D)
	Q0 #\= Q, % not the same column
	abs(Q0 - Q) #\= D, % not the same diagonal
	D1 #= D + 1, % go in the following row
	noattack(Qs, Q0, D1). % constraint on Q0: must not threaten any other queen in Qs


/** <examples>

?- n_queens(8, Qs), labeling([ff], Qs).
?- n_queens(24, Qs), labeling([ff], Qs).
?- n_queens(100, Qs), labeling([ff], Qs).

*/
