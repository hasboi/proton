# Proton.sh

Proton.sh adalah sebuah tool sederhana yang membantu kamu dalam manajemen tugas, pengingat, dan fokus belajar, terutama untuk persiapan UTBK. Jika kamu baru mengenal Git atau belum familiar dengan cara menggunakannya, README bakal memandu kamu untuk menginstal dan menggunakan Proton.sh.

## Persyaratan
- **Bash**: Proton.sh bekerja pada terminal berbasis Bash. Jika kamu menggunakan sistem operasi:
  - **Linux** atau **macOS**: Bash biasanya sudah terpasang secara bawaan.
  - **Windows**: Kamu bisa menginstal Bash melalui **Windows Subsystem for Linux (WSL)**. Langkah-langkah instalasinya ada di [sini](https://docs.microsoft.com/en-us/windows/wsl/install). Atau, kamu bisa menggunakan terminal seperti **Git Bash**, yang dapat diunduh di [sini](https://gitforwindows.org/).
  
- **Git**: Jika kamu belum menginstal Git, kamu bisa unduh di [sini](https://git-scm.com/).
- **Powershell**: Dibutuhkan untuk beberapa fungsi pengingat di sistem berbasis Windows, dan biasanya sudah ada secara default di Windows.

## Cara Instalasi

1. **Clone repository Proton.sh**  
   Pertama, kamu perlu mengunduh atau meng-clone repository ini ke komputer kamu. 
   Lalu buka terminal, lalu jalankan perintah berikut:
   
   Buka terminal dan jalankan perintah berikut:
   ```bash
   git clone https://github.com/hasboi/proton.git
   ```

   **Apa yang terjadi setelah ini?**
      - Komputer akan mulai mengunduh Proton. Tidak ada progress bar yang dramatis seperti di film hacker, tapi ya, tetap saja ini bagian penting.
      - Setelah selesai, semua file Proton akan tersimpan di komputer kamu.
  
  Kalau error muncul? Bisa jadi Git belum terinstall, atau ada yang salah ketik

2. **Aktivasi Proton**
   
  Sekarang, kita harus "menghidupkan" Proton supaya bisa digunakan. Jalankan saja perintah ini:

   ```bash
   cd proton
   bash install.sh
   ```

   Habis itu udah deh! Kalian bisa ngecek kalau protonnya udah terinstall dengan mengetik `proton version`

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