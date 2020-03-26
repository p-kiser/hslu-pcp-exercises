add(X, L, [X | L]).

% a) tail/3

add_tail(X, [], [X]).           % leere liste
add_tail(X, [H | []], [H,X]).   % liste mit einem element
add_tail(X, [H | T], L) :-      % allgemeine regel    
    add_tail(X, T, L1),
    L = [H | L1].

% b) del/3

del([],_,[]).                   % empty list
del([X | T], X, T).             % X is head
del([H | T], X, L):-            
    del(T, X, L1),
    L = [H | L1].

% c) mem/2

mem_d(X, L) :-
    del(L,X,L1), L \== L1.

% d) rev_acc/3

%rev_acc(L, A, R).
rev_acc([], L, L).
rev_acc([H | T], A, L) :-
    rev_acc(T, [H | A], L).

% e) rev/2
rev(L, R) :- rev_acc(L, [], R).
