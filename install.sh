#!/bin/bash

# Definisikan path ke file proton.sh
PROTON_DIR="$HOME/proton/proton.sh"
BASHRC_FILE="$HOME/.bashrc"
SOURCE_LINE="source $PROTON_DIR"

# Cek apakah baris source sudah ada di .bashrc
if ! grep -Fxq "$SOURCE_LINE" "$BASHRC_FILE"; then
    # Jika belum ada, tambahkan baris
    echo "$SOURCE_LINE" >> "$BASHRC_FILE"
    echo "Baris 'source $PROTON_DIR' telah ditambahkan ke $BASHRC_FILE"
else
    echo "Baris 'source $PROTON_DIR' sudah ada di $BASHRC_FILE"
fi
