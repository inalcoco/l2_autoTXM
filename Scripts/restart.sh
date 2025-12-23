#!/bin/bash

source config.txt

echo "Nettoyage des fichier"

rm -rf "${OUT}"/*
rm -rf "${DATA}"/*

wget -P "$DATA" "$TEXTE"
