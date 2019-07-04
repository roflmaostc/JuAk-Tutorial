

module Main where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game





fenster = InWindow "I bims Fenster" (500, 500) (0,0)

--kreis mit Radius 50
kreis0 = circleSolid 50
-- der gleiche kreis mit Farbe rot
-- mögliche Farben sind:
-- black , white , red , green , blue , yellow , cyan , magenta,
-- rose , violet , azure , aquamarine , chartreuse , orange
roterKreis = color red kreis0

-- Aufgabe
-- probiere alle Farben einmal aus

-- damit kann man eine Linie zeichnen
pfad = line [(0,0) , (200,0) , (200,200)]



-- rechteck mit Breite 50 und Höhe 300
-- das Rechteck wird um den Punkt (0,0) zentriert
rechteck = rectangleSolid 50 300


-- eine weitere wichtige Funktion ist translate
-- hier verschieben wir das Rechteck 100 nach rechts und 0
-- nach oben
verschobenesRechteck = translate 100 0 rechteck

-- mit rotate kann man ein Rechteck um einen bestimmten
-- Winkel drehen
gedrehtesRechteck = rotate 30 rechteck


-- Text ist sehr einfach in Gloss
iBimsText = text "i bims 1 niser Text"


-- man kann auch sachen sehr leicht größer skalieren
-- die erste Zahl skaliert in x-Richtung
-- die zweite Zahl skalier in y-Richtung
-- natürlich geht auch dort Farbe ändern
skalierterTextGreen = color green (scale 0.2 0.2 iBimsText)


-- so kann man sowohl roterKreis,
-- rechteck, skalierterGreen Text zusammenpacken
objekte = pictures [roterKreis, gedrehtesRechteck, skalierterTextGreen]


-- == Aufgabe ==
-- Zeichne ein Quadrat mit Seitenlänge 400
quadrat = undefined


-- == Aufgabe ==
-- Zeichne ein Quadrat mit Seitelänge 400
-- in diesem Quadrat soll ein weiteres mit Seitenlänge 300 sein
quadrat2 = undefined
zweiQuadrate = pictures [quadrat, quadrat2]


-- == Aufgabe ==
-- Zeichne ein drittes Quadrat. Die Seitenlänge darfst du aussuchen
-- das Quadrat soll deine Lieblingsfarbe anzeigen
quadrat3 = undefined
dreiQuadrate = pictures [quadrat, quadrat2, quadrat3]

-- == Aufgabe ==
-- Drehe alle drei Quadrat um 127 Grad nach rechts
gedreht = undefined


-- == Aufgabe ==
-- drehe das erste um 10 Grad
erstesGedreht = undefined
-- drehe das zweite um 30 Grad
zweitesGedreht = undefined

-- drehe das dritte um 30 grad
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
