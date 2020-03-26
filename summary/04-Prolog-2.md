# Prolog (2)

## Optimierungen

Prolog verwendet grundsätzlich Backtracking, d.h. Tiefensuche zur Problemlösung. Backtracking ist grundsätzlich nicht sehr effizient, kann aber durch zwei Methoden optimiert werden:

- Endrekursion
- Assertions

Wir werden diese anhand des Beispiels der Fibonacci-Folge anschauen.

## Endrekursion

Endrekursion (_tail recursion_) beschreibt eine Prozedur, die folgende Kriterien erfüllt:

- nur _ein_ rekursiver Aufruf
- der rekursive Aufruf erfolg am _Schluss_ der Prozedur
- alle Aufrufe sind deterministisch

Der Vorteil davon ist, dass kein Backtracking notwendig ist. Eine Endrekursion kann als Iteration ohne zusätzlichen Speicherplatz ausgeführt werden.

Allgemeines Beispiel:

```prolog
p(...) :-   ...       % no recursive call in the body
p(...) :-   ...       % no recursive call in the body
p(...) :-   ...,      % all deterministic and
            ...,      % no recursive calls until here.
            p(...).   % here: tail-recusive call
```

Eine derartige endrekursive Prozedur wird in Prolog als Iteration durchgeführt und braucht deshalb viel weniger Speicherplatz als rekursive Aufrufe mit Backtracking.

Diese Optimierung bezeichnet man als _last call optimization_.

### Beispiel: Fibonacci (naiv)

Eine naive rekursive Implementation der Fibonacci-Folge in Prolog könnte folgendermassen aussehen:

```prolog
fib(0,0).
fib(1,1).
fib(N,F) :-
    N > 1,
    N1 is N - 1, N2 is N - 2,
    fib(N1, F1), fib(N2, F2),
    F is F1 + F2.
```

Diese Implementation funktioniert zwar, ist aber nicht sehr effizient:

```
?- fib(7,X).
X = 13 .

?- fib(30,X).
ERROR: Out of local stack
```

Die Ursache dafür ist schnell erkennbar, wenn man den Aufrufbaum anschaut.
Bei der Abfrage der siebten Fibonacci-Zahl wird zum Beispiel die zweite Fibonacci-Zahl bereits fünf mal berechnet.

![./img/fibtree.png](Aufrufbaum zur siebten Fibonacci-Zahl)

### Beispiel: Fibonacci (tail recursion)

Die Umwandlung von allgemeinen rekursiven Prozeduren in endrekursive ist im Allgemeinen nicht trivial und wird typischerweise durch die Verwendung zusätzlicher Argumente (sogenannte _Akkumulatoren_) zur Speicherung von Zwischenwerten. Damit kann das Schlussresultat inkrementell berechnet werden.

```prolog
fib_tr(N, F) :- fib_tr(N, 0, 1, F).     % call accumulator
fib_tr(0, A, _, A).                     % simple case
fib_tr(N, A, B, F) :-                   % general case
    N1 is N - 1,                        % new argument N1
    N1 >= 0,                            % avoid underflow
    Sum is A + B,                       % accumulator Sum
    fib_tr(N1, B, Sum, F).              % tail-recursisve call
```

```
?- fib_tr(1000,X).
X = 434665576869374564356885276750406258025646605173717804
0248172908953655541794905189040387984007925516929592259308
0322634775209689623239873322471161642996440906533187938298
969649928516003704476137795166849228875 .
```

## Optimierung durch Assertions: Memoization

Die Wissensdatenbank von Prolog kann durch Programme manipuliert werden. D.h. Fakten und Regeln können dynamisch hinzugefügt oder gelöscht werden. Dies kann genutzt werden, um Programme zu optimieren. Dieser Vorgang wird _Memoization_ (auch: Caching) genannt.

### Prädikate

#### `dynamic/1`

Ist notwendig, damit ein statisches (aus der Datei geladenes) Prädikat zur Laufzeit modifiziert werden darf.

```prolog
:- dynamic bigger/2.
bigger(elephant, horse).
bigger(horse, dog).
bigger(horse, sheep).
```

#### `listing/1`

Mit diesem Prädikat können alle Fakten und Regeln angezeigt werden:

```prolog
?- listing(bigger).
:- dynamic bigger/2.
bigger(elephant, horse).
bigger(horse, dog).
bigger(horse, sheep).
```

#### `asserta/1`

Neue Fakten und Regel als erste Regel hinzufügen:

```prolog
?- asserta(bigger(me,you)).
true.

?-listing(bigger).
:- dynamic bigger/2.

bigger(me, you).
bigger(elephant, horse).
bigger(horse, dog).
bigger(horse, sheep).
```

#### `assertz/1`

Neue Fakten und Regel als erste Regel hinzufügen:

```prolog
?- assertz(bigger(elephant, me)).
true.

?-listing(bigger).
:- dynamic bigger/2.

bigger(me, you).
bigger(elephant, horse).
bigger(horse, dog).
bigger(horse, sheep).
bigger(elephant, me).
```

#### `retract/1`

Fakten und Regeln aus der Wissensdatenbank entfernen:

```prolog
?- retract(bigger(me, you)).
true.

?- listing(bigger).
:- dynamic bigger/2.

bigger(elephant, horse).
bigger(horse, dog).
bigger(horse, sheep).
bigger(elephant, me).
```

### Beispiel Fibonacci mit Memoization

```prolog
:- dynamic fib_as/2.
fib_as(0, 0).               % base case 1
fib_as(1, 1).               % base case 2
fib_as(N, F) :-             % general rule
    N > 1,                  % allow no negative numbers
    N1 is N-1,
    N2 is N-2,
    fib_as(N1, F1),         % calculate F1 = fib(N-1)
    fib_as(N2, F2),         % calculate F2 = fib(N-2)
    F is F1+F2,
    asserta(fib_as(N, F)).  % assert new fact
```

## Listen (Datenstruktur)

Eine Liste ist eine endliche Sequenz von Elementen und wird in Prolog mit eckigen Klammern dargestellt. Listen-Elemente sind beliebige Prolog-Terme wie beispielsweise Zahlen, Atome oder Listen.

```prolog
?- X = [a, b, c].
X = [a, b, c].

?- Y = [d, e, f(X), [x, y]].
Y = [d, e, f(X), [x, y]].

?- Z = [].
Z = [].
```

Nicht-leere Listen bestehen immer aus einem _Head_ (erstes Element) und einem _Tail_ (Rest der Liste), wobei der Tail wiederum eine Liste ist. Listen sind also rekursiv aufgebaut.

![[a,b,c] als Baum](./img/abc.png)

### Listen-Operator `|`

Mit der |-Notation kann eine Liste in Head und Tail unterteilt werden:

```prolog
?- [a, b, c] = [H | T];
H = a,
T = [b,c].
```

Diese Notation kann auch allgemeiner eingesetzt
werden, indem wir eine beliebige Anzahl von
Elementen einer Liste, gefolgt von `|` und einer Liste
mit den restlichen Elementen angeben

```prolog
L = [a | [b, c]], L = [a, b | [c]], L = [a, b, c | []].
L = [a, b, c].
```

Damit kann beispielsweise das zweite und dritte Element einer Liste auslesen:

```prolog
?- [_, X2, X3 | _] = [a, b, c, d, e, f].
X2 = b,
X3 = c.
```

### Listenoperationen

> TODO: Listen

## Konjunktion und Disjunktion

> TODO

## Negation in Prolog

> Mary mag alle Tiere ausser Schlangen.

Wie kann man das in Prolog ausdrücken? Die erste Hälfte kann sehr einfach ausgedrückt werden:

```prolog
likes(mary, X) :- animal(X).
```
