% render solutions nicely.
:- use_rendering(sudoku).

:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, 9),
        concatenate(Rows, Vs), Vs ins 1..9,
        apply_all_distinct(Rows),
        transpose(Rows, Columns),
        apply_all_distinct(Columns),
        Rows = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
        blocks(R1, R2, R3), blocks(R4, R5, R6), blocks(R7, R8, R9).

% given a list of lists, create a single list with all the elements in order
concatenate([],[]).
concatenate([[]|L1],L2):- concatenate(L1,L2).
concatenate([[E1|L1]|LZ],[E1|LN]) :- concatenate([L1|LZ],LN).

apply_all_distinct([]).
apply_all_distinct([L1|R]):- all_distinct(L1), apply_all_distinct(R).



blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        all_distinct([A,B,C,D,E,F,G,H,I]),
        blocks(Bs1, Bs2, Bs3).

problem(1, [[_,_,_, _,_,_, _,_,_],
            [_,_,_, _,_,3, _,8,5],
            [_,_,1, _,2,_, _,_,_],

            [_,_,_, 5,_,7, _,_,_],
            [_,_,4, _,_,_, 1,_,_],
            [_,9,_, _,_,_, _,_,_],

            [5,_,_, _,_,_, _,7,3],
            [_,_,2, _,1,_, _,_,_],
            [_,_,_, _,4,_, _,_,9]]).


/** <examples>

?- problem(1, Rows), sudoku(Rows).
*/
