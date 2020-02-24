# Imperative Programmierung

1. Charakterisieren Sie in eigenen Worten, wie imperative Programmierung funktioniert. Aus welchen Grundelementen sind imperative Programme aufgebaut? Wie werden derartige Programme ausgeführt, wie verläuft der Kontrollfluss?

> Sequentielles Abarbeiten von Anweisungen.

2. In welchem Verhältnis stehen imperative und strukturierte Programmierung?

> Strukturierte Programmierung ist eine Spezialisierung der imperativen Programmierung mit der Einschränkung, dass nur gewisse Kontrollstrukturen (Sequenzen , Auswahl & Wiederholungen) verwendet werden sollen.
> Insbesondere soll kein GOTO verwendet werden.

3. Durch was hebt sich die prozedurale Programmierung vom imperativen Programmierparadigma ab?

> Spezialisierung des imperativen Paradigmas, bietet Unterteilung von Programmen in Teilprogramme (= Prozedur, auch: Routine, Unterprogramm, Funktion).

## Imperative Programmierung 2

1. Was ist ein ADT?

> Abstrakte Datentypen (ADT) sind mathematische Modelle für Datenstrukturen und darauf definierte Operationen (mit vorgegebenem Effekt)
> – Semantik ist vorgegeben, nicht aber Implementierung

2. Worin unterscheidet sich die Implementierung von einem ADT in C fundamental von einer Implementierung in Java?

> Zusammenbringen von Daten und Operationen war eine der Hauptmotivationen für „Objektorientierung“
> Die Funktionen „hängen“ direkt an den Daten: Klassen haben definierte „Daten“ (Zustand: Instanzvariablen) und „Funktionen“ (Verhalten: Methoden)

3. Um welche Konzepte erweitert die OO- Programmiersprache Java im wesentlichen die prozedurale Programmiersprache C?

> – Klassen + Instanzen: class, extends, instanceof, new, this, super
> – Interfaces:interface,implements
> – Packages:package,import
> – Sichtbarkeit:private,protected,public
> – Exception-Handling:try,catch,finally,throw(s)
