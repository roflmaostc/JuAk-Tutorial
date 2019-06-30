-- Datentypen, die sich in der Definition selbst verwenden
module TutRekTypen06 where

-- Wie lassen sich alle natürlichen Zahlen definieren?
-- 1) Es gibt eine 0
-- 2) Es gibt eine Funktion "Nachfolger", die zu jeder Zahl die nächste liefert
-- Dies lässt sich mit einem Datentypen ausdrücken
data Nat
  = Null -- 0 ist eine natürliche Zahl
  | Nachfolger Nat -- Für jede natürliche Zahl ist ihr Nachfolger auch eine
-- Dieses Prinzip nennt sich Rekursion:
-- In der Definition von Nat kommt Nat selbst auf der rechten Seite vor.
-- "Um Rekursion zu verstehen musst du zuerst Rekursion verstehen"

eins = Nachfolger Null
zwei = Nachfolger (Nachfolger Null)
-- oder:
zwei' = Nachfolger eins

-- Ein paar simple Funktionen:
plusEins :: Nat -> Nat
plusEins x = Nachfolger x

plusZwei :: Nat -> Nat
plusZwei x = undefined -- ???

plusDrei :: Nat -> Nat
plusDrei x = undefined -- ???

-- Wie addieren wir zwei beliebige Nat-Zahlen?
plus Null Null        = undefined -- ???
plus Null y           = undefined -- ???
plus (Nachfolger x) y = plus x (Nachfolger y) -- wieso funktioniert das?
-- TODO: Tests

add1 = plus zwei eins -- 2+1
-- wenn wir `plus` schreiben, erlaubt uns Haskell, die Funktion zwischen die
-- Argumente zu stellen:
add2 = zwei `plus` eins -- ebenfalls 2+1

-- Was passiert, wenn wir add1 auswerten?
-- add1 =
-- plus zwei                                                   eins =
-- plus (Nachfolger (Nachfolger Null))                         (Nachfolger Null) =
-- plus             (Nachfolger Null)              (Nachfolger (Nachfolger Null)) =
-- plus                         Null   (Nachfolger (Nachfolger (Nachfolger Null))) =
-- Nachfolger (Nachfolger (Nachfolger Null))
--
-- Wir schälen also die linke Seite wie eine Zwiebel Lage für Lage auf,
-- dabei wird die rechte Seite, die am Ende das Ergebnis darstellt, immer
-- größer.

-- Nochmal zum Pattern Matching:
-- Die Pattern werden von oben nach unten abgearbeitet, sobald eines passt,
-- wird dieses auch genommen. Deshalb sollte man die speziellen Patterns zuerst
-- definieren, die allgemeinen später.
-- Dazu eine Aufgabe:
-- Die folgende funktion tut nicht das, was man erwartet. Wieso? Wie kann man
-- das Problem beheben?
istNull n    = False
istNull Null = True

-- == Aufgabe ==
-- Du hast nun gesehen, wie Addition funktioniert. Eure Aufgabe ist es jetzt,
-- Multiplikation zu programmieren.
-- Tipp: Denk dran, Multiplikation ist nur wiederholte Addition...
mul :: Nat -> Nat -> Nat
mul Null y           = undefined
mul (Nachfolger x) y = undefined -- Tipp: (x+1)*y = x*y + y
-- TODO: Tests

-- == Aufgabe ==
-- Wir wollen unsere eigenen Zahlen (Nat) in Haskell-Zahlen (Integer) umwandeln
zuInt :: Nat -> Integer
zuInt n = undefined

-- Die andere Richtung, wenn die Zahl kleiner 0 ist, wollen wir Null erhalten
vonInt :: Integer -> Nat
vonInt x = undefined -- if-then-else erscheint hier angebracht
-- TODO: Tests

-- == Bonus ==
-- == Aufgabe ==
-- Wir schreiben eine Funktion "potenz", die Potenzen berechnen soll.
-- potenz 4 3 soll also "4 hoch 3" berechnen.
potenz :: Nat -> Nat -> Nat
potenz n Null           = undefined
potenz n (Nachfolger k) = undefined

-- == Aufgabe ==
-- Die Funktion "minus" soll für den Ausdruck "minus a b" das Ergebnis a-b
-- liefern. Falls b > a, soll "Zero" zurückgeliefert werden.
minus :: Nat -> Nat -> Nat
minus a b = undefined

-- == Aufgabe ==
-- Die Funktion "teile" soll für den Ausdruck "teile a b" das Ergebnis a÷b
-- liefern (Divsion ohne Rest).
teile :: Nat -> Nat -> Nat
teile a b = undefined

-- == Aufgabe ==
-- Finde heraus, ob eine Zahl gerade ist oder nicht:
gerade Null                        = undefined
gerade (Nachfolger Null)           = undefined
gerade (Nachfolger (Nachfolger n)) = undefined
-- Die vorgegebenen Patterns sollten dir einen Hinweis auf das Vorgehen geben.

-- == Aufgabe ==
-- Finde heraus, ob eine Zahl ungerade ist oder nicht.
-- Dieses Mal musst du selbst die richtigen Patterns finden...
ungerade n = undefined

-- == Aufgabe ==
-- Definiere "first" (engl. erstes) und "second" (engl. zweites).
first :: (a, b) -> a
first = undefined -- Achtung: links vom "=" fehlt noch das Argument

second :: (a, b) -> b
second = undefined
-- Das Schöne ist: Es gibt nur eine Definition, die mit der Typsignatur
-- zusammenpasst!

-- Die Funktionen sind in Haskell als "fst" und "snd" schon vorgefertigt.
