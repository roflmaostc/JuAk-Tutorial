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
data Tree a = Leaf | Node (Tree a) a (Tree a)
    deriving (Show)

toDT Leaf = DT.Node "Leaf" []
toDT (Node l x r) = DT.Node (show x) [toDT l, toDT r]

showBinTree t = putStrLn $ DTP.drawVerticalTree (toDT t)

-- == Aufgaben ==
-- Schreibe die Funktion, die ein Element in den Baum einfügt
einfuegen :: Tree a -> a -> Tree a
einfuegen t x = undefined


-- Schreibe eine Funktion, die den kleinsten Schlüssel eines Binärbaums ausgibt
min :: Tree a -> a
min t = undefined


-- Schreibe eine Funktion, die den größten Schlüssel eines Binärbaums ausgibt
max :: Tree a -> a
max t = undefined


-- Schreibe eine Funktion, die alle Elemente als Liste sortiert zurückgibt.
elemente :: Tree a -> [a]
elemente t = undefined



-- Nun bearbeiten wir den Key-Value-Binärbaum.
-- Definiere den Datentyp mit dem PDF
data Kvtree a b = Kvtree

-- == Aufgaben ==


-- Schreibe eine Funktion, die den Wert zu einem Schlüssen ausgibt
get :: Kvtree a b -> a -> b
get t k = undefined


-- Definiere die Funktion, die ein Schlüssel-Werte-Paar in einen Baum einfügt
einfuegenkv :: Kvtree a b -> a -> b -> Kvtree a b
einfuegenkv t k v = undefined


-- Programmiere die Funktion, die einen Schlüssel aus dem Baum entfernt
loeschen :: Kvtree a b -> a -> Kvtree a b
loeschen t k = undefined


-- Schreibe eine Funktion, die alle Schlüssel als Liste zurückgibt.
schluessel :: Kvtree a b -> [a]
schluessel t = undefined

-- Schreibe eine Funktion, die alle Werte als Liste zurückgibt.
werte :: Kvtree a b -> [b]
werte t = undefined


-- Definiere eine Funktion, die alle Werte auf einen neuen Wert abbildet.
-- Der Parameter für die neue Abbildung ist die map-Funktion (b -> c)
treeMap :: Kvtree a b -> (b -> c) -> Kvtree a c
treeMap t f = undefined
