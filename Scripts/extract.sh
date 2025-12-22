#!/bin/bash

source config.txt

output="$(mktemp)"

echo "Recupere les noms (lignes commence par -)"
grep -E "^- [A-Za-z]*" "$INPUT"  > "$output"

echo "Nettoyage les noms des persos"
grep -oE "[A-Za-z]+( )?[A-Za-z]+" "$output" | sort | uniq > "$DATA"/list_perso.txt

echo "Recupere la liste des actes"
grep -E "^acte*" "$INPUT" > "$DATA"/list_acte.txt

#grep -E "^Scène*" "$input_file" > "$output"

#sed -n 's/^\(Scène [^.]*\).*/\1/p' "$output" | tr -d '\r' | sort | uniq > list_scene.txt
