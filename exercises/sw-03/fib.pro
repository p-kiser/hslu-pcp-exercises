
fib(0,0).                           % base rule 1
fib(1,1).                           % base rule 2
fib(N,F) :-                         % general rule
    N > 1,
    N1 is N - 1, N2 is N - 2,
    fib(N1, F1), fib(N2, F2),       % recursive call
    F is F1 + F2.               

fib_tr(N, F) :- fib_tr(N, 0, 1, F). % call accumulator
fib_tr(0, A, _, A).                 % simple case
fib_tr(N, A, B, F) :-               % general case
    N1 is N - 1,                    % new argument N1
    N1 >= 0,                        % avoid underflow
    Sum is A + B,                   % accumulator Sum
    fib_tr(N1, B, Sum, F).          % tail-recursisve call

:- dynamic fib_as/2.
fib_as(0, 0).                       % base case 1
fib_as(1, 1).                       % base case 2
fib_as(N, F) :-                     % general rule
    N > 1,                          % allow no negative numbers
    N1 is N-1,
    N2 is N-2,
    fib_as(N1, F1),                 % calculate F1 = fib(N-1)
    fib_as(N2, F2),                 % calculate F2 = fib(N-2)
    F is F1+F2,
    asserta(fib_as(N, F)).          % assert new fact

io_fib :-
    write('Gib eine Zahl ein: '), read(X),
    fib_tr(X,Y),
    format('Die ~d. Fibonacci-Zahl ist ~d', [X, Y]).
