-- Jetzt implementieren wir unsere eigenen Typen
module TutTypen05 where

-- Wiederholung Listen

-- Gib das dritte Element einer Liste zurück
-- drittes [1,2,3,4] = 4
-- Verwende Pattern Matching
drittes l = undefined


-- Verknüpfe eine Liste von Strings zu einem langen String
-- Füge zwische den Strings ein Leerzeichen ein
-- zusammen ["Hallo", "ich", "bin", "JuAk"] = "Hallo ich bin JuAk"
zusammen l = undefined



-- Wir wollen ein Kartenspiel programmieren.
-- Es gibt die vier Farbwerte "Kreuz", "Pik", "Herz" und "Karo", sowie die
-- Kartenwerte 7, 8, 9, Bube, Dame, König, 10, Ass.
--
-- Wir könnten die Kartenwerte als Strings speichern, jedoch müssten wir uns dann
-- Gedanken um die Bedeutung von ungültigen Strings machen.
-- Welche Karte sollte z.B. "Pik 5" darstellen?
--
-- Deshalb definieren wir uns zwei neue Typen, einen für die Kartenfarben
-- und einen für die Kartenwerte.

data Farbe = Kreuz | Pik | Herz | Karo
    deriving(Eq,Ord, Show) -- erlaubt es uns, Farben zu vergleichen

data Wert = Sieben | Acht | Neun | Bube | Dame | König | Zehn | Ass
    deriving(Eq,Ord, Show)
-- So einfach lässt sich also ein neuer Datentyp definieren.
-- Die Syntax ist: data <Typname> = <Konstruktor1> | <Konstruktor2> | ...
-- Werte vom Typ Farbe können nur über die sogenannten Konstruktoren erzeugt
-- werden, in diesem Fall "Kreuz", "Pik", "Herz" und "Karo".
--
-- Eine Karte ist eine Kombination aus Farbe und Wert.
-- Dafür nehmen wir ein Tupel
karte0 = (Kreuz, Sieben)
karte1 = (Herz, Ass)
karte2 = (Karo, Acht)
-- Was ist das Problem an karte2
karte3 = (Zehn, Herz)


-- Ein Deck von vielen Karten ist am besten eine Liste
deck = [karte0, karte1, karte2]


-- Schreibe eine Funktion, die die Farbe einer Karte zurückgibt
farbe :: (Farbe, Wert) -> Farbe
farbe (x,y) = undefined

-- Schreibe eine Funktion, die den Wert einer Karte zurückgibt
wert :: (Farbe, Wert) -> Wert
wert _ = undefined

-- Überprüfe, ob das deck eine Sieben enthält
enthaeltSieben :: [(Farbe, Wert)] -> bool
enthaeltSieben deck = undefined

-- Überprüfe, ob das eck ein Pik enthält
enthaeltPik :: [(Farbe, Wert)] -> bool
enthaeltPik deck = undefined

-- Überprüfe, ob das Deck eine bestimmte Farbe enthält, die als
-- Argument übergeben wird
enthaeltFarbe :: (Farbe, Wert) -> Farbe -> bool
enthaeltFarbe deck farbe = undefined


-- Überprüfe, ob das Deck einen bestimmte Wert enthält, der als
-- Argument übergeben wird
enthaeltWert :: (Farbe, Wert) -> Wert -> bool
enthaeltWert deck wert = undefined

--Teste die Funktionen ausgiebig



-- == Bonus, sehr schwer ==
-- Schreibe die Funktion austeilen.
-- Diese gibt ein Tupel von zwei Listen zurück. Für den ersten Spieler
-- und für den zweiten Spieler. Sie gibt jeweils abwechselnd dem Spieler
-- eine Karte
-- Bsp.:
-- austeile [(Pik, Acht), (Pik, Neun), (Herz, Ass), (Herz, Zehn)]
-- -> ([(Pik, Acht),  (Herz, Ass)], [(Pik, Neun), (Herz, Zehn)] )
-- Tipp: Es reicht evtl. nicht nur eine Funktion zu definieren
austeilen :: [(Farbe, Wert)] -> ([(Farbe, Wert)], [(Farbe, Wert)])
austeilen deck = undefined


-- Es gibt eine schönere Lösung als die karte in einem Tupel zu speichern
-- Denn manchmal vergessen wir, ob zuerst der Wert kam oder die Farbe
data Karte = Karte Farbe Wert
    deriving(Eq, Show)
-- Wir haben einen neuen Typen mit dem Namen "Karte" erzeugt.
-- Der einzige Konstruktor heißt so wie der Typ selbst: "Karte".
-- Er nimmt zwei weitere Argumente, einen vom Typ "Farbe" und
-- einen vom Typ "Wert". Der Konstruktor "Karte" ist also eigentlich
-- eine Funktion vom Typ "Farbe -> Wert -> Karte".


-- Beispiele für Karten
karte5 = Karte Pik Acht
karte6 = Karte Kreuz Neun
--falscheKarte = Karte Neun Pik
--falscheKarte2 = Karte Pik Pik
--falscheKarte3 = Neun Acht
-- man könnte das auch als Tupel speichern
andereKarte = (Pik, Acht)
-- wir finden aber unseren eignene Datentyp Karte besser

-- Unser Ziel ist es jetzt, eine Funktion zu schreiben, die entscheidet, ob eine
-- Farbe Pik ist, oder nicht.
farbePik f = if f == Pik then True else False
-- oder einfacher:
farbePik2 f = f == Pik
-- hier eine Version, die sogenanntes Pattern-Matching verwendet:
farbePik3 Pik   = True
farbePik3 Karo  = False
farbePik3 Kreuz = False
farbePik3 Herz  = False


-- Schreibe die Funktion farbeHerz
-- probiere sowohl Pattern Matching als auch if ... then ... else ...
farbeHerz _ = undefined


-- Pattern-Matching erlaubt es uns, in Funktionsdefinitionen bereits auf der
-- linken Seite eine Fallunterscheidung zu treffen.
-- Wir haben hier vier Funktionsdefinitionen angegeben, je nachdem, welchen
-- Wert das Argument an die Funktion hat, passt es auf eine der vier Varianten.
-- Wird die Funktion "farbePik3" nun mit dem Argument "Kreuz" aufgerufen, so
-- werden von oben nach unten alle Definitionen getestet, ob das Argument auf
-- das sogenannte Pattern auf der linken Seite passt.
-- In den ersten beiden Zeilen ist dies nicht der Fall, in der dritten Zeile
-- schon, also wertet die Funktion zu "False" aus.

-- Eine kürzere Definiton unterscheidet nur zwei Fälle:
farbePik4 Pik = True -- erstes Argument "Pik"
farbePik4 f   = False -- erstes Argument beliebig
-- Da die Fälle von oben nach unten abgearbeitet werden, kommen wir nur in die
-- zweite Zeile, falls die erste nicht passt.

-- Eine letzte Sache dazu: interessiert uns ein Argument auf der rechten Seite
-- nicht, so müssen wir ihm keinen Namen geben, sondern können es durch einen
-- Unterstrich "_" (Shift+Minus) ersetzen.
farbePik5 Pik = True
farbePik5 _   = False

-- Aufgabe:
-- Benutze Pattern-Matching, um zu entscheiden, ob eine Karte Bube oder Dame
-- ist. Kein if-then-else ist erlaubt.
bubeOderDame _ = undefined


herzOderKaro _ = undefined

-- Wir wollen jetzt eine Funktion schreiben, die zwei Karten vergleicht.
-- Eine Karte ist besser als eine andere, falls ihr Wert höher ist, als der der
-- anderen. Sind beide Werte gleich, so entscheidet die Farbe.

-- Unsere Funktion soll zwei Karten als Argument nehmen und als Bool
-- zurückliefern, ob die erste Karte besser ist als die zweite.

-- Aber wie sollen wir an die Bestandteile einer Karte (Farbe + Wert) kommen?
-- An dieser Stelle benötigen wir wieder "Pattern Matching", aber jetzt in
-- einer etwas anderen Form. Wir wissen, dass jeder Wert vom Typ "Karte" durch
-- den Konstruktor "Karte" erzeugt wurde und damit die selbe Struktur besitzt:
-- Karte farbe wert, und genau darauf matchen wir:

-- Zunächst ein einfaches Beispiel für ein einzelnes Argument:
kartePik (Karte Pik wert)   = True -- hier sind Klammern nötig!
kartePik (Karte farbe wert) = False

-- Alles uninteressante können wir wieder mit "_" abkürzen:
kartePik2 (Karte Pik _) = True
kartePik2 _             = False



-- == Aufgabe ==
-- denk daran, dass wir bei den Typen mitgegeben haben, dass
-- man diese einfach vergleichen kann
-- bessererWert Zehn Acht = Zehn
bessererWert a b = undefined

-- bessereFarbe Kreuz Karo = Karo
bessereFarbe a b = undefined


-- Nun sind wir endlich bereit, Karten miteinander zu vergleichen...
besser (Karte farbe1 wert1) (Karte farbe2 wert2) = undefined
