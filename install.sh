#!/bin/bash

# Definisi warna
BIRU='\033[0;34m'       
MERAH='\033[0;31m'
HIJAU='\033[0;32m'
KUNING='\033[0;33m'
NC='\033[0m'



# Fungsi untuk menginstal tema
install_theme() {
  while true; do
    clear
    echo -e "                                                       "
    echo -e "${MERAH}[+] =============================================== [+]${NC}"
    echo -e "${MERAH}[+]                   SELECT THEME                 [+]${NC}"
    echo -e "${MERAH}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "x. kembali"
    echo -e "masukan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x32\x2E\x7A\x69\x70")
        break
        ;;
      2)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x31\x2E\x7A\x69\x70")
        break
        ;;
      3)
        THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x33\x2E\x7A\x69\x70")
        break
        ;; 
      x)
        return
        ;;
      *)
        echo -e "${MERAH}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
  
  if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
  if [ "$SELECT_THEME" -eq 1 ]; then
    echo -e "                                                       "
    echo -e "${MERAH}[+] =============================================== [+]${NC}"
    echo -e "${MERAH}[+]                  INSTALLASI THEMA              [+]${NC}"
    echo -e "${MERAH}[+] =============================================== [+]${NC}"
    echo -e "                                                                   "
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo npm i -g yarn
    cd /var/www/pterodactyl
    yarn add react-feather
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm /root/C2.zip
    sudo rm -rf /root/pterodactyl

    echo -e "                                                       "
    echo -e "${HIJAU}[+] =============================================== [+]${NC}"
    echo -e "${HIJAU}[+]                   INSTALL SUCCESS               [+]${NC}"
    echo -e "${HIJAU}[+] =============================================== [+]${NC}"
    echo -e ""
    sleep 2
    clear
    return

  elif [ "$SELECT_THEME" -eq 2 ]; then
    echo -e "                                                       "
    echo -e "${BIRU}[+] =============================================== [+]${NC}"
    echo -e "${BIRU}[+]                  INSTALLASI THEMA              [+]${NC}"
    echo -e "${BIRU}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    npm i -g yarn
    cd /var/www/pterodactyl
    yarn add react-feather
    php artisan billing:install stable
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm /root/C1.zip
    sudo rm -rf /root/pterodactyl

    echo -e "                                                       "
    echo -e "${HIJAU}[+] =============================================== [+]${NC}"
    echo -e "${HIJAU}[+]                   INSTALL SUCCESS               [+]${NC}"
    echo -e "${HIJAU}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    sleep 2
    clear
    return

  elif [ "$SELECT_THEME" -eq 3 ]; then
    echo -e "                                                       "
    echo -e "${BIRU}[+] =============================================== [+]${NC}"
    echo -e "${BIRU}[+]                  INSTALLASI THEMA              [+]${NC}"
    echo -e "${BIRU}[+] =============================================== [+]${NC}"
    echo -e "                                                                   "

    # Menanyakan informasi kepada pengguna untuk tema Enigma
    echo -e "${KUNING}Masukkan link untuk 'LINK_BC_BOT': ${NC}"
    read LINK_WA
    echo -e "${KUNING}Masukkan nama untuk 'NAMA_OWNER_PANEL': ${NC}"
    read LINK_GROUP
    echo -e "${KUNING}Masukkan link untuk 'LINK_GC_INFO': ${NC}"
    read LINK_CHNL

    # Mengganti placeholder dengan nilai dari pengguna
    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    
    sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y nodejs
    sudo npm i -g yarn
    cd /var/www/pterodactyl
    yarn add react-feather
    php artisan migrate
    yarn build:production
    php artisan view:clear
    sudo rm /root/C3.zip
    sudo rm -rf /root/pterodactyl

    echo -e "                                                       "
    echo -e "${HIJAU}[+] =============================================== [+]${NC}"
    echo -e "${HIJAU}[+]                   INSTALL SUCCESS               [+]${NC}"
    echo -e "${HIJAU}[+] =============================================== [+]${NC}"
    echo -e ""
    sleep 5
  else
    echo ""
    echo "Pilihan tidak valid. silahkan pilih 1/2/3."
  fi
}

# Fungsi untuk menghapus tema
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${MERAH}[+] =============================================== [+]${NC}"
  echo -e "${MERAH}[+]                    DELETE THEME                 [+]${NC}"
  echo -e "${MERAH}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl https://raw.githubusercontent.com/CeliaOffcial/Pterodactyl-installer/main/repair.sh)
  echo -e "                                                       "
  echo -e "${MERAH}[+] =============================================== [+]${NC}"
  echo -e "${MERAH}[+]                 DELETE THEME SUKSES             [+]${NC}"
  echo -e "${MERAH}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# Skrip utama
display_welcome
authenticate

while true; do
  clear
  echo -e "                                                       "
  echo -e "${MERAH}[+] =============================================== [+]${NC}"
  echo -e "${MERAH}[+]                   SELECT OPTION                 [+]${NC}"
  echo -e "${MERAH}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "SELECT OPTION :"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "x. Exit"
  echo -e "Masukkan pilihan (1/2/x):"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
    x)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
