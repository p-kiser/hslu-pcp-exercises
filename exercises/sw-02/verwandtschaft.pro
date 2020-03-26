female(mary). female(liz). female(mia). female(tina). female(ann). female(sue). % all females
male(mike). male(jack). male(fred). male(tom). male(joe). male(jim).            % all males
parent(mary, mia). parent(mary, fred). parent(mary, tina).                      % all childern of mary
parent(mike, mia). parent(mike, fred). parent(mike, tina).                      % all children of mike
parent(liz, tom). parent(liz, joe).                                             % allchildern of liz
parent(jack, tom). parent(jack, joe).                                           % all childern of jack
parent(mia, ann).                                                               % all childern of mia
parent(tina, sue). parent(tina, jim).                                           % all childern of tina
parent(tom, sue). parent(tom, jim).                                             % all childern of tom

% 1. Verwandtschaftsbeziehungen %

% a) mother/2 & father/2

mother(M,C) :- parent(M, C), female(M).
father(F,C) :- parent(F, C), male(F).

% ?- mother(X,jim).
% X = tina 


% b) sibling/2

sibling(X, Y) :- parent(Z, X) , parent(Z, Y).

% c) grandmother/2

grandmother(G,C) :- mother(G, P), parent(P, C).

% d) offspring/2

offspring(O,A) :- parent(A, O).
offspring(O,A) :-
    parent(A, Z),
    offspring(O, Z).

% 5. Eigene Familien-Operatoren definieren %

% a) mother
:- op(600, xfx, mother).    
% b) offspring
:- op(700, xfx, offspring).
