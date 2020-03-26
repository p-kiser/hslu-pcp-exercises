:- use_module(library(clpr)).
:- use_module(library(clpfd))

% 3 Rätsel lösen

% a) Lösen Sie mit Hilfe von CLP in Prolog das folgende Rätsel:
% "Die Tochter ist 15 Jahre alt, die Mutter dreimal so alt.
% In wie vielen Jahren wird die Mutter nur noch doppelt
% so alt sein wie ihre Tochter?"

solve:-
    { T = 15, M = 3 * T, 2 * (T + J) = M + J},
    write(J).

% ?- { T = 15, M = 3 * T, 2 * (T + J) = M + J}.

% b) Lösen Sie analog zum in der Vorlesung gelösten Zahlenrätsel
% (SEND + MORE = MONEY) mit einem eigenen Prolog-Programm
% das folgende Zahlenrätsel:
%    DONALD
%   +GERALD
%   -------
%    ROBERT

donald_gerald_robert([D,O,N,A,L,D]+[G,E,R,A,L,D]=[R,O,B,E,R,T]) :-
    Vars = [A,B,D,E,G,L,N,O,R,T],   % define the variables
    Vars ins 0..9,                  % define the domain for the vars
    all_distinct(Vars),             % all variables must be different

    D*100000 + O*10000 + N*1000 + A*100 + L*10 + D +
    G*100000 + E*10000 + R*1000 + A*100 + L*10 + D #=
    R*100000 + O*10000 + B*1000 + E*100 + R*10 + T,

    D #\= 0, G #\= 0,               % numbers cannot start with zero
    label(Vars).                    % assign values to the variables

% ?- donald_gerald_robert(As, Bs, Cs).