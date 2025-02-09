


TODO_FILE="$HOME/todo_list.txt"


if [ ! -f "$TODO_FILE" ]; then
    touch "$TODO_FILE"
    echo -e "\033[35m📝 File \033[32m'todo_list.txt' \033[35mtelah dibuat di \033[32m$HOME\033[0m"
fi

function proton() {
    case "$1" in
        
        utbk)
            case "$2" in
                today)
                    show_utbk_today
                    ;;
                plan)
                    show_utbk_schedule
                    utbk_countdown
                    ;;
                left)
                    utbk_countdown
                    ;;
                *)
                    echo -e "\033[31m⚠️  Penggunaan: proton utbk {today|plan|left}\033[0m"
                    ;;
            esac
            ;;
        
        uninstall)
            uninstall_proton
            ;;

        
        remind)
            if [ -z "$2" ] || [ -z "$3" ]; then
                echo -e "\033[31m⚠️  Penggunaan: proton remind <tugas> <menit>\033[0m"
            else
                local task=$2
                local minutes=$3
                echo -e "\033[36m🔔 Kamu akan diingatkan tentang \033[93m\"$task\" \033[36mdalam \033[91m$minutes menit.\033[0m"
                (sleep $((minutes * 60)) && powershell.exe -Command "[console]::beep(1000,500); Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Reminder: $task', 'Pengingat', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information, [System.Windows.Forms.MessageBoxDefaultButton]::Button1, [System.Windows.Forms.MessageBoxOptions]::ServiceNotification)" &)
            fi
            ;;

        
        task)
            case "$2" in
                add)
                    if [ -z "$3" ]; then
                        echo -e "\033[31m⚠️  Penggunaan: proton task add <nama_tugas>\033[0m"
                    else
                        local task_name="$3"
                        local task_id=$(($(wc -l < "$TODO_FILE") + 1))
                        echo "$task_id - $task_name" >> "$TODO_FILE"
                        echo -e "\033[32m✅ Tugas \033[93m'$task_name' \033[32mberhasil ditambahkan dengan ID \033[91m$task_id.\033[0m"
                    fi
                    ;;
                view)
                    if [ ! -s "$TODO_FILE" ]; then
                        echo -e "\033[31m🚫 Tidak ada tugas yang tersedia.\033[0m"
                    else
                        echo -e "\033[36m📋 Daftar Tugas:\033[0m"
                        cat "$TODO_FILE"
                    fi
                    ;;
                delete)
                    if [ -z "$3" ]; then
                        echo -e "\033[31m⚠️  Penggunaan: proton task delete <id>\033[0m"
                    else
                        local task_id="$3"
                        if [ ! -s "$TODO_FILE" ]; then
                            echo -e "\033[31m🚫 Tidak ada tugas yang bisa dihapus.\033[0m"
                        else
                            grep -v "^$task_id -" "$TODO_FILE" > temp.txt && mv temp.txt "$TODO_FILE"
                            echo -e "\033[32m✅ Tugas dengan ID \033[91m$task_id \033[32mberhasil dihapus.\033[0m"
                        fi
                    fi
                    ;;
                *)
                    echo -e "\033[31m⚠️  Penggunaan: proton task {add <nama_tugas> | view | delete <id>}\033[0m"
                    ;;
            esac
            ;;

        
        focus)
            if [ -z "$2" ]; then
                echo -e "\033[31m⚠️  Penggunaan: proton focus <menit>\033[0m"
            else
                local minutes=$2
                echo -e "\033[36m🔕 Mode fokus dimulai untuk \033[91m$minutes menit.\033[0m"
                (sleep $((minutes * 60)) && powershell.exe -Command "[console]::beep(1000,500); Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Sesi Fokus Selesai', 'Waktu Istirahat', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information, [System.Windows.Forms.MessageBoxDefaultButton]::Button1, [System.Windows.Forms.MessageBoxOptions]::ServiceNotification)" &)
            fi
            ;;

        
        break)
            if [ -z "$2" ]; then
                echo -e "\033[31m⚠️  Penggunaan: proton break <menit>\033[0m"
            else
                local minutes=$2
                echo -e "\033[36m💤 Waktu istirahat dimulai untuk \033[91m$minutes menit.\033[0m"
                (sleep $((minutes * 60)) && powershell.exe -Command "[console]::beep(1000,500); Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Sesi Break Selesai', 'Waktu Habis', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information, [System.Windows.Forms.MessageBoxDefaultButton]::Button1, [System.Windows.Forms.MessageBoxOptions]::ServiceNotification)" &)
            fi
            ;;

        
        help)
            echo -e "\033[36m📜 Panduan Perintah proton:\033[0m"
            echo -e "\033[33m✨ proton utbk today  : Tampilkan jadwal UTBK hari ini\033[0m"
            echo -e "\033[33m✨ proton utbk plan   : Lihat jadwal lengkap UTBK dan countdown\033[0m"
            echo -e "\033[33m✨ proton utbk left   : Hitung mundur waktu ke UTBK\033[0m"
            echo -e "\033[33m🔔 proton remind <tugas> <menit> : Buat pengingat tugas\033[0m"
            echo -e "\033[33m📋 proton task {add|view|delete} : Tambah, lihat, atau hapus tugas\033[0m"
            echo -e "\033[33m🔕 proton focus <menit> : Mode fokus selama X menit\033[0m"
            echo -e "\033[33m💤 proton break <menit> : Mode istirahat selama X menit\033[0m"
            echo -e "\033[33m🧺 proton uninstall : Uninstall proton\033[0m"
            ;;

        
        *)
            echo -e "\033[31m⚠️  Perintah tidak dikenal. Coba 'proton help' untuk panduan.\033[0m"
            ;;
        
        version)
            echo -e "\033[36m⚡ Proton versi 1.0 - Initial release\033[0m"
    esac
}


function show_utbk_today() {
    local today=$(date +"%A")
    case "$today" in
        Monday)
            echo -e "\033[94m🎓 Jadwal Hari Ini: \033[32mPenalaran Kuantitatif (PK)\033[0m"
            ;;
        Tuesday)
            echo -e "\033[94m🎓 Jadwal Hari Ini: \033[32mPenalaran Umum (PU)\033[0m"
            ;;
        Wednesday)
            echo -e "\033[94m🎓 Jadwal Hari Ini: \033[32mPengetahuan dan Pemahaman Umum\033[0m"
            ;;
        Thursday)
            echo -e "\033[94m🎓 Jadwal Hari Ini: \033[32mKemampuan memahami bacaan dan menulis\033[0m"
            ;;
        Friday)
            echo -e "\033[94m🎓 Jadwal Hari Ini: \033[32mLiterasi bahasa Indonesia\033[0m"
            ;;
        Saturday)
            echo -e "\033[94m🎓 Jadwal Hari Ini: \033[32mLiterasi bahasa Inggris\033[0m"
            ;;
        Sunday)
            echo -e "\033[94m🎓 Jadwal Hari Ini: \033[32mPenalaran matematika\033[0m"
            ;;
        *)
            echo -e "\033[31m🚫 Tidak ada jadwal untuk hari ini.\033[0m"
            ;;
    esac
}


function show_utbk_schedule() {
    echo -e "\033[94m📅 Jadwal UTBK:\033[0m"
    echo "1. Senin: Penalaran Kuantitatif (PK)"
    echo "2. Selasa: Penalaran Umum (PU)"
    echo "3. Rabu: Pengetahuan dan Pemahaman Umum"
    echo "4. Kamis: Kemampuan memahami bacaan dan menulis"
    echo "5. Jumat: Literasi bahasa Indonesia"
    echo "6. Sabtu: Literasi bahasa Inggris"
    echo "7. Minggu: Penalaran matematika"
}


function utbk_countdown() {
    local exam_date="2025-04-23"
    local today=$(date +"%Y-%m-%d")
    local diff=$(( ($(date -d "$exam_date" +%s) - $(date -d "$today" +%s)) / 86400 ))
    
    if [ "$diff" -lt 0 ]; then
        echo -e "\033[31m🚫 UTBK sudah selesai!\033[0m"
    else
        echo -e "\033[93m⏳ UTBK dimulai dalam \033[91m$diff hari.\033[0m"
    fi
}

function uninstall_proton() {
    echo -e "\033[93m⚠️  Apakah kamu yakin ingin menghapus Proton sepenuhnya? (y/n)\033[0m"
    read -p "> " confirmation
    if [[ "$confirmation" == "y" || "$confirmation" == "Y" ]]; then
        PROTON_DIR="$HOME/proton"

        # Hapus direktori Proton jika ada
        if [ -d "$PROTON_DIR" ]; then
            rm -rf "$PROTON_DIR"
            echo -e "\033[32m✅ Folder Proton berhasil dihapus dari \033[91m$PROTON_DIR\033[0m"
        else
            echo -e "\033[31m🚫 Folder Proton tidak ditemukan di \033[91m$HOME\033[0m"
        fi

        # Hapus baris yang mengandung source <path>/proton.sh dari file .bashrc
        sed -i '/source .*\/proton\/proton.sh/d' "$HOME/.bashrc"

        echo -e "\033[32m✅ Baris source Proton berhasil dihapus dari \033[91m.bashrc\033[0m"
        echo -e "\033[32m✅ Proton berhasil dihapus dari sistemmu.\033[0m"
    else
        echo -e "\033[33m🚫 Proton tidak dihapus.\033[0m"
    fi
}
