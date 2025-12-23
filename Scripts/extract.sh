#!/bin/bash

source config.txt

output="$(mktemp)"

echo "Recupere les perso (lignes commence par -)"
grep -E "^- [A-Za-z]*" "$INPUT"  > "$output"

echo "Formatage les noms des persos"
grep -oE "[A-Za-z]+( )?[A-Za-z]+" "$output" | sort | uniq > "$DATA"/list_perso.txt

echo "Recupere: la liste des actes"
grep -E "^acte*" "$INPUT" > "$DATA"/list_acte.txt
