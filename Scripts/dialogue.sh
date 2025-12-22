#!/bin/bash

source config.txt

mkdir -p "$PERS"

while IFS= read -r name;  do
    echo "Processing $name..."
    clean_filename="${name// /_}"
    sed -n "/^- $name -/,/^- /p" "$INPUT" | grep -v "^- " | grep -v "^acte " | tr -s ' ' '\n' > "$PERS"/"$clean_filename".txt
    
done < "$LISTP"
