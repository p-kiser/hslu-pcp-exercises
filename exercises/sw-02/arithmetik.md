**a) Wie wir dieser Term ausgewertet: `X is 16 / 4 / 2` ?**

Die Antwort ist `X = 2`, weil der Term von links nach rechts ausgewertet wird.
Aus der Doku:

| precedence |  type  |  name |
| ---------- | ------ | ----- |
| 400        | `yfx`  | `/`   |
|  700       |  `xfx` |  `is` |

_https://www.swi-prolog.org/pldoc/man?section=operators_

    ?- X is 16/ 4 / 2.
    X = 2.

**b) Was ist die Antwort auf die Anfrage Y=3 , X = Y-1?**

Die Antwort ist:

    ?- Y=3 , X = Y-1.
    Y = 3,
    X = 3 - 1.

**c) Was ist die Antwort auf die Anfrage `Y = 3, X is Y - 1`?**

    ?- Y = 3, X is Y - 1.
    Y = 3,
    X = 2.

**Wie lässt sich das unterschiedliche
Resultat gegenüber der Teilaufgabe b) erklären?**

Der Grund dafür ist, dass `=` nur ein Matching durchführt, und `is` ein Zuweisungsoperator ist. Deshalb wird in diesem Fall die arithmetische Auswertung von `Y - 1` ausgeführt und das Resultat der Variable `X` zugewiesen.

`X is Y - 1` => `X is (3 - 1)` => `X is 2`
