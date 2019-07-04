-- == Wiederholung ==
-- Listen
data Farbe = Kreuz | Pik | Herz | Karo
    deriving(Eq,Ord,Show) -- erlaubt es uns, Farben zu vergleichen
data Wert = Sieben | Acht | Neun | Zehn | Bube | Dame | König | Ass
    deriving(Eq,Ord,Show)

data Karte = Karte Farbe Wert 
    deriving(Eq, Show)

-- Teste, ob die Liste ein "Ass" oder "Herz" enthält.
-- z.B.
-- assOderHerz [Karte Pik Neun] = False
-- assOderHerz [Karte Kreuz Bube, Karte Herz Sieben] = True
assOderHerz _ = undefined

-- Berechne die doppelte Länge der Liste.
-- z.B.
-- doppelteLaenge [] = 0
-- doppelteLaenge [1,2,3] = 6
doppelteLaenge _ = undefined

-- Zähle alle Elemente in der Liste zusammen, die größer als 12 sind.
summeGross _ = undefined

-- Jedes Element in der Liste soll jetzt zwei Mal vorkommen
-- z.B.
-- wiederhole [1,2,3] = [1,1,2,2,3,3]
wiederhole _ = undefined

-- Entferne jedes zweite Element aus der Liste
entferneGerade _ = undefined

-- == Bonus ==
-- Entferne jedes n-te Element aus der Liste.
-- entferne 3 [1,2,3,4,5,6,7] = [1,2,4,5,7]
entferne n _ = undefined

-- Rotiere die Liste um "n" Plätze nach links.
-- rotiere 3 [1,2,3,4,5] = [4,5,1,2,3]
rotiere n _ = undefined

-- Wir definieren uns selbst Ausdrücke, die auf Wahrheitswerten arbeiten.
-- T steht für wahr, F steht für falsch.
data Ausdruck = Not Ausdruck | And Ausdruck | Or Ausdruck | T | F

-- Die Funktion "auswerten" soll einen Ausdruck zu "True" oder "False"
-- reduzieren.
-- z.B.
-- auswerten (Or T F) = True
-- auswerten (Not (And T F)) = True
auswerten :: Ausdruck -> Bool
auswerten _ = undefined
