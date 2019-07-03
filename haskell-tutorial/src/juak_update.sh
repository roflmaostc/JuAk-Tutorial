#!/bin/bash

for each in `nmap -sP 10.0.0.0/24 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' `
do
    sshpass -p "blub" scp -o "StrictHostKeyChecking=no" TutListenPM04Mittwoch.hs juak@$each:/home/juak/JuAk-Tutorial/haskell-tutorial/src/
    echo $each
done
