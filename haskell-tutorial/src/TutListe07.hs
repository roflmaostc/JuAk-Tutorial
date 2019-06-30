{-# LANGUAGE DeriveGeneric    #-}
{-# LANGUAGE FlexibleContexts #-}

-- Listen selbst bauen.
module TutListe07 where
import           Data.DeriveTH
import           Generic.Random
import           GHC.Generics    (Generic)
import           Test.Hspec
import           Test.QuickCheck
-- Listen funktionieren fast wie die Peano-Zahlen aus dem letzten Kapitel:
-- Es gibt eine leere Liste, die der Null entspricht, alle anderen Listen sind
-- zusammengesetzt aus einem Element, das Daten speichert und dem Rest der
-- Liste. Haskell bringt bereits einen Datentypen für mit, aber niemand hindert
-- uns, einen eigenen Datentyp für Listen zu basteln, der beispielsweise eine
-- Menge "Int"-Werte speichern kann:
data ListeInt = Leer | Kette Int ListeInt
    deriving(Eq, Show, Generic) -- für Tests benötigt

-- [1,2,3]
liste1 = Kette 1 (Kette 2 (Kette 3 Leer))
-- []
liste2 = Leer

-- Aufgabe:
-- Schreibe eine Funktion laengeInt, die die Anzahl Elemente in der Liste
-- bestimmt
laengeInt :: ListeInt -> Int
laengeInt Leer           = undefined -- leere Liste, wie viele Elemente?
laengeInt (Kette x rest) = undefined
-- Länge einer solchen Liste: 1+Länge des Rests
-- Lösung:
-- laengeInt Leer           = 0 -- leere Liste, wie viele Elemente?
-- laengeInt (Kette x rest) = 1 + laengeInt rest

-- Test
instance Arbitrary ListeInt where
   arbitrary = genericArbitraryU

testLaengeInt :: IO ()
testLaengeInt = hspec $ do
    describe "laengeInt" $ do
        it "Länge von Kette 3 Leer ist 1" $
            laengeInt (Kette 3 Leer) `shouldBe` 1
        it "ist nur für Leer 0" $
            property $ \x -> (laengeInt x == 0) == (x == Leer)
        it "ist sonst immer > 0 " $ do
            property $ \x -> x /= Leer ==> laengeInt x > 0

-- Aufgabe:
-- Häufig möchten wir zwei existierende Listen aneinanderhängen. Eine Funktion
-- verketteInt soll uns dabei behilflich sein.
-- Falls du nicht selbst klarkommst, schau bei den Peano-Zahlen nach.
-- Die Lösung hier ist sehr ähnlich.
verketteInt :: ListeInt -> ListeInt -> ListeInt
verketteInt Leer l2             = undefined
verketteInt (Kette x1 rest1) l2 = undefined

-- Test
testVerketteInt = hspec $ do
    describe "verkette" $ do
        it "Länge des Resultats ist Summe der Argumente" $ do
            property $ \x y ->
                (laengeInt x + laengeInt y == laengeInt (verketteInt x y))

-- Unsere Liste kann nur Elemente vom Typ "Int" speichern. Wollen wir aber
-- Floats oder Strings in eine Liste packen, müssten wir für sie eigene Typen
-- "FloatListe" und "StringListe" definieren. Das Problem dabei: Wir müssten
-- alle Funktionen (verkette, laenge, etc.) neu für jeden Typen definieren,
-- obwohl die Definition immer gleich wäre.
-- Unser Ziel: ein einziger Datentyp für Listen, der beliebige Datentypen
-- speichern kann. (Achtung: Trotzdem kann eine bestimmte Liste immer nur
-- Elemente vom gleichen Typ enthalten)

-- Die Lösung ist recht einfach: wir ersetzen das Int in "Kette Int ListeInt"
-- durch eine Variable, die für einen beliebigen Typen stehen kann:
-- data Liste a = Leer | Kette a Liste
-- Unser Typ Liste ist nun von einer Typvariable a abhängig, für die wir z.B.
-- auch Int einsetzen können. Eine "Liste Int" entspricht also unserer
-- alten "ListeInt".
-- Wo wir gerade dabei sind einen neuen Typen zu definieren, können wir auch
-- gleich die Konstruktoren so benennen, wie es in Haskell üblich ist.
-- Die leere Liste heißt "Nil", der andere Konstruktor "Cons".
data Liste a = Nil | Cons a (Liste a)
    deriving(Eq, Show, Generic) -- für Tests benötigt

-- Aufgabe:
-- implementiere die laenge-Funktion nach dem Vorbild der laengeInt-Funktion.
laenge :: Liste a -> Int
laenge l           = undefined -- Pattern Matching!
-- Lösung:
-- laenge Nil         = 0
-- laenge (Cons _ xs) = 1 + laenge xs

-- Aufgabe:
-- implementiere die verkette-Funktion.
verkette :: Liste a -> Liste a -> Liste a
verkette l1 l2            = undefined
-- Lösung:
-- verkette Nil l2           = l2
-- verkette (Cons x1 xs1) l2 = Cons x1 (verkette xs1 l2)

l1 = verkette (Cons "test" Nil) Nil
l2 = verkette (Cons "Apfel" Nil) (Cons "Birne" (Cons "Zitrone" Nil))

-- Aufgabe:
-- Drehe eine Liste um, teste deine Funktion mit "testUmdrehen"
-- Tipp: Du wirst "verkette" brauchen
umdrehen :: Liste a -> Liste a
umdrehen Nil         = undefined
umdrehen (Cons x xs) = undefined

-- Lösung:
-- umdrehen Nil         = Nil
-- umdrehen (Cons x xs) = verkette (umdrehen xs) (Cons x Nil)

-- Test
instance Arbitrary a => Arbitrary (Liste a) where
   arbitrary = genericArbitraryU

testUmdrehen = hspec $ do
    describe "umdrehen" $ do
        it "Liste bleibt gleich lang" $ do
            property $ (\x -> laenge (x::Liste Int) == laenge (umdrehen x))
        it "2 mal umdrehen = nichts tun" $ do
            property $ (\x -> umdrehen (umdrehen (x::Liste Int)) == x)

-- Bonus:
-- Aufgabe:
-- Wir definieren eine Funktion "element", die einen Wert und eine Liste als
-- Argument übernehmen. Die Funktion soll "True" zurückgeben, falls der Wert in
-- der Liste enthalten ist, ansonsten False.
element :: a -> Liste a -> Bool
element a Nil         = undefined
element a (Cons x xs) = undefined

testElement = hspec $ do
    describe "element" $ do
        it "element x Nil = False" $ do
            property $ (\x -> element (x::Int) Nil == False)

-- Aufgabe:
-- Implementiere eine Funktion mapListe, die eine Funktion f auf jedes Element
-- in einer Liste anwendet. So soll beispielsweise die Funktion nachfolger
-- angewandt auf die Liste [1,2,3] (d.h. Kette 1 (Kette 2 (Kette 3 Leer))))
-- zum Ergebnis [2,3,4] führen.
mapListe :: (a -> a) -> Liste a -> Liste a
mapListe f Nil         = undefined
mapListe f (Cons x xs) = undefined

testMapListe = hspec $ do
    describe "mapListe" $ do
        it "Liste bleibt gleich lang" $ do
            property $ (\x -> laenge (x::Liste Int) == laenge (mapListe (+1) x))
        it "mapListe nachfolger [1,2,3] = [2,3,4]" $ do
            mapListe succ (Cons (1::Int) (Cons 2 (Cons 3 Nil)))
                `shouldBe` (Cons 2 (Cons 3 (Cons 4 Nil)))

-- Aufgabe:
-- Implementiere eine Funktion filterListe, die eine Funktion p auf jedes
-- Element in der Liste anwendet. Wertet die Funktion auf einem Element zu True
-- aus, soll das Element in der Liste bleiben, ansonsten entfernt werden.
-- Beispiel: filterListe even [1,2,3,4,5] = [2,4]
-- "even" ist eine Funktion, die für gerade Zahlen zu True auswertet,
-- für ungerade Zahlen zu False.
filterListe :: (a -> Bool) -> Liste a -> Liste a
filterListe p Nil         = undefined
filterListe p (Cons x xs) = undefined

testFilterListe = hspec $ do
    describe "filterListe" $ do
        it "Liste wird nicht länger" $ do
            property $ (\x ->
                laenge (filterListe even (x::Liste Int)) <= laenge x)
        it "Alle Elemente, auf die p zutrifft, bleiben in der Liste" $ do
            property $ (\x xs -> even x ==>
                element (x::Int) xs ==> element x (filterListe even xs))
        it "Alle Elemente, auf die p nicht zutrifft, sind nicht in der Liste" $ do
            property $ (\x xs -> not (even x) ==>
                element (x::Int) xs ==> not (element x (filterListe even xs)))
