#!/bin/bash

source config.txt

count_clean=$(wc -w < "$INPUT")
count_brut=$(wc -w < "$BRUT")
count_acte=$(cat "$ACTE"/*.txt | wc -w)
count_pers=$(cat "$PERS"/*.txt | wc -w)

if [ "$count_clean" -gt "$count_brut" ]; then
  echo "Bizarre! CLEAN larger than BRUT $count_clean vs $count_brut"
else
  echo "CLEAN conforme!"
fi

if [ "$count_acte" -gt "$count_clean" ]; then
  echo "Bizarre! ACTE larger than CLEAN: $count_acte vs $count_clean"
else
  echo "ACTE conforme!"
fi 

if [ "$count_pers" -gt "$count_clean" ]; then
  echo "Bizarre! PERS larger than CLEAN: $count_pers vs $count_clean"
else
  echo "PERS conforme!"
fi
