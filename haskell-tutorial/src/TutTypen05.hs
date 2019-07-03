-- Jetzt implementieren wir unsere eigenen Typen
module TutTypen05 where

-- == Wiederholung Listen ==
-- Gib das dritte Element einer Liste zurück
-- drittes [1,2,3,4] = 4
-- Verwende Pattern Matching
drittes l = undefined

-- Wie viele Zahlen in der Liste sind 3er oder 4er?
-- z.B.
-- dreiVier [1,2,3,4] ist 2
-- dreiVier [3,2,1] ist 1
-- dreiVier [1] ist 0
dreiVier [] = 0
dreiVier (x:xs) = undefined

-- Kommt in der Liste der Noten eine eins vor?
-- Wenn ja, gib "True" zurück, sonst "False".
-- z.B.
-- musterschueler [3] ist False
-- musterschueler [1,2,3,4,5,6] ist True
-- musterschueler [1,1,2] ist True
musterschueler [] = undefined
musterschueler (note:restNoten) = undefined

-- Verknüpfe eine Liste von Strings zu einem langen Text.
-- Füge dazu zwischen den Strings ein Leerzeichen ein.
-- z.B.
-- zusammen [] ist ""
-- zusammen ["Hallo", "ich", "bin", "Haskell"] ist "Hallo ich bin Haskell"
zusammen l = undefined

-- == Eigene Datentypen ==
-- Wir wollen ein Kartenspiel programmieren.
-- Es gibt die vier Farbwerte "Kreuz", "Pik", "Herz" und "Karo", sowie die
-- Kartenwerte 7, 8, 9, Bube, Dame, König, 10, Ass.
--  .------.------.------.------.
--  |A_  _ |A /\  |A _   |A .   |
--  |( \/ )| /  \ | ( )  | / \  |
--  | \  / | \  / |(_x_) |(_,_) |
--  |  \/ A|  \/ A|  Y  A|  I  A|
--  `------^------^------'------'
--
-- Wir könnten die Kartenwerte natürlich als Strings speichern, jedoch 
-- müssten wir uns dann Gedanken um die Bedeutung von ungültigen Strings machen.
-- Welche Karte sollte z.B. "Pik 5" darstellen?
--
-- Deshalb definieren wir uns zwei neue Typen, einen für die Kartenfarben
-- und einen für die Kartenwerte.

-- Die nächste Zeile definiert einen neuen Typen mit dem Namen "Farbe", der 
-- die vier Werte "Kreuz", "Pik", "Herz" oder "Karo" annehmen kann. 
data Farbe = Kreuz | Pik | Herz | Karo
    deriving(Eq,Ord,Show) -- erlaubt es uns, Farben zu vergleichen

-- Den Typ "Bool" kennen wir ja schon, er ist so definiert:
-- data Bool = True | False

-- Die Kartenwerte speichern wir mit dem Typ "Wert".
data Wert = Sieben | Acht | Neun | Bube | Dame | König | Zehn | Ass
    deriving(Eq,Ord,Show)

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
-- Was ist bei karte3 schiefgegangen?
karte3 = (Zehn, Herz)

-- Unser Ziel ist es jetzt eine Funktion zu schreiben, die entscheidet, ob eine
-- Farbe Pik ist oder nicht.
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

-- Ein Deck von vielen Karten ist einfach eine Liste:
deck = [karte0, karte1, karte2]

-- Schreibe eine Funktion, die die Farbe einer Karte zurückgibt
-- z.B.
-- farbe (Karo, Acht) ist Karo
-- farbe (Herz, Ass) ist Herz
farbe :: (Farbe, Wert) -> Farbe
farbe (farbe,wert) = undefined

-- Schreibe eine Funktion, die den Wert einer Karte zurückgibt
-- z.B.
-- wert (Karo, Acht) ist Acht
-- wert (Herz, Ass) ist Ass
wert :: (Farbe, Wert) -> Wert
wert k = undefined

-- Teste, ob die erste Karte im "deck" eine Sieben ist
-- z.B.
-- siebenOben [] ist False
-- siebenOben [(Karo, Acht), (Herz, Ass)] ist False
-- siebenOben [(Pik, Sieben)] ist True
siebenOben [(Farbe, Wert)] -> Bool
siebenOben deck = undefined

-- Überprüfe, ob "deck" eine "Sieben" an irgend einer Stelle enthält
-- z.B.
-- enthaeltSieben [] ist False
-- enthaeltSieben [(Karo, Acht), (Herz, Ass)] ist False
-- enthaeltSieben [(Karo, Acht), (Pik, Sieben)] ist True
enthaeltSieben :: [(Farbe, Wert)] -> Bool
enthaeltSieben deck = undefined

-- Überprüfe, ob das "deck" ein Pik enthält.
enthaeltPik :: [(Farbe, Wert)] -> Bool
enthaeltPik deck = undefined

-- Überprüfe, ob das Deck eine bestimmte Farbe enthält, die als
-- Argument übergeben wird.
-- enthaeltFarbe [] Pik ist False
-- enthaeltFarbe [(Karo, Acht), (Herz, Ass)] Karo ist True
-- enthaeltFarbe [(Karo, Acht), (Pik, Sieben)] Herz ist False
enthaeltFarbe :: [(Farbe, Wert)]-> Farbe -> Bool
enthaeltFarbe deck farbe = undefined

-- Überprüfe, ob das Deck einen bestimmten Wert enthält, der als
-- Argument übergeben wird.
enthaeltWert :: [(Farbe, Wert)] -> Wert -> Bool
enthaeltWert deck wert = undefined

-- Teste die Funktionen ausgiebig in GHCi! :)

-- == Bonus, sehr schwer ==
-- Schreibe die Funktion austeilen.
-- Diese gibt ein Tupel von zwei Listen zurück, die erste Liste mit den Karten,
-- die Spieler 1 erhält, die zweite mit denen für Spieler 2.
-- Sie gibt jeweils abwechselnd jedem Spieler eine Karte.
-- Bsp.:
-- austeilen [(Pik, Acht), (Pik, Neun), (Herz, Ass), (Herz, Zehn)]
-- -> ([(Pik, Acht),  (Herz, Ass)], [(Pik, Neun), (Herz, Zehn)] )
-- Tipp: Es reicht evtl. nicht, nur eine Funktion zu definieren
austeilen :: [(Farbe, Wert)] -> ([(Farbe, Wert)], [(Farbe, Wert)])
austeilen deck = undefined

-- == Typen, Teil 2 ==
-- Es gibt eine schönere Lösung als die karte in einem Tupel zu speichern
-- Denn manchmal vergessen wir, ob zuerst der Wert kam oder die Farbe.
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
