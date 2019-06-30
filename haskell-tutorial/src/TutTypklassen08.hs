-- Ein fortgeschritteneres Thema im Zusammenhang mit Typen: Typklassen
module TutTypklassen08 where
import TutRekTypen06

-- Viele Typen sind sich recht ähnlich:
-- Mit Float und Int können wir rechnen, viele Typen bieten Funktionen
-- (>=, ==, etc.) an, mit denen wir ihre Elemente vergleichen können.
-- Bisher mussten wir aber Funktionen, die z.B. + oder * verwenden auf einen
-- bestimmten Typen beschränken.

-- Wir haben aber auch bereits das Konzept von Typvariablen kennengelernt:
-- Sie stehen für konkrete Typen und erlauben es uns z.B. Listen zu definieren,
-- in denen Elemente eines beliebigen Typs gespeichert werden können.
-- Diese Typvariablen tauchen dann auch in der Definition von Funktionen über
-- Listen wieder auf, z.B.:
-- verkette :: Liste a -> Liste a -> Liste a

-- Könnten wir nicht auch so unsere Funktionen, die Berechnungen auf Zahlen
-- ausführen definieren?
-- addiere :: a -> a -> a
-- addiere x y = x + y
-- Wenn du die Kommentare entfernst, wirst du sehen, dass sich Haskell
-- beschwert: "No instance for (Num a) arising from a use of '+'." - Was so
-- viel heißt wie: Du hast '+' verwendet, aber a ist nicht unbedingt eine
-- Zahl (Num). Und der Compiler hat recht: Was sollte z.B. das Ergebnis von
-- "addiere True False" sein? Der Typ Bool (und viele weitere) implementiert
-- keine Funktion "+".
--
-- Aber Haskell bietet eine Lösung an: Typklassen.
-- Eine Typklasse definiert einfach, welche Funktionen ein Typ, der Mitglied
-- dieser Typklasse sein will, implementieren muss.
-- Es gibt z.B. die Typklasse "Num" für Zahlen. Instanzen dieser Typklasse
-- (also alle Typen, die Zahlen darstellen wie Float, Int, etc.) müssen
-- Addition (+), Subtraktion (-), Multiplikation (*) und einige weitere
-- Funktionen definieren. Die gesamte Liste an Funktionen lässt sich in GHCi
-- mit ":i Num" betrachten.
--
-- Achtung: Ein Typ kann Instanzen von mehreren verschiedenen Typklassen
-- implementieren.
--
-- Wenn wir nun also einschränken, dass unsere Typvariable "a" für einen
-- Typen stehen muss, der Teil der Typklasse "Num" ist, dürfen wir die
-- Funktion "+" verwenden.
addiere' :: Num a => a -> a -> a
addiere' x y = x + y
-- Alles was wir gemacht haben: in der Typannotation "Num a =>" hinzugefügt.
-- Was das heißt? Wir schränken die Typvariable "a" so ein, dass sie nur für
-- Typen stehen kann, die das Interface/die Typklasse "Num" implementieren.
-- Damit können wir in der Funktionsdefinition davon ausgehen, dass x und y
-- die Funktion (+) implementieren.

-- Ein Beispiel wie man eine Instanz einer Typklasse definiert?
-- Wir hatten die Peanozahlen angeschaut, diese kann ganz einfach Instanz der
-- Typklasse werden. Hierfür können wir die bereits implementierten
-- Funktionen aus der Lektion verwenden.

instance Num Nat where
 (+) = plus -- Wir geben der Funktion plus einen weiteren Namen
 (-) = minus
 (*) = mul
 abs x = x -- Betrag: ändert nichts, da wir nur Zahlen >= 0 darstellen können
 signum x = Nachfolger Null -- Vorzeichen: Eins für positive Zahlen
 fromInteger = vonInt

-- Jetzt können wir die Funktion "addiere'" auch auf "Nat"-Zahlen anwenden:
addiereNats = addiere' (Nachfolger Null) Null

-- Noch nicht ganz klar?
-- Wir schauen uns als weiteres Beispiel die wohl verbreitetste Typklasse an,
-- sie heißt "Eq". Ein Typ, der Instanz dieser Klasse ist, erlaubt Tests auf
-- Gleichheit (engl. equality) mit der Funktion (==).
-- Wenn wir die mit ":i Eq" uns wieder Infos über die Typklasse geben lassen,
-- sehen wir, dass uns zusätzlich die Funktion (/=) zur Verfügung gestellt
-- wird.
-- Fast jeder Typ in Haskell implementiert die Typklasse "Eq", Funktionen
-- aber nicht. Warum?
-- Das interessante an der Typklasse "Eq" ist, dass Haskell die benötigte
-- Funktion (==) automatisch für uns definieren kann. Wenn wir einen neuen
-- Typen definieren, können wir den Zusatz "deriving Eq" verwenden, um den
-- Typen automatisch zu einer Instanz von "Eq" zu machen.
-- Dieses Vorgehen hast du im Tutorial vielleicht schon einmal gesehen.

-- Ein kleines Beispiel zu "deriving":
data Tier = Hund | Katze | Maus
    deriving Eq

hundGleichKatze = Hund == Katze

-- Wir konnten auch ohne die Typklasse "Eq" schon auf Gleichheit testen,
-- und zwar mittels Pattern-Matching:
istHund Hund = True
istHund Katze = False
istHund Maus = False

-- Mit der "Eq"-Instanz geht das nun etwas kürzer:
istHund' x = x == Hund -- man kann sich hier Klammern um (x == Hund) denken.

-- Wir sind aber nicht auf die Typklassen beschränkt, die Haskell uns schon
-- mitliefert, sondern können auch selbst eigene Typklassen hinzufügen.

-- Hier löst sich auch ein altes Geheimnis: Die ganzen Funktionen, die mit 
-- Zahlen arbeiten wie (+,-,*,/, etc.) funktionieren mit Typklassen.
-- Die Typen kannst du dir ja in GHCi mit z.B. ":t (+)" anzeigen lassen.
-- Hier die Ausgabe für "+": (+) :: Num a => a -> a -> a

-- TODO: selbst definieren

