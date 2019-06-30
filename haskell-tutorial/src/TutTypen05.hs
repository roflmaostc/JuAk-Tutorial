-- Jetzt implementieren wir unsere eigenen Typen
module TutTypen05 where
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
    deriving(Eq,Ord) -- erlaubt es uns, Farben zu vergleichen
data Wert = Sieben | Acht | Neun | Bube | Dame | König | Zehn | Ass
    deriving(Eq,Ord)
-- So einfach lässt sich also ein neuer Datentyp definieren.
-- Die Syntax ist: data <Typname> = <Konstruktor1> | <Konstruktor2> | ...
-- Werte vom Typ Farbe können nur über die sogenannten Konstruktoren erzeugt
-- werden, in diesem Fall "Kreuz", "Pik", "Herz" und "Karo".
--
-- Eine Karte ist eine Kombination aus Farbe und Wert.

data Karte = Karte Farbe Wert
    deriving(Eq)

karte1 = Karte Pik Acht
-- Wir haben einen neuen Typen mit dem Namen "Karte" erzeugt.
-- Der einzige Konstruktor heißt so wie der Typ selbst: "Karte".
-- Er nimmt zwei weitere Argumente, einen vom Typ "Farbe" und
-- einen vom Typ "Wert". Der Konstruktor "Karte" ist also eigentlich
-- eine Funktion vom Typ "Farbe -> Wert -> Karte".

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
-- Nun sind wir endlich bereit, Karten miteinander zu vergleichen...
besser (Karte farbe1 wert1) (Karte farbe2 wert2) =
    if wert1 > wert2 then
        undefined -- ???
    else if wert1 < wert2 then
        undefined -- ???
    else if undefined then
        if farbe1 > farbe2 then True else False
    else undefined





