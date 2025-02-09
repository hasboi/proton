
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'


PROTON_DIR="$HOME/proton/proton.sh"
BASHRC_FILE="$HOME/.bashrc"
SOURCE_LINE="source $PROTON_DIR"


echo -e "${CYAN}🔧 Memulai proses instalasi Proton...${RESET}"


if ! grep -Fxq "$SOURCE_LINE" "$BASHRC_FILE"; then
    
    echo "$SOURCE_LINE" >> "$BASHRC_FILE"
    echo -e "${GREEN}✅ Baris 'source $PROTON_DIR' berhasil ditambahkan ke $BASHRC_FILE${RESET}"
    echo -e "${YELLOW}✨ Proton siap digunakan! Jangan lupa untuk menutup dan membuka kembali terminal, atau jalankan '${CYAN}source ~/.bashrc${YELLOW}' untuk mulai mengaktifkan Proton.${RESET}"
else
    echo -e "${YELLOW}⚠️  Baris 'source $PROTON_DIR' sudah ada di $BASHRC_FILE.${RESET}"
    echo -e "${CYAN}😊 Proton sudah siap digunakan sebelumnya.${RESET}"
fi

echo -e "${GREEN}🚀 Instalasi selesai!${RESET}"
