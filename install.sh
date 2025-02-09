

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

INSTALL_DIR="$HOME/.nox"

echo -e "${CYAN}🔧 Memeriksa direktori instalasi Proton...${RESET}"

if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
    echo -e "${YELLOW}📁 Membuat direktori di ${GREEN}$INSTALL_DIR${RESET}"
else
    echo -e "${GREEN}📁 Direktori instalasi sudah ada: ${GREEN}$INSTALL_DIR${RESET}"
fi


cp proton.sh "$INSTALL_DIR/"
echo -e "${YELLOW}📄 Menyalin ${GREEN}proton.sh${YELLOW} ke ${GREEN}$INSTALL_DIR/${RESET}"


if grep -q "source $INSTALL_DIR/proton.sh" "$HOME/.bashrc"; then
    echo -e "${GREEN}✅ Proton sudah terpasang di sistem.${RESET}"
else
    echo "source $INSTALL_DIR/proton.sh" >> "$HOME/.bashrc"
    echo -e "${GREEN}✅ Proton berhasil dipasang.${RESET}"
    echo -e "${YELLOW}🔄 Tutup dan buka kembali terminal, atau jalankan '${CYAN}source ~/.bashrc${YELLOW}' untuk mengaktifkan proton.${RESET}"
fi
