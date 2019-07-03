-- In dieser Lektion werden wir versuchen unser gelerntes Wissen an einem
-- etwas größeren Beispiel anzuwenden.
module TutBinaerBaum where
import qualified Data.Tree.Pretty as DTP
import qualified Data.Tree as DT hiding (Tree(Leaf,Node))

-- Das Modul heißt Binärbaum, es handelt sich dabei um eine Datenstruktur, die
-- wie eine Liste viele Elemente des gleichen Typs speichern kann.
-- Der Binärbaum hat aber den Vorteil, dass wir an einzelne Elemente schneller
-- hinkommen als es bei einer Liste der Fall ist.
-- Warum? Dazu müssen wir uns den Baum etwas genauer ansehen.

-- Binärbaum
-- Erklärungen sind nun im PDF
data Tree = Leaf | Node Int Tree Tree deriving (Show, Eq)


-- Nicht wichtig für euch :p
--
toDT Leaf = DT.Node "Leaf" []
toDT (Node x l r) = DT.Node (show x) [toDT l, toDT r]
showBinTree t = putStrLn $ DTP.drawVerticalTree (toDT t)




-- == Aufgaben ==

-- Schreibe eine Funktion, die die Wurzel zurückgibt
wurzel :: Tree -> Int
wurzel t = undefined

-- Schreibe eine Funktion, die das linke Kind der Wurzel zurückgibt
linkesKind :: Tree -> Int
linkesKind t = undefined

-- Schreibe eine Funktion, die das rechte Kind der Wurzel zurückgibt
rechtesKind :: Tree -> Int
rechtesKind t = undefined


-- Schreibe eine Funktion, die das linkeste Kind zurückgibt
-- ALso das Kind, das ganz links steht
linkestesKind :: Tree -> Int
linkestesKind t = undefined

-- Schreibe eine Funktion, die überprüft, ob eine 3 im Baum ist
dreiImBaum :: Tree -> Bool
dreiImBaum t = undefined


-- Schreibe eine Funktion, die überprüft, ob eine 3 oder 4 im Baum ist
dreiOderVierImBaum :: Tree -> Bool
dreiOderVierImBaum t = undefined


-- Schreibe eine Funktion, die den kleinsten Schlüssel eines Binärbaums ausgibt
min :: Tree -> Int
min t = undefined


-- Schreibe eine Funktion, die den größten Schlüssel eines Binärbaums ausgibt
max :: Tree -> Int
max t = undefined


-- Schreibe die Funktion, die ein Element in den Baum einfügt
einfuegen :: Tree -> Int -> Tree
einfuegen t x = undefined


-- Schreibe eine Funktion, die alle Elemente als Liste sortiert zurückgibt.
elemente :: Tree -> [a]
elemente t = undefined


-- == Bonus, schwer ==
-- Schreibe eine Funktion, die ein Element aus dem Baum löscht
loesche :: Tree -> Int -> Tree
loesche t elem = undefined




-- Nun bearbeiten wir den Key-Value-Binärbaum.
-- Definiere den Datentyp mit dem PDF
data TreeKV = LeafKV | NodeKV (Int,String) TreeKV TreeKV deriving (Show, Eq)

-- == Aufgaben ==


-- Schreib eine Funktion, die den ersten key eines key-value-Binärbaums zurückgibt
ersterKey :: TreeKV -> Int
ersterKey t = undefined


-- Schreibe eine Funktiion, die den ersten Value eines key-value-Binärbaums zurückgibt
ersterValue :: TreeKV -> String
ersterValue t = undefined



-- Schreibe eine Funktion, die den Wert zu einem Schlüssen ausgibt
get :: TreeKV -> a -> b
get t k = undefined


-- Definiere die Funktion, die ein Schlüssel-Werte-Paar in einen Baum einfügt
einfuegenkv :: TreeKV -> a -> b -> TreeKV 
einfuegenkv t k v = undefined


-- Programmiere die Funktion, die einen Schlüssel aus dem Baum entfernt
loeschen :: TreeKV -> a -> TreeKV 
loeschen t k = undefined


-- Schreibe eine Funktion, die alle Schlüssel als Liste zurückgibt.
schluessel :: TreeKV -> [a]
schluessel t = undefined

-- Schreibe eine Funktion, die alle Werte als Liste zurückgibt.
werte :: TreeKV -> [b]
werte t = undefined


-- Definiere eine Funktion, die alle Werte auf einen neuen Wert abbildet.
-- Der Parameter für die neue Abbildung ist die map-Funktion (b -> c)
treeMap :: TreeKV -> (b -> c) -> TreeKV 
treeMap t f = undefined
