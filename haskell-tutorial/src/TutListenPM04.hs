-- In unserer vierten Lektion werden wir Listen und Rekursion betrachten.
module TutListenPM04 where

import           Control.Exception (evaluate)
import           Test.Hspec
import           Test.QuickCheck

-- == Tupel ==
-- Bevor wir uns jedoch an Listen wagen, beginnen wir mit einem anderen Konzept:
-- Tupel. Ein Tupel ist einfach eine Ansammlung von Werten:
tupel1 = (1, 2.0)

-- Es besteht aus mehreren Ausdrücke in runden Klammern, die durch Kommas
-- getrennt sind.
-- Die Typannotationen sehen fast so aus wie die Werte selbst:
tupel2 :: (String, Int, Bool)
tupel2 = ("Apfel", -1, True && False)


punkt :: (Float, Float)
punkt = (-1.1, 10)

-- Ein Tupel kann Werte verschiedener Typen enthalten.
keinTupel = ("Test") -- Ein einzelner Wert in Klammern ist noch kein Tupel.

leeresTupel :: ()
leeresTupel = () -- Aber 0 Werte in Klammern sind doch ein Tupel :D

-- Es gibt genau ein leeres Tupel und zwar "()". Wir werden es eher selten
-- benötigen.
-- In Tupel kann man natürlich auch if-else-Konstrukte packen
ifTupel x = (if not x then 0 else -1, if x then 1 else 0)

-- Achtet darauf, dass das Komma die zwei if-then-else-Konstrukte voneinander
-- abtrennt.
-- Ein Tupel kann natürlich Argument einer Funktion sein:
tupelFun :: (Int, Int) -> String -> String
tupelFun t s = s -- Diese Funktion gibt einfach immer das zweite Argument zurück

-- Aber wie kommen wir an die einzelnen Elemente des Tupels ran?
-- Die Antwort lautet Pattern-Matching, eigentlich ganz einfach:
tupelPM :: (Int, Int) -> String -> Int
tupelPM (x, y) s = x + y


tupelPMTest = tupelPM (2, 4) "Hallo"
-- Wenn wir tupelPM mit dem Tupel "(2,4)" aufrufen, wird dieses mit dem Tupel
-- "(x,y)" aus der Definition verglichen. Die Definition liefert sozusagen die
-- Schablone oder Struktur für das Argument, die 2 passt auf das "x", die 4 auf
-- das "y".
-- Wir vereinigen also das Muster "(x,y)" mit dem konkreten Argument "(2,4)".
-- (2, 4)
--  ↓  ↓
-- (x, y)
--
-- Die Auswertung des Ausdrucks sieht dann so aus:
-- tuplePM (2,4) "Hallo"
-- 2 + 4
-- 6


-- Schreibe eine Funktion, die den String zurückgibt
erstes :: (Int, String) -> String
erstes t = undefined

-- Schreibe eine Funktion, die die folgende Signatur erfüllt
zweites :: (Int, String) -> (Bool, String)
zweites t = undefined



-- Aber Pattern-Matching kann noch viel mehr. Es kann uns häufig "if-then-else"
-- ersparen.
-- Die Funktion "nicht" würden wir normal so definieren:
nicht x = if x then False else True

-- Mit Pattern-Matching ist das etwas schöner möglich
nichtPM True  = False
nichtPM False = True

-- Wir teilen also die Definition der Funktion in zwei Teile auf.
-- Wenn "nichtPM" mit einem Argument aufgerufen wird, vergleichen wir dieses
-- Argument mit den verschiedenen Patterns.
-- Je nachdem, welches Pattern passt, wird die passende Definition ausgewählt.
-- Ähnlich funktioniert es auch mit mehreren Argumenten. Die Funktion "oder"
-- sieht nun statt so
oder x y = if x then True else y
-- so aus
oderPM True y  = True
oderPM False y = y

oderPMTest = oderPM False True
-- "False" passt auf das zweite Pattern, also geben wir das 2. Argument zurück

-- == Aufgabe ==
-- Benutze Pattern-Matching um die "und"-Funktion zu schreiben
und :: Bool -> Bool -> Bool
und x y = undefined

-- Mit Pattern Matching kann man viele "spannende" Dinge anstellen:
sag 1 = "Eins!"
sag 2 = "Zwei!"
sag 3 = "Drei!"
sag 4 = "Vier!"
sag 5 = "Fünf!"
sag x = "Zahl nicht zwischen 1 und 5"

-- Addiere zwei Punkte:
-- Ein Punkt sieht z.B. so aus: (1,2) oder (2.3, 4.1)
-- Arbeite mit Pattern Matching
punktAdd = undefined -- hier fehlen die Argumente

-- Verschmelze zwei 2er-Tupel zu einem 4er-Tupel
-- Annotiere die Typen
tupelVerschmelzen t1 t2 = undefined

-- Tausche in einem 2er-Tupel die Positionen des ersten und zweiten Elements
tupelTausch x = undefined

-- Ein Fach mit einer Note kann man in einem Tupel speichern, z.B. ("Deutsch", 3).
-- Wenn die Note mindestens eine vier ist hat man bestanden.
-- Dann soll der Name des Fachs und "bestanden" zurückgegeben werden, ansonsten
-- der Name und "durchgefallen". Also bei uns: "Deutsch bestanden".
bestanden (fach, note) = undefined

-- == Rekursion ==
-- Das zweite Konzept, das wir noch betrachten sollten, bevor wir uns den
-- Listen widmen ist Rekursion:
-- Eine Funktion, die sich selbst in ihrer Definition wieder aufruft.
-- Das klingt vielleicht komplex, aber wir starten mit einem einfachen Beispiel:
-- Die Fakultätsfunktion (man schreibt sie mit einem Ausrufezeichen "!"):
-- 0! = 1, 1! = 1, 2! = 2*1,  3! = 3*2*1, 4! = 4*3*2*1
-- Erkennst du ein Muster? Wir können das auch anders schreiben:
-- 0! = 1, 1! = 1*0!, 2! = 2*1!, 3! = 3*2!,  4! = 4*3!
-- Noch kompakter:
-- 0! = 1
-- Es gilt also:
-- n! = n*(n-1)! <- für alle n > 0.
-- Außerdem: 0! = 1
-- Damit ist
-- 3! = 2*1! = 2*(1*0!) = 2*0! = 2*1 = 2
-- Und schon haben wir unser erstes Beispiel für Rekursion gesehen:
-- Die Fakultätsfunktion verwendet sich selbst, um das Ergebnis zu bestimmen.
-- Irgendwann kommt n bei null an, dann bricht die Rekursion ab.

-- In Haskell ist es sehr ähnlich:
fak 0 = 1 -- 0! = 1
fak n = n * fak (n - 1) -- n! = n*(n-1)!
-- Das ist auch eine Form des Pattern-Matching:
-- Wenn wir "fak 3" auswerten wollen, muss im Pattern "3" auf die Schablone
-- "n+1" passen. Damit "3 = n+1" gilt, wird also "n" zu "2".
-- Man sieht auch, dass von oben nach unten geprüft wird, welches Pattern
-- passt. Hier passt das erste nicht, da "3" nicht auf das Muster "0" passt,
-- deshalb wird das zweite Muster verwendet.
-- Einmal Zeile für Zeile, Schritt für Schritt ausgewertet:
-- fak 3
-- fak (2 + 1)
-- (2 + 1) * fak 2
--       3 * fak 2
--       3 * fak (1 + 1)
--       3 * (1 + 1) * fak 1
--                 6 * fak 1
--                 6 * fak (0 + 1)
--                 6 * (0 + 1) * fak 0
--                           6 * fak 0
--                           6 * 1
--                               6
-- == Aufgabe ==
-- Schreibe eine Funktion, die die Summe der Zahlen von 0 bis n berechnet.
-- z.B. ist summeZahlen 4 = 10
summeZahlen :: Integer -> Integer
summeZahlen 0 = undefined
summeZahlen n = undefined

-- Schreibe eine Funktion, die die aⁿ (a hoch n) berechnet.
-- 4³ ist 4*4*4. a⁰ ist immer 1.
-- Benutze Rekursion.
potenz :: Integer -> Integer -> Integer
potenz a 0 = undefined
potenz a n = undefined

-- Ein weiteres bekanntes Beispiel für Rekursion ist die Fibonacci-Folge:
-- Sie sieht so aus:
-- 0,1,1,2,3,5,8,13,21,34,55,... Was ist das Muster?
-- 0 1 2 3 4 5 6 7  8  9  10 ... <- Positionen
-- Die 0te Fibonacci-Zahl ist also 0, die 9te ist 34.
-- == Aufgabe ==
-- Wie lässt sich eine beliebige Position berechnen?
fib :: Int -> Int
fib 0 = undefined -- Was ist die 0te Fibonacci-Zahl?
fib 1 = undefined -- Was ist die 1te Fibonacci-Zahl?
fib n = undefined

-- Test
testFib :: IO ()
testFib =
  hspec $ do
    describe "fib" $ do
      it "Die vierte Fibonacci-Zahl ist 3" $ do fib 4 `shouldBe` 3
      it "Die Fibonacci-Zahlen werden immer größer" $ do
        property $ \n -> fib n <= fib (n + 1)

-- Jetzt haben wir es endlich geschafft und sind mit Rekursion und Pattern
-- Matching gewappnet für die Listen. Listen sind in Haskell die wohl wichtigste
-- Datenstruktur: Sie erlauben es, viele Werte vom selben Typ (z.B. String)
-- gruppiert zu speichern.
-- Wir können eine neue Liste definieren, indem wir ihre Inhalte durch Kommas
-- getrennt in eckige Klammern schreiben:
einkaufsliste = ["Brot", "Mehl", "Zucker", "Eier"]
-- Tupel fühlen sich auch in Listen wohl :-)
einkaufsliste' = [("Eier", 1), ("Packung Mehl", 2), ("Liter Milch", 1)]

noten = [1, 2, 3, 4, 5, 6]

muenzen = [0.01, 0.02, 0.05, 0.10, 0.20, 0.50, 1, 2]

einzelgaenger = [1]

leer = []

-- Eine Liste kann beliebig viele Elemente speichern, aber sie müssen alle vom
-- gleichen Typ sein. Folgendes ist nicht möglich:
-- mix = ["Brot", 2, True]
-- "Brot" :: String, 2 :: Int, True :: Bool
-- Für Listen existieren einige praktische Funktionen:
umgedreht = reverse [1, 2, 3] -- liefert [3, 2, 1]

anzahl = length [5, 4, 3, 2, 1] -- liefert 5

-- Listen sind eigentlich nicht so aufgebaut, wie sie uns Haskell anzeigt:
-- "[]"      ist wirklich   "[]"
-- "[1]"     ist eigentlich "1:[]"
-- "[1,2]"   ist eigentlich "1:2:[]"
-- "[1,2,3]" ist eigentlich "1:2:3:[]"
-- Listen werden außerdem von hinten nach vorne aufgebaut:
-- "1:2:3:[]" = "1:(2:(3:[]))"
-- Die Liste [1,2,3] entsteht also eigentlich so: Zunächst haben wir die leere
-- Liste "[]". Dann hängen wir vorne 3 dran und erhalten "3:[]", was gleich ist
-- wie "[3]".
-- An "[3]" wird nun 2 vorne angehängt, das Ergebnis:
-- "2:(3:[])" = "2:[3]" = "[2,3]"
-- Und nun das beste zum Schluss: die 1 fehlt noch, sie wird ebenfalls vorne
-- an die Liste "[2,3]" hingehängt. Das Resultat:
-- "1:(2:(3:[]))" = "1:(2:[3])" = "1:[2,3]" = "[1,2,3]"
-- Eine Liste besteht also aus ihren Werten und einer Struktur aus "[]" und
-- ":".
-- Eine einfache Übung ist es, die Länge einer Liste selbst zu berechnen.
-- Hierzu benötigen wir Pattern-Matching und Rekursion:
laenge []     = 0 -- Die leere Liste hat die Länge 0
laenge (x:xs) = 1 + laenge xs

-- Wir haben also im Zweiten Fall eine Liste, die so aussieht:
-- [x, ...]
--      ⤷ Das alles ist xs
-- Die Länge der gesamten Liste ist die Länge von "xs" plus eins, für das "x".
-- Aufgabe:
-- Berechne die Summe der Elemente in einer Liste:
summeListe []     = undefined
summeListe (x:xs) = undefined

-- Aufgabe:
-- Wie viele Einser sind in der Liste?
anzahlEinser []     = undefined
anzahlEinser (x:xs) = undefined

-- Unsere Funktionen können natürlich auch wieder Listen zurückgeben. Diese
-- erhöht jedes Element in der Liste um eins.
plus1 []     = []
plus1 (x:xs) = (x + 1) : (plus1 xs) -- wir müssen die Liste mit ":" zusammenbauen

-- Schreibe eine Funktion, die Zahlen im Abstand von x generiert.
-- Vom Anfangswert a bis Endwert e
-- z.B.: generieren 0 12 3 = 0 3 6 9 12
generieren :: Integer -> Integer -> Integer -> Integer
generieren a e x = undefined

-- Schreibe eine Funktion letztes, welche das letzte Element einer Liste
-- ausgibt
letztes :: [a] -> a
letztes l = undefined

-- Wir können zwei Listen einfach verbinden/aneinanderhängen:
-- Dazu gibt es die Funktion "++".
einsBisSechs = [1, 2, 3] ++ [4, 5, 6]

-- Weiter oben haben wir schon gesehen, dass es die Funktion "reverse" gibt,
-- die eine Liste umdreht. Aber wir können das auch selbst:
umdrehen []     = undefined -- Dieser Fall sollte sehr einfach klappen.
umdrehen (x:xs) = undefined -- Hier brauchst du "++"

-- Überlege dir, was in einem konkreten Beispiel passiert: [1,2,3,4]
-- Wir haben also x=1, xs=[2,3,4]. Wir wollen [4,3,2,1].
-- Ein Tipp noch: [4,3,2,1] entspricht "[4,3,2] ++ [1]".
-- Aufgabe:
-- Schreibe eine Funktion, die alle Elemente aus einer Liste filtert, die nicht
-- zwischen eins und sechs sind:
notenFilter []     = undefined
notenFilter (x:xs) = undefined -- hier bietet sich ein if-then-else an

-- Strings sind auch einfach Listen von einzelnen Buchstaben.
-- Einzelne Buchstaben haben den Datentyp getChar
buchstabeX :: Char
buchstabeX = 'X'

hallo1 :: String
hallo1 = "Hallo"

hallo2 :: [Char]
hallo2 = ['H', 'a', 'l', 'l', 'o']

-- Beide Definitionen sind intern genau das gleiche, aber hallo2 ist doch sehr
-- umständlich aufzuschreiben.
-- Wir können also für die Typannotationen beide Möglichkeiten aufschreiben
charList :: [Char]
charList = "Hallo"

charString :: String
charString = "Hallo"

-- Da Strings auch Listen sind, können wir sie sehr leicht aneinanderhängen.
welt = "Welt"

halloWelt = hallo1 ++ " " ++ welt

-- Es gibt eine sehr einfache Möglichkeit auf den n-ten Buchstaben eines Strings
-- zuzugreifen.
dritterBuchstabe :: Char
dritterBuchstabe = welt !! 2 -- wertet zu Char 'l' aus

-- Wieso bekommen wir den dritten Buchstaben, wenn wir !! 2 schreiben?
-- Ganz einfach, Informatiker beginnen bei 0 an zu zählen
--  ['W', 'e', 'l', 't']
--    0    1    2    3
-- Was passiert hier wohl?
fuenfterBuchstabe :: Char
fuenfterBuchstabe = welt !! 4

-- Wir wissen, dass Strings nur [Char] sind, daher geht !! auch für einfache
-- Listen
drei :: Int
drei = [1, 2, 3, 4] !! 2

-- Schreibe die Funktion zugriff, die das n-te Element einer Liste zurückgibt
zugriff :: [Int] -> Int -> Int
zugriff l n = undefined


-- == Bonus ==
-- Schreibe eine Funktion, die [Int] nimmt und immer das n-te Element zurück-
-- geben soll. Greift man auf einen Index zu, der größer ist als die
-- Liste lang ist, so bekommt man 0 zurück.
sichererZugriff = undefined

-- == Bonus ==
-- Schreibe eine Funktion, die zählt wie oft ein Buchstabe
-- in einem Wort vorkommt
-- Du kannst entweder Pattern-Matching oder !! benutzen
bVorkommen :: [Char] -> Char -> Integer
bVorkommen w b = undefined


-- verdopple alle Vorkommen in einer Liste
-- verdopple ["a", "b", "c"]  wird zu ["a", "a", "b", "b", "c", "c"]
verdopple :: [String] -> [String]
verdopple l = undefined



-- Überprüfe, ob eine Liste ein Palindrom ist.
-- Eine List ist genau dann ein Palindrom, wenn sie rückwärts gelesen
-- die gleiche Liste ist
-- [1,2,3,2,1] ist ein Palindrom
-- [1,2,3,4,5] ist kein Palindrom
palindrom :: [Int] -> Bool
palindrom l = undefined




-- Verschachtelte Listen
-- Natürlich kann man Listen auch verschachteln
-- [[1,2], [4,5,6,7], [5,6,8,9]]
-- Schreibe eine Funktion, die jeweils die Länge einer solchen Liste berechnet
-- Bsp: laengeVerschachtelterListeen  [[1,2], [4,5,6,7], [5,6,8,9]] = [2,4,4]
laengeVerschachtelterListen :: [[Int]] -> [Int]
laengeVerschachtelterListen l = undefined



-- Duplikate
-- Schreibe eine Funktion, die aufeinanderfolgende Duplikate
-- in einer Liste entfernt
-- Bsp: removeDuplicates ["a", "a", "a", "b", "c", "c", "c"] -> ["a", "b", "c"]
removeDuplicates :: [String] -> [String]
removeDuplicates l = undefined





-- zaehlen
-- Schreibe eine Funktion, die aufeinanderfolgende Duplikate
-- zaehlt und als Tupel in eine Liste packt
-- Bsp
-- zaehlen ["a", "a", "a", "b", "c", "c", "c"] -> [("a",3), ("b",1), ("c",3)]
zaehlen l = undefined
