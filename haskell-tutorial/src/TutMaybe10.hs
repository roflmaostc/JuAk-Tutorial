-- Was, wenn mal etwas schiefgeht? Der Typ "Maybe" (und mehr Pattern Matching).
module TutMaybe10 where
import TutListe07

-- Für unsere eigene Listen wäre es praktisch, eine Funktion "kopf" zu haben,
-- die das erste Element aus einer Liste holt.
-- Die Signatur einer solchen Funktion sieht so aus:
-- kopf :: List a -> a
-- kopf (Cons 1 (Cons 2 Nil)) = 1
-- Aber wie sieht es aus mit "kopf Nil"? Was sollte das Ergebnis sein?
-- Wir wollen dem, der die Funktion "kopf" aufruft mitteilen, dass es kein
-- erstes Element gibt. Dafür eignet sich der Typ "Maybe" in Haskell.
-- Seine Definition sieht so aus:
-- data Maybe a = Just a | Nothing
-- Der Typ hat zwei Konstruktoren:
-- "Nothing": Nichts, unsere Funktion "kopf" sollte diesen Wert zurückgeben,
-- wenn es kein erstes Element gibt.
-- "Just": Dieser Konstruktor bekommt noch ein Argument, und zwar bei uns den
-- Kopf der Liste.
--
-- Zweiter Versuch:
kopf :: Liste a -> Maybe a
kopf Nil         = Nothing
kopf (Cons x xs) = Just x

-- Damit ist
kopf1 = kopf (Cons 1 (Cons 2 Nil)) -- == Just 1, aber
kopf2 = kopf Nil -- == Nothing

-- Jetzt seid ihr dran.
-- Implementiert eine Funktion, die eine Liste als Argument übernimmt und das
-- erste Element abschneidet.
rest :: Liste a -> Maybe (Liste a)
rest Nil         = undefined
rest (Cons x xs) = undefined

-- Funktionen die ähnlich zu "kopf" und "rest" funktionieren liefert Haskell
-- bereits mit. Diese funktionieren auf normalen Listen ([a]) und heißen
-- "head" und "tail".
-- head :: [a] -> a
-- tail :: [a] -> [a]

-- == Aufgabe ==
-- schreibe sowohl myHead als auch myTail

myHead :: [a] -> a
myHead _ = undefined

myTail :: [a] -> [a]
myTail _ = undefined

-- Kein "Maybe"? Die eingebauten "head" und "tail"-Funktionen liefern kein
-- Nothing zurück bei leerer Liste, sondern schlagen einfach mit einer
-- unschönen Meldung fehl.
-- Deshalb sollten wir vermeiden, die Funktionen zu verwenden und lieber auf
-- Pattern-Matching zurückgreifen.

-- Aufgabe:
-- Wir können die Elemente einer Liste durchnummerieren:
-- ["Apfel", "Birne", "Banane", "Kiwi", "Ananas"]
--   0        1        2         3       4
-- Wie immer beim Programmieren fangen wir bei 0 an zu zählen.
-- Wir definieren eine Funktion "stelleN", die eine Liste und eine Position
-- nimmt, sie liefert den Wert an dieser Stelle in der Liste zurück.
-- Falls die Position nicht existiert, soll "Nothing" zurückgegeben werden,
-- sonst "Just x", wobei "x" der Wert an der gewünschten Stelle ist.
-- Es gibt zwei Fälle, in denen "Nothing" zurǘckgegeben wird:
-- - Der Index (die Position) ist kleiner 0
-- - Der Index ist größer oder gleich wie die Länge der Liste
stelleN :: Int -> Liste a -> Maybe a
stelleN n Nil     = undefined
stelleN n (Cons x xs) = undefined
-- Deine Funktion sollte mit Positionen kleiner 0 klarkommen. Dafür benötigen
-- wir ein if-then-else-Konstrukt.
-- Tipp: Sollte deine Funktion sehr lange zum Berechnen des Ergebnisses
-- brauchen, hast du wahrscheinlich den Fall "n < 0" nicht beachtet.
-- Du kannst die Berechnung dann mit <Strg+c> abbrechen.
