-- In unserer dritten Lektion dürfen wir endlich selbst programmieren.
-- Wir lernen, wie wir Funktionen selbst anwenden und definieren können.

module TutFunktionen03 where
-- Hier gibt es nichts zu sehen, bitte weiterlesen...
import           Control.Exception (evaluate)
import           Test.Hspec
import           Test.QuickCheck

-- Wir kommen nun also zum Herzstück von Haskell, Funktionen! Was eine
-- Funktion ist kennt ihr bereits aus Mathe.
-- Für uns ist eine Funktion wie eine Maschine, der wir etwas füttern,
-- die Maschine stellt damit etwas an und spuckt am Ende etwas anderes aus.
--
-- Ihr kennt schon Funktionsdefinitionen aus der Mathe:
-- Name  Abbildungsvorschrift
-- ↓     ↓
-- f(x): x -> x + 1
--   ↑
--   Argument
--
-- Häufig kürzt man das auch ab:
-- f(x) = x + 1

-- In Haskell lassen wir die Klammern weg, sonst ist alles gleich
f x = x + 1

-- Wir können dieser Funktion jetzt ein Argument x (z.B. 3) übergeben,
-- die Funktion zählt eins dazu und gibt das Ergebnis (in diesem Fall 4)
-- zurück.
-- Das nennt sich Funktionsanwendung und sieht so aus:
-- f(3)

-- Wir lassen in Haskell natürlich wieder die Klammern weg:
y = f 3 -- Wir speichern das Ergebnis von "f 3" unter dem Namen y

-- Wenn Haskell nun den Wert von y berechnen will, muss es zunächst f durch
-- die Funktionsdefinition ersetzen. Dabei setzen wir für "x" das Argument "3"
-- ein. Dann können wir "3 + 1" zu "4" vereinfachen und sind fertig.
-- f 3 ⇝ 3 + 1 ⇝ 4

-- Bereits in der ersten Lektion haben wir gesehen, dass Haskell eigentlich
-- nichts anderes macht, als Terme zu vereinfachen.
-- Dazu braucht man bestimmte Regeln:
-- Haskell kennt zu Beginn z.B. die Regel, was es machen muss, wenn es "+"
-- sieht: Die linke und die rechte Seite auswerten und dann zusammenzählen.
-- Ähnliche Regeln gibt es für -,*,/,&&,||,not,==,>,<,etc..
--
-- Wenn wir jetzt eine neue Funktion definieren, ist das eigentlich nur eine
-- neue Regel für Haskell, wie es Terme vereinfachen kann.
-- In diesem Fall: "f x" kann immer durch "x + 1" ersetzt werden.

-- Die Funktion f gibt es in Haskell bereits:
-- sie heißt "succ" (für successor, engl. Nachfolger)
res1 = succ 3

-- Funktionen können auch mehr als ein Argument erwarten.
-- Vielleicht hast du das auch schon mal gesehen:
-- g(x,y) = 2*x - y
-- Die Funktion wird dann so aufgerufen: g(1,2)

-- In Haskell lassen wir wieder die Klammern weg:
groesser x y = x > y -- nimmt zwei Zahlen als Eingabe, gibt ein Bool zurück
res2 = groesser 3 2 -- ???

-- "not", das wir in der letzten Lektion kennengelernt haben, ist auch eine
-- Funktion. "not" stand sehr weit vorne in der KlaPS-Liste, war aber nur ein
-- Spezialfall von Funktionen. Unsere Regel lautet also:
-- Klammer vor Funktion vor Punkt vor Strich vor Vergleich vor "&&" vor "||"

-- == Aufgabe ==
-- Definiere die Funktion "winkelsumme", die die Summe aller Winkel in einem
-- n-Eck angibt. "winkelsumme 3" soll das Ergebnis 180 (Grad) liefern.
-- Deine Definition soll an die Stelle, an der aktuell "undefined" steht.
-- Hinweis: Überlege dir wie viel ein Dreieck, Viereck, Fünfeck hat.

winkelsumme n = undefined

-- Schreibe eine Funktion "umfang", die den Umfang eines n-Ecks mit
-- Seitenlänge "a" berechnet:
umfang n a = undefined

-- Definiere eine Funktion "linear", die drei Argumente nimmt.
-- Sie soll den Funktionswert einer linearen Funktion mit Steigung "m" und
-- y-Abschnitt "n" an der Stelle "x" berechnen.
linear m n x = undefined

-- == Bonus ==
-- Schreibe eine Funktion "pyth", die aus den zwei Seitenlängen "a" und "b" eines
-- rechtwinkligen Dreiecks die Länge der dritten Seite berechnet.
-- Teste deine Funktion in GHCi mit Beispielen und indem du "testPyth" aufrufst!
-- Tipp: Um die Wurzel zu ziehen bringt Haskell die Funktion "sqrt" mit.
pyth :: Float -> Float -> Float
pyth a b = undefined
-- Lösung: pyth a b = sqrt(a*a + b*b)

-- Test (den Code hier müsst/könnt ihr noch nicht verstehen)
testPyth :: IO ()
testPyth = hspec $ do
    describe "pyth" $ do
        it "liefert für 3 und 4 das Ergebnis 5" $ do
            pyth 3 4 `shouldBe` 5
        it "liefert immer Ergebnisse >= 0" $ do
            property $ \a b -> pyth a b >= (0::Float)
        it "liefert immer Ergebnisse >= a und >=b" $ do
            property $ \a b -> pyth a b >= max a (b::Float)

-- == Infixschreibweise ==
-- Kleiner Hinweis zwischendurch:
-- +,-,*,/ (aber auch &&, ||, etc.) sind auch einfach Funktionen.
-- Der einzige Unterschied ist, dass wir hier den Namen der Funktion (z.B. "+")
-- zwischen die Argumente und nicht davor schreiben.
-- Statt etwas in der Art "plus a b" zu verwenden, schreiben wir "a + b".
-- Statt "and x y" schreiben wir "x && y". Das soll den Code einfach schöner zu
-- lesen machen. Wir nennen diese Art, Funktionen anzuwenden die
-- "Infixschreibweise", im Kontrast dazu steht die bereits bekannte, sogenannte
-- "Präfixschreibweise" ("Prä" heißt vor, der Name der Funktion steht vor
-- den Argumenten).
-- Eine Funktion, die normal die Infixschreibweise verwendet (z.B. "+"), können
-- wir auch in Präfixschreibweise verwenden, indem wir sie in runde Klammern
-- packen: aus "1 + 2" wird "(+) 1 2". Beide liefern das gleiche Ergebnis.
-- Doch es geht auch andersrum, indem wir eine normale Funktion in Backticks
-- (`, auf der Tastatur <Shift+´>) stecken, können wir sie zwischen die
-- Argumente schreiben: aus "groesser x y" wird "x `groesser` y".
-- Ob euch das besser gefällt, müsst ihr selbst wissen.

-- == Aufgabe ==
-- Wandle die Infixschreibweisen in Präfixschreibweisen um:
in1 = 1 + 2
prae1 = undefined

in2 = 1 + 2 + 3 -- "+" ist linksassoziativ, zuerst sollen 1 und 2 addiert werden
prae2 = undefined

in3 = 1 - 2 + 3
prae3 = undefined

-- Wir müssen aufpassen, wenn wir Infixschreibweise und Präfixschreibweise
-- mischen: Die Präfixschreibweise bindet ihre Argumente stärker an sich als die
-- Infixschreibweise.
-- Also ist
praezedenz1 = f 2 + 3
-- das gleiche wie
praezedenz2 = (f 2) + 3
-- und eben nicht
praezedenz3 = f (2 + 3)

-- Die Funktion "subtract a b" berechnet "b - a"
-- Was ist das Ergebnis von
praezedenz4 = 2 + subtract 3 2 - 4
-- und wie müsste man die Klammern setzen?
-- Probiert es aus, danach könnt ihr in GHCi das Ergebnis prüfen.

-- == If-then-else ==
-- Zurück zu Funktionsdefinitionen. Wir wollen nun den Betrag einer Zahl
-- berechnen. Der Betrag einer Zahl ist der Abstand zur Null (Betrag von 3 ist
-- 3, Betrag von -5 ist 5).
-- Dazu müssen wir zunächst testen, ob die Zahl positiv ist oder nicht. Die
-- nötigen Vergleiche haben wir schon in der letzten Lektion kennengelernt.
-- Um uns aufgrund des Ergebnisses eines Tests unterschiedlich zu entscheiden,
-- welchen Ausdruck wir auswerten, gibt es das if-then-else-Konstrukt.
-- Es funktioniert ganz einfach! Probier es aus, indem du alle drei "undefined"
-- in der Definition von "betrag" ersetzt.
betrag :: Float -> Float
betrag x =
    if undefined -- Test
        then undefined -- Ausdruck, falls Test klappt (True)
        else undefined -- Ausdruck, falls Test fehlschlägt (False)
-- Lösung: betrag x = if x > 0 then x else -x


-- Test
testBetrag :: IO ()
testBetrag = hspec $ do
    describe "betrag" $ do
        it "ist nur für 0 auch 0" $ do
            property $ \x -> (betrag x == 0) == (x == (0::Float))
        it "ist sonst immer > 0 " $ do
            property $ \x -> x /= 0 ==> betrag x > (0::Float)

-- == Aufgabe ==
-- Je nachdem, welches Produkt man einkauft, muss man auf den Nettopreis
-- unterschiedlich viel Mehrwertsteuer zusätzlich bezahlen.
-- In unserer Welt gibt es eine Mehrwertsteuer von 19%, nur das Produkt
-- "Kartoffel" ist nur mit 7% Mehrwertsteuer belegt.
-- Definiere die Funktion brutto, die für ein Produkt (String) und einen Preis
-- (Float) ohne Mehrwertsteuer den Bruttopreis mit Mehrwertsteuer berechnet.
brutto produkt netto = undefined

-- == Aufgabe ==
-- Nutze Haskell, um bei Schere-Stein-Papier zu gewinnen!
-- Die Funktion bekommt das Zeichen, das der Gegner nimmt als Argument, und
-- entscheidet dann, welches Zeichen zurückgegeben werden muss um zu gewinnen.
konter gegner =
    if undefined then
        undefined
    else
        undefined -- hier fehlt noch ein weiterer Test

-- Lösung:
-- konter gegner =
--     if gegner == "Schere" then
--         "Stein"
--     else
--         if gegner == "Stein" then
--             "Papier"
--         else
--             "Schere"

-- == Bonus ==
-- Schreibe eine Funktion "schereSteinPapier", die zwei Zeichen als Argumente
-- nimmt und entscheidet, welcher Spieler gewonnen hat.
-- Es soll "Spieler 1", "Unentschieden" oder "Spieler 2" zurückgegeben werden.
-- Tipp: Man kann die Funktion "konter" wiederverwenden (muss man aber nicht).
schereSteinPapier s1 s2 = undefined
-- Lösung:
-- schereSteinPapier s1 s2 =
--     if s1 == s2 then
--         "Unentschieden"
--     else
--         if s1 == konter s2 then
--             "Spieler 1"
--         else
--             "Spieler 2"

-- == Typannotationen bei Funktionen ==
-- Zum Abschluss widmen wir uns nochmal den Typen. Wie ihr sicher gesehen habt,
-- haben Funktionen Typen, die "->" enthalten. Der Typ der Funktion "not" ist z.B.
-- "Bool -> Bool". Das heißt: "not bekommt einen Wert vom Typ Bool und liefert auch
-- einen Wert vom Typ Bool.
-- Allgemein funktioniert das Ganze so: "<Typ Argument> -> <Typ Rückgabewert>"

-- groesser0 wartet auf eine Zahl vom Typ "Float" und liefert ein "Bool" zurück
groesser0 :: Float -> Bool
groesser0 x = x > 0

-- Bekommt eine Funktion mehr als ein Argument übergeben, so werden alle Argumente
-- mit Pfeilen getrennt. Alles links vom letzten Pfeil sind nun die Argumente,
-- ganz rechts steht der Rückgabetyp.
sub :: Int -> Int -> Int -- erwartet zwei Int-Werte und liefert ein Int zurück
sub a b = a - b

-- erwartet zwei Int-Werte und liefert ein Bool zurück
kleiner :: Int -> Int -> Bool
kleiner a b = a < b

-- Entferne die Kommentare vor den Typannotationen und füge passende Annotationen
-- hinzu, sodass der Code immer noch kompiliert.

-- annot1 :: ???
annot1 x y = 2*y + x

-- annot2 :: ???
annot2 = 3 == 4

-- annot3 :: ???
annot3 x y z = x*x + y*y + z

-- annot4 :: ???
annot4 x y = if x then y+1 else y-1

-- ==  Weitere Aufgaben ==
--
-- Schreibe die Funktion "verdopple".
-- Diese soll eine Zahl aber nur verdoppeln, sofern sie kleiner als 100 ist.
-- verdopple 101 = 101
-- verdopple 90 = 180
verdopple x = undefined

-- Schreibe eine Funktion istRechtwinklig, die überprüft, ob die drei Parameter
-- a, b und c die Seitenlängen eines rechtwinkligen Dreiecks sein können. Die
-- Parameter sind dabei ganze Zahlen.
istRechtwinklig :: Integer -> Integer -> Integer -> Bool
istRechtwinklig a b c = undefined

-- Schreibe eine Funktion "innenwinkel", die den Innenwinkel eines regelmäßigen
-- n-Ecks zurückgibt.
-- Ergänze auch passende Annotationen
innenwinkel :: undefined -> undefined
innenwinkel n = undefined

-- Schreibe eine Funktion flaecheDreieck, die den Flächeninhalt eines Dreiecks berechnet.
flaecheDreieck :: undefined -> undefined -> undefined
flaecheDreieck g h = undefined

-- == Bonus ==
-- Schreibe eine Funktion flaecheNeck, die den Flächeninhalt eines regelmäßigen N-Ecks berechnet.
-- Überlege dir welche Informationen man braucht, um den Flächeninhalt vollständig zu berechnen
flaecheNeck :: undefined -> undefined -> undefined
flaecheNeck n r = undefined
