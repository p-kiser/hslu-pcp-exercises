# Imperative Sprachen am Beispiel C & Java

Die Programmiersprachen C und Java sind beide _imperativ_, _strukturiert_ und _prozedural_. Java ist zusätzlich _objektorientiert_.

Java basiert auf C und die Syntax und Semantik sind weitgehend identisch:

- Gemeinsame Schlüsselwörter (`char`, `double`, `enum`, `if`, ...)
- Gleiche Klammerung von Blöcken (`{` und `}`)
- Gleiche Syntax und Semantik für die zentralen Kontrollstrukturen (if, if-else, for- & while-Schleifen)
- Gleiche elementare Datentypen (int, char, float, ...)

## Datentypen in C

C kennt elementare Datentypen wie int, char oder double und die Datenstruktur Array. Zusammengesetzte Datentypen können mit Hilfe von Strukturen (`struct`) und Typendefinitionen (`typedef`) erzeugt werden.

Beispiel:

```c
typedef struct {
    int x;
    int y;
    char color;
} point_type;

point_type pt;
pt.x = 100;
pt.y = 200;
```

## Abstrakte Datentypen

Abstrakte Datentypen (ADT) sind mathematische Modelle für Datenstrukturen und darauf definierte Operationen (mit vorgegebenem Effekt). Die Semantik ist vorgegeben, die Implementierung nicht.

Typische Beispiele für ADTs:

| Name   | Operationen                          |
| ------ | ------------------------------------ |
| Stack  |  init, push, pop, top                |
| Queue  |  init, add, remove                   |
| Matrix | addition, multiplication, inverse... |

## Von ADT zu OOP

ADT bieten Datenstrukturen und darauf klar definierte Operationen (resp. Funktionen). Die Implementierung der Datenstruktur ist grundsätzlich getrennt und unabhängig von der Implementierung der dazugehörigen Funktionen. Eine der Hauptmotivationen für die Objektorientierung war das zusammenbringen von Daten und Operationen.

Klassen haben definierte Zustände (Daten, Instanzvariablen) und Verhalten (Methoden). Die Funktionen "hängen" direkt and den Daten. In diesem Sinne kann OO als eine Weiterentwicklung von ADTs verstanden werden.

## Packages und Sichtbarkeit

Mit der Definition von Klassen und Packages (hierarchischen Gruppen von Klassen) wurden auch Fragen der Sichtbarkeit relevant(er): Von wo aus kann auf was (Methode / Variable) zugegriffen werden?

Java verwendet dafür eine vierstufige Sichtbarkeit, deklariert durch die vier Zugriffsmodifizierer:

- `private`
- `default`
- `protected`
- `public`

Java erweitert C im wesentlichen um folgende
Konzepte:

- Klassen und Instanzen
- Interfaces
- Packages
- Sichtbarkeit
- Exception Handling

### ADT Beispiel: Stack

Ein Stack ist eine Sammlung von Elementen mit bestimmter Struktur. Neue Elemente könnten hinzugefügt werden (Operation `push`), das zuletzt hinzugefügte Element kann abgefragt werden (`top`) und mit `pop` vom Stack entfernt werden.

_LIFO-Prinzip_: Last-in-first-out

### Implementierung in C

Einfache Implementation eines Stacks in C. Typendefinitionen:

```c
#define STACK_SIZE 3
#define STACK_EMPTY_INDEX -1
#define STACK_DUMMY_ELEMENT -1337 // arbitrary number

typedef int element;
typedef struct {
    element stackArray[STACK_SIZE];
    int index;
} stack;
```

Signaturen der Stack-Operationen:

```c
stack init(); // returns new empty stack
stack push(element e, stack s); // adds element to stack
element top(stack s); // returns top element
stack pop(stack s); // removes top element
void print(stack s); // prints all elements
```

Implementation von `init()`:

```c
// returns new empty stack
stack init() {
    stack s;
    s.index = STACK_EMPTY_INDEX;
    return s;
}
```

Implementation von `push(...)`:

```c
// adds element to stack
stack push(element e, stack s) {
  if (s.index + 1 < STACK_SIZE) {
    // there is space for one more element
    s.index++;
    s.stackArray[s.index] = e;
  } else {
    printf("ERROR - push: stack full! Cannot add %i\n", e);
  }
  return s;
}
```

Implementation von `top(...)`:

```c
// returns top element
element top(stack s) {
  if (s.index > STACK_EMPTY_INDEX) {
    return s.stackArray[s.index];
  } else {
    printf("ERROR - top: stack empty!\n");
    return STACK_DUMMY_ELEMENT;
  }
}
```

Implementation von `pop(...)`:

```c
// removes top element from stack
stack pop(stack s) {
  if (s.index > STACK_EMPTY_INDEX) {
    s.index--;
  }
  return s;
}
```

Bemerkungen:

Strukturen werden in C als Werte (_call by value_) übergeben. Wenn eine Referenz übergeben werden soll, muss das mit Pointern gemacht werden. Auf die Verwendung von Pointern und verketteten Listen wurde in diesem Beispiel der Einfachheit halber verzichtet. Aus dem gleichen Grund wurde int als Datentyp für die Elemente gewählt. Grundsätzlich hätte hier jeder beliebige Typ gewählt werden können.

### Implementierung in Java

In Java können die Daten und die Operationen des ADT Stack in einer Klasse zusammengefasst werden. Stack-Operationen können mit Hilfe entsprechender Instanz-Methoden direkt auf Stack-Instanzen aufgerufen werden:

```java
Stack myStack = new Stack();
myStack.top();
myStack.push(new Element(42));
```

Statt wie vorher in C:

```c
stack myStack = init();
top(myStack);
myStack = push(42, myStack);
```
