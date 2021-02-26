%Ex 1

is_sorted([A]).
is_sorted([H,H1|T]) :- H1=<H, is_sorted([H1|T]).
bubblesort([],A).
bubblesort([A|[]],[A]).
bubblesort([A, B | T], [A | L]) :- A>B, bubblesort([B|T],L).
bubblesort([A, B | T], [B | L]) :- A=<B, bubblesort([A|T],L).

bubble(A,B) :- is_sorted(A), B=A.
bubble(A,B) :- not(is_sorted(A)), bubblesort(A,C), bubble(C,B).

%Ex 2
vector_sum([],0).
vector_sum([H|T],B) :- vector_sum(T,C), B is H + C.
vector_length([],0).
vector_length([H|T],B) :- vector_length(T,C), B is C+1.

check_zero([]).
check_zero([H|T]) :- H\=0, fail.
check_zero([H|T]) :- H=0, check_zero(T).
check_minus([]).
check_minus([H|T]) :- H<0, fail, !.
check_minus([H|T]) :- H>=0, check_minus(T).
minusone([],[],0).
minusone([H|A],[H|B],0):-minusone(A,B,0).
minusone([H|A],[Y|B],C) :- X is C-1, Y is H-1, minusone(A,B,X).

is_graphic(A, RES) :- check_zero(A), RES='T'.
is_graphic([H|T], RES) :- check_minus([H|T]), bubble([H|T],[H1|B]), minusone(B,C,H1), is_graphic(C, RES).
is_graphic(A,RES) :- RES='N'.


%Ex 3
any_zero([]).
any_zero([H|T]) :- H=0, fail.
any_zero([H|T]) :- H\=0, any_zero(T).

is_connected(A,RES) :- vector_sum(A,S), vector_length(A,N), S>=(2*N-2), any_zero(A), is_graphic(A, RES).
is_connected(A,RES) :- RES='N'.