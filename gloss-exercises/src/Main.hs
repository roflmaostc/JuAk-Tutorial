module Main where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

data WorldTyp = World { 
    xPos     :: Float,
    yPos     :: Float,
    breite   :: Float,
    rPressed :: Bool,
    lPressed :: Bool
  } deriving (Eq, Show)


initialWorld :: WorldTyp
initialWorld = World { 
    xPos     = 0,
    yPos     = 0,
    breite   = 100,
    rPressed = False,
    lPressed = False
  }


draw :: WorldTyp -> Picture
draw world = ball
    where
        x = xPos world
        y = yPos world
        ball = color red $ translate x y $ circleSolid 5

handleKeys :: Event -> WorldTyp -> WorldTyp
handleKeys (EventKey (SpecialKey KeyLeft) Down _ _ ) world = 
  world { lPressed = True }
handleKeys (EventKey (SpecialKey KeyLeft) Up _ _ ) world = 
  world { lPressed = False}
handleKeys (EventKey (SpecialKey KeyRight) Down _ _ ) world = 
  world { rPressed = True }
handleKeys (EventKey (SpecialKey KeyRight) Up _ _ ) world =
  world { rPressed = False }
handleKeys _ world = world

update :: Float -> WorldTyp -> WorldTyp
update _ world = case (lPressed world, rPressed world) of
    -- Taste nach links gedrückt
    (True, False) -> 
        if x > - b
        then world { xPos = x - 2 } 
        else world
    -- Taste nach rechts gedrückt
    (False, True) -> 
        if x < b
        then world { xPos = x + 2 }
        else world
    _ ->
        world
    where
        x = xPos world
        b = breite world

-- Spielt im Vollbild, mit 25 Bildern pro Sekunde.
-- Zum Zeichnen wird die Funktion "draw" benutzt.
-- Wird eine Taste gedrückt oder losgelassen, wird die Funktion "handleKeys"
-- aufgerufen.
-- 25 mal pro Sekunde wird "update" aufgerufen.
main = play FullScreen white 25 initialWorld draw handleKeys update

-- == Aufgaben ==
-- 1.
-- Erweitere das Spiel so, dass der rote Punkt sich nur
-- in einem Rechteck bewegen darf.
-- Das Rechteck soll farblich erkennbar sein


-- 2.
-- Erweitere das Spiel um eine Farbzone. Berührt der Spieler eine solche Zone
-- soll sich seine Farbe zu grün ändern.
-- Form und Größe der Farbzone ist dir überlassen.


-- 3.
-- Erweitere das Spiel um einen weiteren Spieler.
-- Form, Größe und Farbe darfst du entscheiden.
-- dieser Spieler soll sich mit den Tasten w,a,s,d bewegen können.


-- 4.
-- Baue daraus einen Wettkampf.
-- Spieler 1 muss Spieler 2 fangen. Schafft er dies, so soll dies auf dem
-- Bildschirm in irgendeiner Art und Weise gekennzeichnet werden.


-- 5.
-- Erweitere das Spiel um einen weiteren Gegner.
-- Der Gegner soll irgendeine automatische, vom Computer gesteuerte Bewegung sein.
-- Er kann sich einfach nur nach links und rechts bewegen
-- oder auch im Viereck fahren.
-- Berührt Spieler 1 oder Spieler 2 diesen,
-- so verliert der jeweilige Spieler.
