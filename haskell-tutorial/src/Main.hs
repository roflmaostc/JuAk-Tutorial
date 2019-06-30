module Main where
helloworld = hello ++ world -- "++" hängt zwei Zeichenketten aneinander
hello = "Hello, "
world = "World!"

-- Das ist die Main-Funktion: Diese wird ausgeführt, wenn das Programm mit
-- "stack run" ausgeführt wird. Wir werden sie uns später genauer anschauen.
main = putStrLn helloworld -- putStrLn gibt eine Zeichenkette (String) aus
