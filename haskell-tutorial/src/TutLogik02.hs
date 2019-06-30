-- Unser zweites Modul, es geht um Logik und darum, wie wir Ausdrücke
-- miteinander vergleichen können.

module TutLogik02 where

apfel = "Apfel"
birne = "Birne"

-- == Gleichheit ==
-- Wir können viele Ausdrücke miteinander vergleichen, dabei bekommen
-- wir entweder "True" (wahr) oder "False" (falsch) zurück.

-- Ob zwei Ausdrücke zum gleichen Wert auswerten, testen wir mit "==".
-- Dabei erhalten wir "True", falls die Ausdrücke gleich sind,
-- ansonsten "False".
apfelGleichBirne = apfel == birne -- wertet zu "False" aus
apfelGleichApfel = apfel == apfel -- True
summeGleichDrei = 1+2 == 3
-- Zwei Ausdrücke sind also nicht nur gleich, wenn ihr Code gleich ist,
-- sondern eben auch, wenn sie zum gleichen Ergebnis auswerten. Das sollte
-- aber keine Überraschung sein, ist genau wie in der Mathe.

-- Achtung:
-- Hier treten zwei verschiedene Bedeutungen von "=" auf:
-- Ein einfaches = steht für eine Definition. Ein doppeltes == steht für
-- einen Vergleich (also für ein einfaches = aus der Mathe). Nicht
-- verwirren lassen :).

-- Ob zwei Ausdrücke unterschiedlich sind prüfen wir mit "/=".
apfelUngleichBirne = apfel /= birne -- True
trueGleichFalse = True == False -- False
falseGleichFalse = False == False -- True
-- "/=" wertet also immer zum Gegenteil von "==" aus

-- Am besten lernt ihr, indem ihr für die Defintionen überlegt, zu was Sie
-- auswerten. Gebt dann erst die Namen in GHCi ein und prüft eure Vermutung.
-- Wenn noch Zeit bleibt, solltet ihr Kleinigkeiten an der Definition
-- verändern und voraussagen, wie sich das Ergebnis verändert.

-- Diese Datei könnt ihr in GHCi laden mit dem Befehl: ":l TutLogik02".
-- Wenn ihr etwas geändert habt, könnt ihr dann mit ":r" aktualisieren.

-- Werte lassen sich auch in ihrer Größe vergleichen:
-- Ist Apfel vor Birne im Wörterbuch?
apfelVorBirne = apfel < birne -- ??? (überlegen, dann in GHCi prüfen)
-- Oder dahinter?
apfelHinterBirne = apfel > birne -- ???
apfelVorApfel = apfel < apfel -- ???

-- Die gleichen Tests funktionieren natürlich auch für Zahlen
test1 = 5 < 5
test2 = 5 <= 5 -- kleiner-gleich "≤" schreiben wir als "<="
test3 = 5 == 2+3
test4 = 2*3 /= 4*5

-- Wir können auch mehrere Vergleiche kombinieren, dazu stehen uns die
-- sogenannten boolschen Operatoren "&&" (und), "||" (oder) und "not" (nicht)
-- zur Verfügung.

-- "&&" (und) wertet zu "True" aus, falls beide Seiten zu "True" auswerten
-- Man kann die Verknüpfungen als Wahrheitstabelle darstellen:
-- ┌───────┬───────┬────────┐
-- │   A   │   B   │ A && B │
-- ├───────┼───────┼────────┤
-- │ False │ False │        │
-- │ False │ True  │        │ <- Ist A True und B False, so ist A && B ???
-- │ True  │ False │        │
-- │ True  │ True  │        │ <- Ist A True und B True, so ist A && B ???
-- └───────┴───────┴────────┘
und1 = True && False -- False (Zeile 3 der Tabelle)
und2 = True && True -- True (Zeile 4)
und3 = (3/=4) && (5 > 3) -- ??? (Welche Zeile?)
-- Das letzte Beispiel funktioniert auch ohne Klammern,
-- im Zweifel aber lieber mehr als weniger Klammern verwenden...

-- "||" (oder) wertet zu "True" aus, wenn mindestens eine Seite "True" ergibt
-- "||" heißt also nicht "entweder oder", auch wenn beide Seiten stimmen, kommt
-- "True" zurück.
-- Wieder die Wahrheitstabelle:
-- ┌───────┬───────┬────────┐
-- │   A   │   B   │ A || B │
-- ├───────┼───────┼────────┤
-- │ False │ False │        │
-- │ False │ True  │        │
-- │ True  │ False │        │
-- │ True  │ True  │        │ <- Bei "entweder oder" würde hier "False" stehen
-- └───────┴───────┴────────┘
oder1 = True || False -- True
oder2 = False || False -- False
oder3 = True || (3 == 3) -- ???
oder4 = (True && False) == (False || True) -- ??? Zuerst die Klammern auswerten

-- Tipp: Das Zeichen "|" könnt ihr auf der Tastatur erzeugen, indem ihr <AltGr>
-- und die Taste, auf die "|" gedruckt ist (unten links auf der Tastatur)
-- gleichzeitig drückt.

-- "not" (nicht) macht aus "True" "False" und umgekehrt.
-- ┌───────┬───────┐
-- │   A   │ not A │
-- ├───────┼───────┤
-- │ False │ True  │
-- │ True  │ False │
-- └───────┴───────┘
nicht1 = not False -- True
nicht2 = not (3*2>1 && False) -- ???

-- An dieser Stelle wird es Zeit, unsere KlaPS-Regel zu erweitern:
-- Klammer vor "not" vor Punkt vor Strich vor Vergleich vor "&&" vor "||"
-- Kompakt: ( not * == && ||
klapsTest = not False == True || 3 >= 8 -- ???
-- Wenn wir einen Ausdruck berechnen, müssen wir zuerst die Klammern im Kopf
-- einfügen und dann von innen nach außen auswerten:
-- False == True || 2 + 1 > 3 && True
-- (False == True) || (((2 + 1) > 3) && True)
-- False || (((2 + 1) > 3) && True)
-- False || ((3 > 3) && True)
-- False || (False && True)
-- False || False
-- False

-- == Aufgabe ==
-- Ersetze die "undefined", sodass die Ausdrücke alle zu "True" auswerten:
true1 = not undefined
true2 = undefined && not undefined
true3 = not False == (not True || undefined)
true4 = true1 && (not true2 || undefined)
-- In GHCi testen :)

-- Für welche Belegungen von a,b,c wertet der Ausdruck abc zu wahr aus?
a = undefined
b = undefined
c = undefined

abc = (a || not b) || (not a && c) && not c


-- Für welche Belegungen von e,d wertet der Ausdruck de zu wahr aus?
d = undefined
e = undefined
de = (not e || not d) && (e && d)


-- Gibt es eine Belegung, in der fghij zu True auswertet?
f = undefined
g = undefined
h = undefined
i = undefined
j = undefined
fghij = (not f || not g || not h || not (i && j))
         && (not (not f || not g) && h && i && j)

-- In GHCi testen :-)

-- == Typen ==
-- Was passiert, wenn wir nun wirklich Äpfel mit Birnen vergleichen?
-- Entferne die "--" in der Zeile unten und lade die Datei mit ":r" in GHCi
-- neu.
-- ups = (5 + 3 == "Apfel")

-- Wie die Meldung genau zu lesen ist, damit werden wir uns bald beschäftigen.
-- Aktuell reicht jedoch schon dieser Teil der ersten Zeile, um festzustellen
-- wo der Fehler liegt:
-- "TutLogik02.hs:158:8: error:" (Position kann abweichen)
--  Zeile  --^  ^-- achtes Zeichen in dieser Zeile
-- Wir halten also fest, dass es nicht möglich ist, beliebige Arten von
-- Ausdrücken miteinander zu vergleichen.
--
-- Haskell gruppiert Ausdrücke in verschiedene Gruppen, z.B. Zahlen,
-- Wahrheitswerte, Text, etc.. Diese Kategorien nennt man Typen, jeder Ausdruck
-- hat einen bestimmten Typ. Wertet Haskell einen Ausdruck aus, so erhalten wir
-- einen Wert von diesem Typen.
--
-- Der Compiler prüft, dass wir keinen Unsinn mit Typen anstellen, also nicht
-- Äpfel mit Birnen vergleichen. So ist es z.B. nur möglich, Ausdrücke zu
-- vergleichen, die den gleichen Typen haben.
--
-- Das erinnert etwas an Einheiten aus dem Physikunterricht. Es ist eben nicht
-- möglich, zu sagen, ob "5 km/h < 12 m" stimmt oder nicht.
--
-- Haskell findet die Typen für Ausdrücke meist selbst heraus. Wir können
-- jedoch auch beim Programmieren Typen festlegen. Dies machen wir, indem wir
-- den Namen einer Definition in der Zeile darüber wiederholen, dann "::" und
-- zum Abschluss den Typen schreiben.
-- Ein Beispiel macht das alles viel klarer deutlich.
bool1 :: Bool -- <- Typannotation
bool1 = True

bool2 :: Bool
bool2 = True || (3 == 4)
-- "Bool" ist der Typ für Wahrheitswerte.
-- "True" und "False" sind die einzigen Werte vom Typ "Bool".

string1 :: String
string1 = "Ich bin ein String..."
-- String ist engl. für Schnur und kann mit Zeichenkette übersetzt werden

-- Bei Zahlen sieht die Situation schon etwas diverser aus.
-- Es gibt verschiedene Typen, die Dezimalzahlen, ganze Zahlen, etc. darstellen.
num1 :: Float
num1 = 3.1415926535897932384624633832795
-- für Dezimalzahlen verwenden wir den Typ "Float" (engl. gleiten) oder "Double"

num2 :: Int
num2 = -12
-- für Ganzzahlen ist meist der Typ "Int" die richtige Wahl

num3 :: Float
num3 = -12
-- derselbe Wert kann in mehreren Typen enthalten sein

-- Ist der Typ einmal festgelegt, können nicht einmal verschiedene Zahlentypen
-- addiert werden.
-- ups2 = num1 + num2

-- == Aufgabe ==
-- Bring die Ausdrücke in Ordnung, sodass der Code kompiliert. Das heißt,
-- ihr sollt die Definitionen mit möglichst wenig Änderungen so anpassen, dass
-- sie in GHCi mit ":l" geladen werden können.
-- Geht folgendermaßen vor:
-- 1. Entfernt die zwei "--" vor je einer Definition (zwei Zeilen)
-- 2. Versucht, die Definition in GHCi zu laden (":l TutLogik02" oder dann ":r")
-- 3. Eine Fehlermeldung erscheint, versucht sie zu verstehen
-- 4. Verbessert den Fehler
-- 5. Nochmal in GHCi laden, diesmal kommt hoffentlich keine Fehlermeldung
-- 6. Schaut euch an, wozu die Ausdrücke auswerten

-- fehler1 :: Int
-- fehler1 = "1" + "2" + "3"

-- fehler2 :: String
-- fehler2 = apfel < birne || birne < birne

-- fehler3 :: Bool
-- fehler3 = not 3 < 5

-- fehler4 :: Bool
-- fehler4 = not (1 < 2 == True) || False

-- fehler5 :: Bool
-- fehler5 = 1 < 2 < 3 -- Die Bedeutung soll beibehalten werden

-- == Zusammenfassung ==
-- Der Typ "Bool" steht für Wahrheitswerte, hat die Werte "True" oder "False"
-- Ausdrücke lassen sich mit ==, /=, >, >=, <, <= vergleichen
-- Vergleiche lassen sich mit && (und), || (oder), not (nicht) kombinieren
-- Typen teilen Werte in Kategorien ein
--      Wahrheitswerte:  "Bool" mit Werten "True" oder "False"
--      Zahlen:          "Float" (Dezimalzahlen), "Int" (Ganzzahlen)
--      Text:            "String"
-- Typannotation: <Name> :: <Typ>
