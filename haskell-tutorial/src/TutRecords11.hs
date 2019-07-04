module TutRecords11 where

data Wert = Sieben | Acht | Neun | Zehn | Bube | Dame | König | Ass
      deriving(Eq,Ord,Show)

data Farbe = Kreuz | Pik | Herz | Karo
          deriving(Eq,Ord,Show)

data KartenTyp = Karte Farbe Wert
              deriving(Eq, Show)
-- Wir können einen Hund mit seinen Merkmalen als Tupel speichern:
bello = ("Bello", 7.5, 0.83, "braun", "Bernhardiner")

-- Es ist jetzt aber nicht ganz klar, welches Element des Tupels für welches
-- Merkmal steht.
-- Bei diesem Problem schaffen "Records" Abhilfe.
-- Records sind eigentlich wie Tupel, nur dass jedes Element einen Namen
-- bekommt.

data Hund = Hund {
    name       :: String,
    gewicht    :: Float, -- in kg
    groesse    :: Float, -- in m
    fellfarbe  :: String,
    rasse      :: String,
    geschlecht :: Gender -- weiter unten definiert
}

data Gender = Maennlich | Weiblich | Divers

-- Die Syntax sieht also so aus:
-- data <RecordTyp> = <RecordTyp> {
--     elem1 :: <Typ1>,
--     elem2 :: <Typ2>,
--     ...
-- }

bello' = Hund {
    name = "Bello",
    gewicht = 7.5,
    groesse = 0.83,
    fellfarbe = "braun",
    rasse = "Bernhardiner",
    geschlecht = Maennlich
}
-- Das ist nun viel eher ein Hund als eine Ansammlung von Daten :-)

-- Ähnlich funktioniert es mit einem Kartenspiel:
-- Hier müssen wir nicht nur die Decks der Spieler als Listen speichern,
-- sondern auch den Ablagestapel und den Ziehstapel (falls es einen gibt).
-- Außerdem brauchen wir die Information, wer gerade an der Reihe ist.
data Spieler = S1 | S2
  deriving (Eq, Ord, Show)

data Kartenspiel = Kartenspiel {
    turn :: Spieler,
    deck1 :: [KartenTyp],
    deck2 :: [KartenTyp],
    ziehStapel :: [KartenTyp],
    ablageStapel :: [KartenTyp]
}

spiel = Kartenspiel {
    turn = S1,
    deck1 = [Karte Pik Ass, Karte Herz Sieben, Karte Karo Acht],
    deck2 = [Karte Karo Bube, Karte Kreuz Neun, Karte Pik Dame],
    ziehStapel = [Karte Pik Neun, Karte Kreuz Dame, Karte Herz Zehn],
    ablageStapel = []
}

-- Um uns ein einzelnes Feld eines Records zu holen, können wir das jeweilige
-- Feld wie eine Funktion verwenden:
hundeName = name bello'
hundeRasse = rasse bello'

kartenS1 = deck1 spiel
kartenS2 = deck2 spiel

-- Was, wenn Bello zunimmt? Sein Gewicht können wir nicht direkt ändern, da
-- Variablen in Haskell ja immer unveränderbar sind.
-- Aber wir können den alten Bello kopieren und dabei sein Gewicht ändern:
belloNeu = bello' { gewicht = 9 }
-- belloNeu ist bello', nur dass wir das Gewicht auf 9 setzen.

-- Man kann auch mehr als ein Feld gleichzeitig ändern:
belloNeuNeu = bello' { gewicht = 9.3, fellfarbe = "blond" }
-- Das ist das gleiche wie
--  belloNeuNeu = Hund {
--      name = "Bello",
-- !    gewicht = 9.3,
--      groesse = 0.83,
-- !    fellfarbe = "blond",
--      rasse = "Bernhardiner"
--  }

-- == Aufgabe ==
-- Definiert eine neue Hündin (Dackel), die Luna heißt, 5 Kilo auf die Waage
-- bringt und 70cm groß ist. Ihr Fell ist braun.
luna = undefined

-- == Aufgabe ==
-- Luna geht zum Hundefriseur und lässt sich die Haare blondieren.
-- Wie kannst du sie aus "luna" erzeugen.
lunaBlond = undefined

-- Zusätzlich legt sie jetzt 2 Kilo zu.
lunaSchwer = undefined

-- In unserem Kartenspiel legt Spieler1 (der an der Reihe ist) jetzt eine
-- Karte, die "Pik Ass". Diese muss nun auf den Ablagestapel gelegt werden.
spiel' = undefined

-- Jeder Hund soll nun seinen Namen sagen:
-- "Hallo ich bin Luna" oder
-- "Hallo ich bin Bello" oder
-- "Hallo ich bin Bella" usw.
-- Schreibe dazu die Funktion "halloHund"
halloHund h = undefined
-- Teste die Funktion für Bello und Luna

-- == Case-Of ==
-- Wenn wir mit Funktionen arbeiten, die Records als Argument nehmen, können wir
-- in der Funktionsdefinition direkt Pattern-Matching auf Elemente des
-- Records machen.
-- Alle Elemente, die wir nicht erwähnen sind beliebig:
uebergewicht (Hund { geschlecht = Maennlich, gewicht = g }) =
    if g > 10 then True else False
uebergewicht h = gewicht h > 8

-- Ihr seht aber schon, dass Pattern-Matching an dieser Stelle nicht sehr
-- angenehm ist. Manchmal ist es besser, erst in der Funktion Pattern-Matching
-- durchzuführen.
-- Dafür gibt es das "case-of"-Konstrukt. Es erlaubt uns jederzeit, ein Pattern-
-- Matching durchzuführen, nicht nur zu Beginn einer Funktionsdefinition.
uebergewicht' h =
    case geschlecht h of
        Maennlich -> gewicht h > 10
        _         -> gewicht h > 8
-- Hier wird also nicht auf das Argument das Pattern-Matching angewandt,
-- sondern zuerst "geschlecht h" berechnet. Dabei kann "Maennlich", "Weiblich"
-- oder "Divers" herauskommen.
-- Dieses Ergebnis wird dann mit den verschiedenen Pattern verglichen.
-- Das erste passt nur für männliche Hunde, das zweite für alle anderen.

-- So sieht die Syntax für das "case-of"-Konstrukt allgemein aus:
-- case <Ausdruck> of
--   <Pattern 1> -> <Ausdruck 1>
--   <Pattern 2> -> <Ausdruck 2>
--   ...
--   <Pattern n> -> <Ausdruck n>
