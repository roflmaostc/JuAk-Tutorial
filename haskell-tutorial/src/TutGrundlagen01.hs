-- Wir beginnen mit unserem Haskell-Abenteuer direkt in einer Haskelldatei.
-- Das ist ein Haskell-Kommentar, Text hinter "--" in der Zeile wird ignoriert.

{-
Es gibt auch Kommentare, die mehrere Zeilen umfassen. Darin kann man längere
Erklärungen unterbringen. Ein solcher Kommentar beginnt mit "{-" und endet mit
"-}". Wir benötigen Kommentare, um komplizierten Programmcode zu erklären.
-}

-- Um die Lesbarkeit zu erleichtern, sollte jede Zeile höchstens 80 Zeichen --> lang sein, da sie sonst nicht auf kleine Bildschirme bzw. Fenster passt.

-- Damit genug zu Kommentaren, hier folgt die erste Zeile Haskell.
module TutGrundlagen01 where
-- So beginnt jede Haskelldatei. Wir starten ein neues Modul, das alle
-- Definitionen in dieser Datei gruppiert. Unser erstes Modul heißt also
-- "TutGrundlagen01". Es ist üblich, das Modul gleich wie die Datei zu nennen,
-- in der es untergebracht ist (ohne ".hs").
-- Allgemein enden Dateien, die Haskell-Code enthalten, gewöhnlicherweise auf
-- ".hs".

-- == GHCi ==
-- Der einfachste Weg, Haskell kennenzulernen, ist mit dem Programm "GHCi".
-- GHCi funktioniert in drei Schritten:
-- 1. Es erlaubt uns Haskell-Code einzugeben
-- 2. GHCi übersetzt diesen in eine Sprache, die der Computer versteht
-- 3. Die Eingabe wird ausgeführt und wir bekommen das Ergebnis angezeigt.

-- Um ein Terminal in Atom zu starten klicken wir auf "Anzeige".
-- Dann öffnet sich ein Terminal. Dieses können wir nun nach unten
-- in die Leiste ziehen.
-- Im Terminal diesem können wir nun
-- "stack ghci" eingeben, die Enter-Taste drücken und schon startet GHCi.

-- Es folgen ein paar Zeilen unwichtige Ausgabe, in der letzten Zeile sollte
-- "*Main> " erscheinen. Das ist die Aufforderung an uns, an dieser Stelle etwas
-- einzugeben, und zwar Haskell-Ausdrücke.
-- Probiert es einfach aus, GHCi funktioniert fast wie ein Taschenrechner!
-- Tipp: + - * / und statt Komma "," verwenden wir den Dezimalpunkt "."
-- Mit <Enter> könnt ihr eure Eingabe auswerten lassen.
-- Ihr bekommt dann in der nächsten Zeile ein Ergebnis oder einen Fehler.
-- Danach geht alles wieder von vorne los!
-- Um eure vorherigen Eingaben noch einmal wiederzusehen, drückt ihr einfach
-- (mehrmals) auf die Pfeil nach oben/unten Taste.

-- Genug gerechnet?
-- Das Terminalfenster können wir wie ein normales Fenster kleiner ziehen,
-- sodass es keinen Platz wegnimmt, solange wir es nicht benötigen.


-- Du solltest die Grundrechenarten plus (+), minus (-), mal (*) und geteilt (/)
-- gefunden haben.
-- Außerdem gilt auch in Haskell wie in Mathe die KlaPS-Regel:
-- Klammer vor Punkt vor Strich!
-- Wollen wir negative Zahlen multiplizieren oder dividieren, müssen wir sie in
-- Klammern setzen. Haskell weiß sonst nicht, ob ihr zwei Zahlen voneinander
-- abziehen wolltet oder der Zahl ein negatives Vorzeichen verpassen wolltet.
negMult = 12 * (-3)
-- Huch, was ist das links vom "="?

-- Ein erster Schritt, um uns in Zukunft Tipparbeit zu sparen: Wir können
-- Werten Namen geben. Das nennt man Definition.
jahr = 2019 -- Namen beginnen mit Kleinbuchstaben
-- Wir definieren "jahr" als "2019", d.h. überall, wo wir bisher "2019"
-- verwendet haben, können wir nun auch "jahr" benutzen.

monat = "Juli" -- Text wird in "..." gesetzt
-- Eine Definition hat immer die Form: "<Name> = <Wert>" oder allgemeiner
-- "<Name> = <Ausdruck>", wobei ein Ausdruck das ist, was ihr in Mathe als Term
-- kennengelernt habt.

-- Noch ein paar weitere Definitionen:
kmProMeile = 1.60934 -- Punkt statt Komma (englisch)
hoeckerAufEinemKamel = 2
-- Besteht der Name aus mehreren Wörtern?                           ,,__
-- Dann verwenden wir die Camel-Case-Schreibweise.        ..  ..   / o._)
-- Der Anfangsbuchstabe eines jeden Worts wird           /--'/--\  \-'||
-- großgeschrieben (bis auf das erste Wort).            /        \_/ / |
-- Die großen Buchstaben sollen die Höcker            .'\  \__\  __.'.'
-- eines Kamels darstellen.                             )\ |  )\ |
--                                                     // \\ // \\
--                                                    ||_  \\|_  \\_
--                                                    '--' '--'' '--'

-- Füg auch selbst Definitionen hinzu!

-- Diese Namen können wir jetzt in GHCi verwenden.
-- Dazu müssen wir diese Datei speichern. Wenn eure Datei ungespeicherte
-- Änderungen enthält, erscheint oben neben dem Dateinamen ein blauer Punkt.

-- Um die Datei zu speichern könnten wir oben im Reiter "Datei" auf "Speichern"
-- klicken. Schneller geht es aber, indem wir zuerst <Strg> und dann zusätzlich
-- <s> gleichzeitig auf der Tastatur drücken.
-- Wenn es geklappt hat, verschwindet der blaue Punkt.

-- Nun wechseln wir wieder in das Terminal, in dem GHCi läuft
-- Hier geben wir
-- ":l TutGrundlagen01" ein, drücken dann <Enter>.
-- Jetzt sind die neuen Definitionen in GHCi verfügbar. Wir können dann z.B.
-- "jahr + hoeckerAufEinemKamel" berechnen.

-- Natürlich können wir auf der rechten Seite von Definitionen komplexere
-- Ausdrücke angeben. Haskell wird diese für uns vereinfachen.
-- Haskell übernimmt bisher eigentlich nur die Aufgabe, die ihr auch in der
-- Schule habt, wenn ihr Terme vereinfachen müsst.
-- Unsere Definitionen können auch auf andere Definitionen zurückgreifen.
-- Dabei ist die Reihenfolge in der die Definitionen auftauchen egal.
laenge = 3
flaeche = laenge * laenge -- laenge²

umfang = 4 * laenge
volumen = flaeche * laenge

-- Zu was wertet Haskell die Ausdrücke aus? Finde es in GHCi heraus! Hierzu
-- wechselst du zuerst wieder ins Terminal-Fenster. Haben wir die Datei bereits
-- zuvor mit ":l TutGrundlagen01" geladen, reicht es nun ":r" einzugeben um die
-- neue Version der Datei an GHCi zu übergeben.
