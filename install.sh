GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

PROTON_DIR="$HOME/proton"

echo -e "${CYAN}🔧 Memeriksa direktori instalasi Proton...${RESET}"

# Cek apakah direktori proton ada, jika tidak buat direktori tersebut
if [ ! -d "$PROTON_DIR" ]; then
    mkdir -p "$PROTON_DIR"
    echo -e "${YELLOW}📁 Membuat direktori di ${GREEN}$PROTON_DIR${RESET}"
else
    echo -e "${GREEN}📁 Direktori instalasi sudah ada: ${GREEN}$PROTON_DIR${RESET}"
fi

# Salin file proton.sh ke direktori proton
cp proton.sh "$PROTON_DIR/"
echo -e "${YELLOW}📄 Menyalin ${GREEN}proton.sh${YELLOW} ke ${GREEN}$PROTON_DIR/${RESET}"

# Tambahkan source ke bashrc jika belum ada
if grep -q "source $PROTON_DIR/proton.sh" "$HOME/.bashrc"; then
    echo -e "${GREEN}✅ Proton sudah terpasang di sistem.${RESET}"
else
    echo "source $PROTON_DIR/proton.sh" >> "$HOME/.bashrc"
    echo -e "${GREEN}✅ Proton berhasil dipasang.${RESET}"
    echo -e "${YELLOW}🔄 Tutup dan buka kembali terminal, atau jalankan '${CYAN}source ~/.bashrc${YELLOW}' untuk mengaktifkan Proton.${RESET}"
fi
