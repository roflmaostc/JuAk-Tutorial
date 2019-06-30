module TutRecords11 where

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

-- Um uns ein einzelnes Feld eines Records zu holen, können wir das jeweilige
-- Feld wie eine Funktion verwenden:
hundeName = name bello'
hundeRasse = rasse bello'

-- Was, wenn Bello zunimmt? Sein Gewicht können wir nicht direkt ändern, da
-- Variablen in Haskell ja immer unveränderbar sind.
-- Aber wir können den alten Bello kopieren und dabei sein Gewicht ändern:
belloNeu = bello' { gewicht = 9 }
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

-- Wenn wir mit Funktionen arbeiten, die Records als Argument nehmen, können wir
-- in der Funktionsdefinition nicht direkt Pattern-Matching auf Elemente des
-- Records machen.
-- Dafür gibt es das "case-of"-Konstrukt. Es erlaubt uns jederzeit, ein Pattern-
-- Matching durchzuführen, nicht nur zu Beginn einer Funktionsdefinition.
uebergewicht h =
    case geschlecht h of
        Maennlich -> gewicht h > 10
        _         -> gewicht h > 8
-- Hier wird also nicht auf das Argument das Pattern-Matchiing angewandt,
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
