#!/bin/bash

source config.txt

first_line="La scène est à Paris, dans la maison d'Harpagon."
last_line="Notes \[from 1890 edition\]"

echo "Nettoyage: Enlever mention legale et introduction"
echo "Nettoyage: Enlever lignes blancs et tabulations"

sed "1,/^$first_line/d; 
     /^$last_line/,\$d; 
     s/--\+//g; 
     /^[[:space:]]*$/d; 
     s/^[[:space:]]\+//;
     s/([^)]*)//g;
     s/È/è/g; s/\(.*\)/\L\1/;
     /^scène/d" "$BRUT" | tr '[:upper:]' '[:lower:]'> "$DATA/clean.txt"
