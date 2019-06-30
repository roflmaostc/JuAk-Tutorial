-- Higher Order Functions: Funktionen, die Funktionen als Argumente nehmen...
module TutHOF09 where
-- In Haskell ist alles ein Ausdruck, Funktionen natürlich auch.
-- Eine Funktion kann eine andere Funktion als Argument nehmen und diese in der
-- Definition verwenden.
--
-- Einfaches Beispiel:
zweiMal :: (a -> a) -> a -> a
zweiMal f x = f (f x)

res1 = zweiMal succ 1 -- succ (succ 1) = succ 2 = 3

doppelt x = x*2
res2 = zweiMal doppelt 2 -- doppelt (doppelt 2) = doppelt (2*2) =
                         -- doppelt 4 = 4*2 = 8

-- Die Funktion Funktion "doppelt" benötigen wir nur an dieser einen Stelle,
-- es ist etwas umständlich, sie extra zu definieren und ihr einen eigenen
-- Namen zu geben. Deshalb gibt es "anonyme" Funktionen in Haskell.
-- Anonym, weil sie keinen Namen haben.
-- Die Funktionen lassen sich ganz einfach an jeder Stelle definieren:
--                    "\x y z -> <Körper der Funktion mit x, y und z>"
-- Backslash = Lambda -^  ^- Argumente  ^- Abbildungsvorschrift

-- res2 mit anonymen Funktionen/Lambdas.
res2' = zweiMal (\x ->  x*2) 2

-- Eigentlich müssten wir in Haskell jede Funktion so schreiben:
plus1 = \x -> x + 1
-- Aber Haskell bietet uns die bequemere Notation an, die ihr bereits kennt:
plus1' x = x + 1

-- Aufgabe:
-- Wandle die Definitionen so um, dass sie nur anonyme Funktionen verwenden.
doppelt' = undefined

plus :: Int -> Int -> Int
plus a b = a + b
plus' = undefined

-- Man kann es auch noch eine Stufe weiter treiben, und Haskell macht auch
-- genau das: eigentlich gibt es auch keine Funktionen mit mehr als einem
-- Argument. Das sieht man am besten, wenn man sich die Typannotationen mal
-- genauer anschaut.
minus :: Int -> Int -> Int
-- Die Pfeile Klammern nach rechts, daher ist die Annotation das selbe wie
-- minus :: Int -> (Int -> Int)
-- Also eine Funktion, die ein "Int" als Argument nimmt und eine Funktion
-- "Int -> Int" zurückliefert. Diese Funktion wartet auch auf ein "Int" und
-- am Ende kommt ein "Int" zurück.
minus x y = x - y
-- entspricht ja "minus = \x y -> x - y"
-- und mit der neuen Erkenntnis "minus = \x -> (\y -> x - y)"

-- Das zeigt aber auch, dass es nichts besonderes ist, wenn wir einer Funktion
-- nur einen Teil ihrer Argumente geben:
plus3 :: Int -> Int
plus3 = plus 3 -- plus3 ist "\b -> 3 + b"

plus3Test = plus3 6
-- Die Konzepte, die wir hier kennengelernt haben heißen Currying und
-- partielle Anwendung, aber die Namen kann man sich wohl schwieriger merken
-- als das Prinzip.

-- Partielle Anwendung benötigen wir vor allem dann, wenn wir mit
-- "Higher Order Functions" arbeiten.
-- Und diese wiederrum treten häufig im Zusammenhang mit Listen auf:
-- "map" wendet eine Funktion auf jedes Element in einer Liste an.
-- Die Funktion können wir selbst bestimmen.
map1 = map not [True,  True,  False, True ] -- Wendet "not" auf jedes Element an
-- Ergebnis:   [False, False, True,  False]
map2 = map plus3 [1,2,3] -- [4,5,6]
map3 = map (\x -> -1*x) [4,3,2,1] -- Eine anonyme Funktion :o

-- Aufgabe:
-- Schreibe eine Funktion, die eine Liste von Zahlen in eine Liste von Bools
-- umwandelt: 0 -> False, alle anderen Zahlen -> True
-- Das erste Mal sollst du kein "map" verwenden, das zweite Mal schon...
zahlenZuBools = undefined -- hier kein "map", sondern Pattern-Matching
zahlenZuBoolsMap = undefined
-- eine kurze Lösung geht ca. bis hier hin |
-- die kürzeste bis hier    |
-- Lösung:
-- zahlenZuBoolsMap = map (/=0)
