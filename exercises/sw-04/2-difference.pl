% 2 Anwendung der Negation: Mengen-Differenz
% set_difference/3

% simple case
set_difference([],_,[]).

% first element of A is not in Set B
set_difference([HA | TA], B, [HA | TD]) :-
    \+member(HA, B),
    set_difference(TA, B, TD).

% first member of A is in Set B
set_difference([HA | TA], B, D) :-
    member(HA, B),
    set_difference(TA, B, D).

% ?- set_difference([a, b, c, d], [b, d, e, f], [a, c]).
% true .

% ?- set_difference([1, 2, 3, 4, 5, 6], [2, 4, 6], L).
% L = [1, 3, 5] .