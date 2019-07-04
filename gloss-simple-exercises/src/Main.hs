module Main where

-- Das ist Gloss, die Library, mit der wir unsere Spiele entwickeln werden
-- Eine Library ist in diesem Fall eine Ansammlung von Funktionen, die es uns
-- erlaubt, mit Haskell zu zeichnen.
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

-- Das ist das Fenster, in dem später gezeichnet wird.
fenster = InWindow "Ich bins, der Fenstertitel" (500, 500) (0,0)
--                                              Es ist 500*500 Pixel groß

-- Das ist ein (schwarzer) Kreis mit Radius 50 Pixel
kreis0 = circleSolid 50

-- Nun der gleiche Kreis, nur diesmal in rot.
-- Dafür gibt es die Funktion "color", die auf eine Farbe und eine Zeichnung
-- wartet und diese dann einfärbt.
roterKreis = color red kreis0
-- Andere mögliche Farben wären:
-- black, white, red, green, blue, yellow, cyan, magenta,
-- rose, violet, azure, aquamarine, chartreuse, orange

-- == Aufgabe ==
-- Lass doch deinen Kreis einmal blau oder grün erscheinen!

-- Um eine Linie zu zeichnen, gibt es die Funktion "line".
-- Diese bekommt eine Liste von Punkten, an denen die Linie vorbeikommen soll.
-- Ein Punkt ist dabei (x,y).
-- x sagt, wie weit der Punkt rechts sein soll, je größer y, desto höher 
-- der Punkt. Es sind auch negative Werte für x und y möglich.
-- Die Mitte liegt bei (0,0).
pfad = line [(0,0), (200,0), (200,300)]

-- == Aufgabe ==
-- 1. Erweitere den Pfad so, dass er eine U-Form bildet.
-- 2. Versuche dich an einem Dreieck aus dem "pfad".

-- Die Funktion "rechteck hoehe breite" gibt uns ein Rechteck mir Breite
-- "breite" und Höhe "hoehe", in diesem Fall 50 und 300.
-- Das Rechteck wird so platziert, dass es mitten auf (0,0) liegt.
rechteck = rectangleSolid 50 300

-- == Aufgabe ==
-- Wie kannst du wohl "rechteck" blau machen?

-- Eine weitere wichtige Funktion ist "translate", die Zeichnungen verschieben
-- kann. Hier verschieben wir das Rechteck 100 nach rechts und nicht nach oben.
verschobenesRechteck = translate 100 0 rechteck

-- == Aufgabe ==
-- Verschiebe das Rechteck soweit, dass du es nicht mehr sehen kannst.

-- Mit der Funktion "rotate" kann man ein Rechteck drehen. Dabei gibt man an,
-- wie viele Grad die Zeichnung gedreht werden soll, in diesem Fall 30.
gedrehtesRechteck = rotate 30 rechteck


-- Text ist auch kein Hexenwerk, genau dafür gibt es die Funktion "text",
-- die einen String als Argument nimmt und diesen anzeigt.
iBimsText = text "Teile dieses Kurses könnten die Teilnehmer*innen verunsichern"

-- Man kann Zeichnungen sehr eingach in der Größe verändern (skalieren).
-- Die erste Zahl skaliert in x-Richtung.
-- Die zweite Zahl skaliert in y-Richtung.
-- Das schöne ist, dass man mehrere Änderungen kombinieren kann, hier ändern
-- wir z.B. auch die Farbe:
skalierterTextGreen = color green (scale 0.2 0.2 iBimsText)

-- == Aufgabe ==
-- Skaliere den Text so klein, bis du ihn nicht mehr lesen kannst, dann
-- so groß, dass er nicht mehr in das Fenster passt.

-- Auf Dauer ist es langweilig, wenn die Zeichnung nur aus einem Objekt besteht.
-- Mit der Funktion "pictures" lässt sich das ändern.
-- So kann man sowohl roterKreis, rechteck, skalierterGreen Text zusammenpacken:
objekte = pictures [roterKreis, gedrehtesRechteck, skalierterTextGreen]

-- == Aufgabe ==
-- Überlege, was "pictures []" darstellt.

-- == Aufgabe ==
-- Zeichne ein Quadrat mit Seitenlänge 400
quadrat = undefined

-- == Aufgabe ==
-- Zeichne dasselbe Quadrat nochmal.
-- In diesem Quadrat soll sich ein weiteres mit Seitenlänge 300 befinden.
quadrat2 = undefined
zweiQuadrate = pictures [quadrat, quadrat2]

-- == Aufgabe ==
-- Zeichne ein drittes Quadrat. Die Seitenlänge darfst du aussuchen
-- Das Quadrat soll deine Lieblingsfarbe anzeigen
quadrat3 = undefined
dreiQuadrate = pictures [quadrat, quadrat2, quadrat3]

-- == Aufgabe ==
-- Was ist der Effekt, wenn du die Reihenfolge in der Liste, die du an 
-- "pictures" übergibst, veränderst?

-- == Aufgabe ==
-- Drehe alle drei Quadrat um 127 Grad nach rechts
gedreht = undefined

-- == Aufgabe ==
-- Drehe das erste Quadrat um 10 Grad
erstesGedreht = undefined

-- Drehe das Zweite um 30 Grad
zweitesGedreht = undefined

-- Drehe das Dritte um 30 grad
drittesGedreht = undefined

-- Zeige nun alle gemeinsam an


-- == Aufgabe ==
-- Kannst du das Haus vom Nikolaus malen?
-- versuche dir das Haus in einzelne Bestandteile zu zerlegen

-- == Aufgabe ==
-- Kannst du darunter den Spruch schreiben?
-- "Das ist das Haus vom Nikolaus"

-- == Aufgabe ==
-- Versuche eine Uhr zu malen
-- Zerlege wieder in die einzelnen Teile


-- == Bonus ==
-- versuche weitere komplizierte Funktionen zu malen
-- Schachbrettmuster?


-- == Aufgabe ==
-- Male drei Kreise mit Radius 10, 20, 30
-- die nebeneinander liegen
kreis1 = undefined
kreis2 = undefined
kreis3 = undefined
kreise = pictures [kreis1, kreis2, kreis3]



-- dies sollte immer ganz unten stehen
-- display ist die Funktion die anzeigt
-- sie bekommt immer ein fenster
-- und sie bekommt immer eine Farbe, hier weiß
-- und sie bekommt immer objekte
main = display fenster white pfad
