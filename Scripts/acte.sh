#!/bin/bash

# Assignation des variables
source config.txt

# Creer la dossier s'il elle n'existe pas encore
mkdir -p "$ACTE"

# Parcourir le fichier liste d'actes

# Utilisation de IFS. On precise que la limite de lecture sont des lignes du fichier txt
while IFS= read -r line; do

    # Anonncer la ligne de lecture. Nettoyage des noms (supprimer les espaces blanc en trop)
    name=$(echo "$line" | sed 's/acte //; s/\.//; s/\r//')
    echo "Processing $name..."

    # Selectionner la ligne de lecture actuel jusqu'au prochain apparition de mot "acte" -> sed
    # Ne pas selectionner la ligne commencer par acte -> grep
    # Ne pas selectionner la ligne commencer par un "-" -> grep
    # Imprimer mots par mots dans le fichier du acte correspondant
    sed -n "/^$line/,/^acte/p" "$INPUT" | grep -v "^acte " | grep -v "^- "  | tr ' ' "\n" > "$ACTE"/"${name}".txt
   
done < "$LIST" #input
