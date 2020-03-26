% 5. Green cut

% warn(T) :- T < 80, write('Temperatur ok'), !.
% warn(T) :- T < 100, write('Temperatur sehr warm'), !.
% warn(_) :- write('Temperatur zu heiss').

warn(T) :- T < 80, write('Temperatur ok').
warn(T) :- T >= 80, T < 100, write('Temperatur sehr warm').
warn(T) :- T >= 100, write('Temperatur zu heiss').

% Der Code oben ist eine Optimierung, weil dort nicht
% in allen Fällen alle drei Prädikate geprüft werden müssen.
% Weil das Resulat in beiden Fällen das gleiche ist,
% handelt es sich um einen Green Cut

% 6. Red cut
  
mem(X, [X | _]).      
mem(X, [_ | T]) :- 
    mem(X, T).

% alle permutationen von a,b & c:
% L = [_, _, _], mem(a, L), mem(b, L), mem(c, L)

% nur eine Permutation:
% L = [_, _, _], mem(a, L), mem(b, L), mem(c, L), !.

% Sobald alle vier Bedinungen gematcht sind, werden die Variablen gebunden.
% Dadurch werden keine weiteren Lösungen gefunden.
% Weil das Resultat anders ist (1 Lösung statt 6), handelt es sich um
% einen Red Cut.