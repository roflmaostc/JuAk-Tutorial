module Main where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game


data WorldTyp = World { 
    _xPos     :: Int,
    _yPos     :: Int,
    _breite   :: Int,
    _lPressed :: Bool,
    _rPressed :: Bool
  } deriving (Eq, Show)


initialWorld :: WorldTyp
initialWorld = World { 
    _xPos     = 0,
    _yPos     = 0,
    _breite   = 100,
    _lPressed = False,
    _rPressed = False
  }


draw :: WorldTyp -> Picture
draw world = ball
    where
        xPos = fromIntegral $ _xPos world
        yPos = fromIntegral $ _yPos world
        ball = Color red $ translate xPos yPos $ circleSolid 5

handleKeys :: Event -> WorldTyp -> WorldTyp
handleKeys (EventKey (SpecialKey KeyLeft ) Down _ _ ) world = world {_lPressed = True}
handleKeys (EventKey (SpecialKey KeyLeft ) Up _ _ ) world = world {_lPressed = False}
handleKeys (EventKey (SpecialKey KeyRight) Down _ _ ) world = world {_rPressed = True}
handleKeys (EventKey (SpecialKey KeyRight) Up _ _ ) world = world {_rPressed = False}
handleKeys _ world = world

update :: Float -> WorldTyp -> WorldTyp
update _ world = case (_lPressed world, _rPressed world) of
    (True, False) -> 
        if xPos > - breite 
        then world { _xPos = xPos - 2 } 
        else world
    (False, True) -> 
        if xPos < breite
        then world { _xPos = xPos + 2 }
        else world
    _ ->
        world
    where
        xPos = _xPos world
        breite = _breite world


main = do
  play FullScreen white 25 initialWorld draw handleKeys update

-- Aufgaben
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
