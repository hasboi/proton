# Proton.sh

Proton.sh adalah sebuah tool sederhana yang membantu kamu dalam manajemen tugas, pengingat, dan fokus belajar, terutama untuk persiapan UTBK. Jika kamu baru mengenal Git atau belum familiar dengan cara menggunakannya, jangan khawatir! README ini akan memandu kamu untuk menginstal dan menggunakan Proton.sh.

## Persyaratan
- **Bash**: Proton.sh bekerja pada terminal berbasis Bash.
- **Git**: Jika kamu belum menginstal Git, kamu bisa unduh di [sini](https://git-scm.com/).
- **Powershell**: Dibutuhkan untuk beberapa fungsi pengingat di sistem berbasis Windows.

## Cara Instalasi

1. **Clone repository Proton.sh**  
   Pertama, kamu perlu mengunduh (clone) repository ini ke komputer kamu. Jika kamu belum pernah menggunakan git sebelumnya, ikuti langkah-langkah berikut:
   
   Buka terminal dan jalankan perintah berikut:
   ```bash
   git clone https://github.com/hasboi/proton.git
   ```

   Ini akan mengunduh semua file Proton.sh ke komputer kamu.

2. **Jalankan Script Instalasi**
   
   Setelah repository berhasil diunduh, masuk ke direktori `proton` dan jalankan script instalasi:
   ```bash
   cd proton
   bash install.sh
   ```

3. **Aktifkan Proton**
   
   Setelah instalasi selesai, kamu bisa menutup dan membuka kembali terminal kamu, atau jalankan:
   ```bash
   source ~/.bashrc
   ```
   Ini akan memuat Proton.sh ke terminal kamu, sehingga kamu bisa langsung menggunakannya.

## Perintah-perintah Proton

Berikut adalah beberapa perintah yang bisa kamu jalankan menggunakan Proton:

1. **Manajemen UTBK**
   - **proton utbk today**: Menampilkan jadwal UTBK untuk hari ini.
   - **proton utbk plan**: Menampilkan jadwal UTBK lengkap dan countdown hari ke UTBK.
   - **proton utbk left**: Menampilkan sisa hari sebelum UTBK dimulai.

2. **Pengingat Tugas**
   - **proton remind <tugas> <menit>**: Buat pengingat tentang tugas tertentu. Misalnya, jika kamu ingin diingatkan tentang "belajar matematika" dalam 30 menit, gunakan:
     ```bash
     proton remind "belajar matematika" 30
     ```

3. **Manajemen Tugas**
   - **proton task add <nama_tugas>**: Tambahkan tugas baru ke daftar tugas. Misalnya:
     ```bash
     proton task add "Belajar Fisika"
     ```
   - **proton task view**: Lihat daftar tugas yang sudah ditambahkan.
   - **proton task delete <id>**: Hapus tugas berdasarkan ID. Untuk mendapatkan ID, kamu bisa melihatnya menggunakan `proton task view`.

4. **Mode Fokus**
   - **proton focus <menit>**: Mulai mode fokus selama X menit. Misalnya, jika kamu ingin fokus selama 60 menit:
     ```bash
     proton focus 60
     ```

5. **Mode Istirahat**
   - **proton break <menit>**: Mulai waktu istirahat selama X menit. Misalnya, untuk beristirahat selama 10 menit:
     ```bash
     proton break 10
     ```

6. **Bantuan**
   - **proton help**: Menampilkan panduan perintah Proton jika kamu butuh bantuan atau lupa perintah apa saja yang tersedia.

## `proton help`

Jika kamu bingung atau lupa dengan perintah yang tersedia, cukup ketik:
```bash
proton help
```
Perintah ini akan menampilkan semua opsi perintah yang bisa kamu gunakan beserta panduannya.

## Catatan

- **Menggunakan Powershell untuk Pengingat dan Beep**  
   Beberapa fungsi Proton, seperti pengingat (`remind`), membutuhkan Powershell untuk menampilkan notifikasi. Biasanya ada sih di Windows, tapi cek lagi aja.
   
- **Kustomisasi**  
   Jika kamu ingin menyesuaikan jadwal UTBK atau perintah lainnya, kamu bisa mengedit file `proton.sh` sesuai kebutuhan.

Selamat mencoba! Jika ada kendala, jangan ragu untuk menghubungi.