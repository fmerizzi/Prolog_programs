% render solutions nicely.
:- use_rendering(sudoku).

:- use_module(library(clpfd)).

% Partial Latin Square completion: fill a square so that no value is repeated in any row or column
pls(Rows) :-
        length(Rows, 9),
        concatenate(Rows, Vs), Vs ins 1..9,
        apply_all_distinct(Rows),
        transpose(Rows, Columns),
        apply_all_distinct(Columns).

% given a list of lists, create a single list with all the elements in order
concatenate([],[]).
concatenate([[]|L1],L2):- concatenate(L1,L2).
concatenate([[E1|L1]|LZ],[E1|LN]) :- concatenate([L1|LZ],LN).

apply_all_distinct([]).
apply_all_distinct([L1|R]):- all_distinct(L1), apply_all_distinct(R).


problem(1, [[9,8,_, _,5,_, _,2,1],
            [_,_,_, 1,_,3, _,8,5],
            [3,_,1, _,2,_, 7,_,_],

            [1,_,_, 5,_,7, _,_,4],
            [_,_,4, 8,_,_, 1,_,7],
            [_,9,_, _,6,_, _,_,_],

            [5,_,_, 2,_,_, _,7,3],
            [4,_,2, _,1,_, 5,_,_],
            [_,6,_, _,4,5, _,_,9]]).


/** <examples>

?- problem(1, Rows), PLS(Rows).
*/
