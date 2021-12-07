
# Consec, given list and value, return the consecutive value in the list 

consec([N,X|_],N,X):-!.
consec([_|C],N,X):-
    consec(C,N,X). 

# EX3 from prolog exercise 
# return list of couples from given list that the sum is N 
# my half-ass solution
question([],_,L2,Z):-
    Z = L2.

question([[A,B]|C],N,L2,Z):-
    A >= 1, B >= 1,
    A =< 9, B =< 9,
    N is A+B,
    question(C,N,[[A,B]|L2],Z).

question([_|C],N,L2,Z):-
    question(C,N,L2,Z).
# The better proposed solution
question1([],_,[]).
question1([[A,B]|R],N,[[A,B]|S]):-
    A >= 1, B >= 1,
    A =< 9, B =< 9,
    N is A+B,
    question1(R,N,S).
question1([_|R],N,S):-
    question1(R,N,S).

# sum element of a list 
# Fancy way 

listsum([],0):-!.
listsum([A|B],SUM):-
    listsum(B,SUM1),
    SUM is SUM1 + A

# reverse a list 
reverse([],K,K).
reverse([T|M],A,B):-
    reverse(M,A,[T|B]).

# COUPLES actual solution 

couples([],L2,0,L2):-!.
    

couples([A,B|L],L2,N,D):-
    couples(L,L2,N,[[A,B]|D]),
    B >= A.
couples([_,_|L],L2,N,D):-
    couples(L,L2,N1,D),
    N is N1+1.

couples(L,L2,NUM):-
    couples(L,L2,NUM,[]).ù

trace, couples([1,2,3,4,7,1,2,2,9,1],C,N).

# Self made exam, lets say first and third, with the sum greater than N. 
# with signature. It works ok. 
trace, triplets([1,2,3,4,7,1,2,2,9,1],C,5).

triplets([_,_],A,B,C):-
    triplets([],A,B,C).
triplets([],L2,_,L2):-!.

triplets([A,T,B|L],L2,NUM,LIST):-
    triplets([T,B|L],L2,NUM,[[A,B]|LIST]),
    A + B > NUM. 
triplets([_,T,B|L],L2,NUM,LIST):-
    triplets([T,B|L],L2,NUM,LIST).

triplets(L,L2,NUM):-
    triplets(L,L2,NUM,[]).

# The couples exam done with a recursive solution 
# (very nice) 

couples([],[],0):-!.

couples([[A,B]|L],[[A,B]|C],N):-
    couples(L,C,N),
    B >= A.
couples([[_,_]|L],C,N):-
    couples(L,C,N1),
    N is N1 + 1. 

# The same exam but done with an iterative solution

couples(A,B,C):-
	couples(A,B,C,[])
couples([],0,C,C).

couples([A,B|L],N,C,L2):-
    B >= A,
    couples(L,N,C,[[A,B]|L2]).

couples([_,_|L],N,C,L2):-
    couples(L,N1,C,L2),
    N is N1+1.

### SELF MADE EXAM, sum of couples

couples([],[],_).

couples([A,B|L],[[A+B]|L2],N):-
    couples(L,L2,N),
    A + B >= N. 

couples([_,_|L],L2,N):-
    couples(L,L2,N).

### CHECK if is PALINDROME 

palindrome(G,G):-!.
palindrome([A|L],L2):-
    palindrome(L,[A|L2]). 

#Count not leaves

count(nil,0).
count(t(_,nil,nil),0).

count(t(_,L,R),N):-
    count(L,N1),
    count(R,N2),
    N is N1 + N2 +1. 

#Count leaves 

count(nil,1).
count(t(_,nil,nil),1).

count(t(_,L,R),N):-
    count(L,N1),
    count(R,N2),
    N is N1 + N2.

#list append 
append([],X,X).
append([A|X],Z,[A|Y]):-
    append(X,Z,Y).
    
trace, append([1,2],[2,3],X)








