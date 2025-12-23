#!/bin/bash

scripts=("format.sh" "extract.sh" "acte.sh" "dialogue.sh" "checksum.sh")

echo "J'excute les scripts..."

for script in "${scripts[@]}"; do
    if [[ -f "$script" ]]; then
        echo "------------------------------------------"
        echo "Exec: $script"
        
        # Convertit les fichier bash en executable
        chmod +x "$script"
        
        # Execute les fichier bash
        ./"$script"
        
        # Erreur-management
        if [[ $? -ne 0 ]]; then
            echo "Erreur: $script n'a pas ete completer."
            exit 1
        fi
    else
        echo "Error: $script n'existe pas."
    fi
done

echo "------------------------------------------"
echo "Réussie."
