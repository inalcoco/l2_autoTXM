#!/bin/bash

# On assigne les variables
source config.txt

# Creer la dossier s'il elle n'existe pas
mkdir -p "$ACTE"

# Parcours le fichier list d'actes
# Et faire:
while IFS= read -r line; do

    name=$(echo "$line" | sed 's/acte //; s/\.//; s/\r//')
      
    echo "Processing $name..."
    
    sed -n "/^$line/,/^acte/p" "$INPUT" | grep -v "^acte " | grep -v "^- "  | tr ' ' "\n" > "$ACTE"/"${name}".txt
   
done < "$LIST"
