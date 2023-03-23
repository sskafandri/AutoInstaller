#!/usr/bin/env bash
#

# Coded by M.A.H
# ID Telegram : @DevAtom

# update system packages
if [[ $(command -v yum) ]]; then
  yum update -y ; yum install perl -y ; yum install wget -y ; yum install curl -y ; yum install screen -y ; clear
fi
if [[ $(command -v apt) ]]; then
  apt update -y ; apt upgrade -y ; apt autoremove -y ; apt install perl -y ; apt install wget -y ; apt install curl -y ; apt install screen -y ; clear
fi

# function to validate user input for y/n choices
function validate_yn_input {
  read -rp "$1 " INPUT
  while [[ "$INPUT" != "y" && "$INPUT" != "n" ]]; do
    echo "Invalid input. Please enter 'y' or 'n'"
    read -rp "$1 (y/n) : " INPUT
  done
  if [ "$INPUT" = "n" ]; then
    clear
    return 1
  fi
}

# function to validate user input for menu choices
function validate_menu_input {
  read -rp "$1" INPUT
  while ! [[ "$INPUT" =~ ^[0-9]+$ ]] || (( INPUT < $2 || INPUT > $3 )); do
    echo "Invalid input. Please enter a number between $2 and $3"
    read -rp "$1" INPUT
  done
}

#function for text colors
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
# Function for printing text in blue
print_b () {
  echo -e "${BLUE}$1${NC}"
}
print_r () {
  echo -e "${RED}$1${NC}"
}
print_y () {
  echo -e "${YELLOW}$1${NC}"
}
print_g () {
  echo -e "${GREEN}$1${NC}"
}

# Run hostnamectl and save the output to a variable
output=$(hostnamectl)
# Extract the desired information from the output using grep and sed
hostname=$(echo "$output" | grep "Static hostname:" | sed 's/Static hostname:\s*//')
virtualization=$(echo "$output" | grep "Virtualization:" | sed 's/Virtualization:\s*//')
os=$(echo "$output" | grep "Operating System:" | sed 's/Operating System:\s*//')
kernel=$(echo "$output" | grep "Kernel:" | sed 's/Kernel:\s*//')
architecture=$(echo "$output" | grep "Architecture:" | sed 's/Architecture:\s*//')
vendor=$(echo "$output" | grep "Hardware Vendor:" | sed 's/Hardware Vendor:\s*//')
model=$(echo "$output" | grep "Hardware Model:" | sed 's/Hardware Model:\s*//')
CPU_NAME=$(grep "model name" /proc/cpuinfo | head -n 1 | cut -d':' -f2 | sed 's/^[ \t]*//')
CPU_CORES=$(grep -c processor /proc/cpuinfo)
MEM_TOTAL=$(free -h | awk '/^Mem/ {print $2}')
HDD_TOTAL=$(df -h --total | tail -n 1 | awk '{print $2}')
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Print the extracted information
information () {
echo -e "\033[33m  Static Hostname\033[0m :\033[34m${hostname}\033[0m"
echo -e "\033[33m  Virtualization\033[0m :\033[34m${virtualization}\033[0m"
echo -e "\033[33m  Operating System\033[0m : \033[34m${os}\033[0m"
echo -e "\033[33m  Kernel\033[0m :\033[34m${kernel}\033[0m"
echo -e "\033[33m  Architecture\033[0m :\033[34m${architecture}\033[0m"
echo -e "\033[33m  Hardware Vendor\033[0m :\033[34m${vendor}\033[0m"
echo -e "\033[33m  Hardware Model\033[0m :\033[34m${model}\033[0m"
echo -e "\033[33m  CPU\033[0m : \033[34m${CPU_NAME} (${CPU_CORES} Cores)\033[0m"
echo -e "\033[33m  Memory\033[0m : \033[34m${MEM_TOTAL}\033[0m"
echo -e "\033[33m  Hard Disk\033[0m : \033[34m${HDD_TOTAL}\033[0m"
echo -e "\033[33m  IP Address\033[0m : \033[34m${IP_ADDRESS}\033[0m"
}
# Banner
message='

    /$$$$$$              /$$                     /$$$$$$                       /$$               /$$ /$$                    
   /$$__  $$            | $$                    |_  $$_/                      | $$              | $$| $$                    
  | $$  \ $$ /$$   /$$ /$$$$$$    /$$$$$$         | $$   /$$$$$$$   /$$$$$$$ /$$$$$$    /$$$$$$ | $$| $$  /$$$$$$   /$$$$$$ 
  | $$$$$$$$| $$  | $$|_  $$_/   /$$__  $$        | $$  | $$__  $$ /$$_____/|_  $$_/   |____  $$| $$| $$ /$$__  $$ /$$__  $$
  | $$__  $$| $$  | $$  | $$    | $$  \ $$        | $$  | $$  \ $$|  $$$$$$   | $$      /$$$$$$$| $$| $$| $$$$$$$$| $$  \__/
  | $$  | $$| $$  | $$  | $$ /$$| $$  | $$        | $$  | $$  | $$ \____  $$  | $$ /$$ /$$__  $$| $$| $$| $$_____/| $$      
  | $$  | $$|  $$$$$$/  |  $$$$/|  $$$$$$/       /$$$$$$| $$  | $$ /$$$$$$$/  |  $$$$/|  $$$$$$$| $$| $$|  $$$$$$$| $$      
  |__/  |__/ \______/    \___/   \______/       |______/|__/  |__/|_______/    \___/   \_______/|__/|__/ \_______/|__/      
                                                                                                                        #Atom
                                                                                                                        @DevAtom
'
cPanel='
       ____                  _ 
   ___|  _ \ __ _ _ __   ___| |
  / __| |_) / _` | `_ \ / _ \ |
 | (__|  __/ (_| | | | |  __/ |
  \___|_|   \__,_|_| |_|\___|_|

'
Plesk='
  ____  _           _    
 |  _ \| | ___  ___| | __
 | |_) | |/ _ \/ __| |/ /
 |  __/| |  __/\__ \   < 
 |_|   |_|\___||___/_|\_\

'
aaPanel='
              ____                  _ 
   __ _  __ _|  _ \ __ _ _ __   ___| |
  / _` |/ _` | |_) / _` | `_ \ / _ \ |
 | (_| | (_| |  __/ (_| | | | |  __/ |
  \__,_|\__,_|_|   \__,_|_| |_|\___|_|

'
InstallcPanel='
  ___           _        _ _        ____                  _ 
 |_ _|_ __  ___| |_ __ _| | |   ___|  _ \ __ _  ___ _ __ | |
  | || `_ \/ __| __/ _` | | |  / __| |_) / _` |/ _ \ `_ \| |
  | || | | \__ \ || (_| | | | | (__|  __/ (_| |  __/ | | | |
 |___|_| |_|___/\__\__,_|_|_|  \___|_|   \__,_|\___|_| |_|_|

'
InstallPlesk='
  ___           _        _ _   ____  _           _    
 |_ _|_ __  ___| |_ __ _| | | |  _ \| | ___  ___| | __
  | || `_ \/ __| __/ _` | | | | |_) | |/ _ \/ __| |/ /
  | || | | \__ \ || (_| | | | |  __/| |  __/\__ \   < 
 |___|_| |_|___/\__\__,_|_|_| |_|   |_|\___||___/_|\_\

'
InstallaaPanel='
  ___           _        _ _               ____                  _ 
 |_ _|_ __  ___| |_ __ _| | |   __ _  __ _|  _ \ __ _ _ __   ___| |
  | || `_ \/ __| __/ _` | | |  / _` |/ _` | |_) / _` | `_ \ / _ \ |
  | || | | \__ \ || (_| | | | | (_| | (_| |  __/ (_| | | | |  __/ |
 |___|_| |_|___/\__\__,_|_|_|  \__,_|\__,_|_|   \__,_|_| |_|\___|_|

'
Tools='
  ____                             _____           _     
 / ___|  ___ _ ____   _____ _ __  |_   _|__   ___ | |___ 
 \___ \ / _ \ `__\ \ / / _ \ `__|   | |/ _ \ / _ \| / __|
  ___) |  __/ |   \ V /  __/ |      | | (_) | (_) | \__ \
 |____/ \___|_|    \_/ \___|_|      |_|\___/ \___/|_|___/

'
CSF='
  ____       _                  ____ ____  _____ 
 / ___|  ___| |_ _   _ _ __    / ___/ ___||  ___|
 \___ \ / _ \ __| | | | `_ \  | |   \___ \| |_   
  ___) |  __/ |_| |_| | |_) | | |___ ___) |  _|  
 |____/ \___|\__|\__,_| .__/   \____|____/|_|    
                      |_|   
                     
'
Plugins='
  ___           _        _ _   ____  _             _           
 |_ _|_ __  ___| |_ __ _| | | |  _ \| |_   _  __ _(_)_ __  ___ 
  | || `_ \/ __| __/ _` | | | | |_) | | | | |/ _` | | `_ \/ __|
  | || | | \__ \ || (_| | | | |  __/| | |_| | (_| | | | | \__ \
 |___|_| |_|___/\__\__,_|_|_| |_|   |_|\__,_|\__, |_|_| |_|___/
                                             |___/             

'
CloudLinux='
  ____       _                  ____ _                 _ _     _                  
 / ___|  ___| |_ _   _ _ __    / ___| | ___  _   _  __| | |   (_)_ __  _   ___  __
 \___ \ / _ \ __| | | | `_ \  | |   | |/ _ \| | | |/ _` | |   | | `_ \| | | \ \/ /
  ___) |  __/ |_| |_| | |_) | | |___| | (_) | |_| | (_| | |___| | | | | |_| |>  < 
 |____/ \___|\__|\__,_| .__/   \____|_|\___/ \__,_|\__,_|_____|_|_| |_|\__,_/_/\_\
                      |_|                                                         

'
Advanced='
     _       _                               _   _____           _     
    / \   __| |_   ____ _ _ __   ___ ___  __| | |_   _|__   ___ | |___ 
   / _ \ / _` \ \ / / _` | `_ \ / __/ _ \/ _` |   | |/ _ \ / _ \| / __|
  / ___ \ (_| |\ V / (_| | | | | (_|  __/ (_| |   | | (_) | (_) | \__ \
 /_/   \_\__,_| \_/ \__,_|_| |_|\___\___|\__,_|   |_|\___/ \___/|_|___/

'
FTP='
  ____       _                 _____ _____ ____    ____                           
 / ___|  ___| |_ _   _ _ __   |  ___|_   _|  _ \  / ___|  ___ _ ____   _____ _ __ 
 \___ \ / _ \ __| | | | `_ \  | |_    | | | |_) | \___ \ / _ \ `__\ \ / / _ \ `__|
  ___) |  __/ |_| |_| | |_) | |  _|   | | |  __/   ___) |  __/ |   \ V /  __/ |   
 |____/ \___|\__|\__,_| .__/  |_|     |_| |_|     |____/ \___|_|    \_/ \___|_|   
                      |_|                                                         

'
Management='
  ____       _                 __  __                                                   _   
 / ___|  ___| |_ _   _ _ __   |  \/  | __ _ _ __   __ _  __ _  ___ _ __ ___   ___ _ __ | |_ 
 \___ \ / _ \ __| | | | `_ \  | |\/| |/ _` | `_ \ / _` |/ _` |/ _ \ `_ ` _ \ / _ \ `_ \| __|
  ___) |  __/ |_| |_| | |_) | | |  | | (_| | | | | (_| | (_| |  __/ | | | | |  __/ | | | |_ 
 |____/ \___|\__|\__,_| .__/  |_|  |_|\__,_|_| |_|\__,_|\__, |\___|_| |_| |_|\___|_| |_|\__|
                      |_|                               |___/                               

'
WebServer='
 __        __   _    ____                           
 \ \      / /__| |__/ ___|  ___ _ ____   _____ _ __ 
  \ \ /\ / / _ \ `_ \___ \ / _ \ `__\ \ / / _ \ `__|
   \ V  V /  __/ |_) |__) |  __/ |   \ V /  __/ |   
    \_/\_/ \___|_.__/____/ \___|_|    \_/ \___|_|   

'
Mysql='
  ____       _                 __  __                 _ 
 / ___|  ___| |_ _   _ _ __   |  \/  |_   _ ___  __ _| |
 \___ \ / _ \ __| | | | `_ \  | |\/| | | | / __|/ _` | |
  ___) |  __/ |_| |_| | |_) | | |  | | |_| \__ \ (_| | |
 |____/ \___|\__|\__,_| .__/  |_|  |_|\__, |___/\__, |_|
                      |_|             |___/        |_|  

'
Redis='
  ____       _                 ____          _ _     
 / ___|  ___| |_ _   _ _ __   |  _ \ ___  __| (_)___ 
 \___ \ / _ \ __| | | | `_ \  | |_) / _ \/ _` | / __|
  ___) |  __/ |_| |_| | |_) | |  _ <  __/ (_| | \__ \
 |____/ \___|\__|\__,_| .__/  |_| \_\___|\__,_|_|___/
                      |_|                            

'
Memcached='
  ____       _                 __  __                               _              _ 
 / ___|  ___| |_ _   _ _ __   |  \/  | ___ _ __ ___   ___ __ _  ___| |__   ___  __| |
 \___ \ / _ \ __| | | | `_ \  | |\/| |/ _ \ `_ ` _ \ / __/ _` |/ __| `_ \ / _ \/ _` |
  ___) |  __/ |_| |_| | |_) | | |  | |  __/ | | | | | (_| (_| | (__| | | |  __/ (_| |
 |____/ \___|\__|\__,_| .__/  |_|  |_|\___|_| |_| |_|\___\__,_|\___|_| |_|\___|\__,_|
                      |_|                                                            

'


# main menu
while true; do
  clear
  echo -e "\033[0;32m${message}\033[0m"
  echo -e "\033[34minformation Server\033[0m"
  information
  echo
  print_y "Which control panel do you want to install?"
  print_g "1) cPanel"
  print_g "2) Plesk"
  print_g "3) aaPanel"
  print_g "4) Exit"
  validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
  CP_CHOICE=$INPUT

  if [ $CP_CHOICE -eq 4 ]; then
    clear
    exit
  fi
  # sub-menu for cPanel
  if [ $CP_CHOICE -eq 1 ]; then
    clear
    while true; do
      echo -e "\033[0;32m${cPanel}\033[0m"
      print_y "What do you want to do?"
      print_g "1) Install cPanel"
      print_g "2) Server Tools [4]"
      print_g "3) Setup CSF [4]"
      print_g "4) install Plugins [8]"
      print_g "5) Setup CloudLinux [7]"
      print_g "6) Setup FTP Server [3]"
      print_g "7) Advanced Tools [4]"
      print_g "8) Back to Menu"
      validate_menu_input "$(print_y 'Enter your choice (1-8) : ')" 1 8
      CP_ACTION=$INPUT

      if [ $CP_ACTION -eq 8 ]; then
        clear
        break
      fi

        # Install cPanel
      if [ $CP_ACTION -eq 1 ]; then
        clear
        echo -e "\033[0;32m${InstallcPanel}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Install cPanel?(y/n) :')"
        if [ $INPUT = "y" ]; then
          cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
        fi
      fi

        # Server Tools
      if [ $CP_ACTION -eq 2 ]; then
        clear
        echo -e "\033[0;32m${Tools}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Server Tools?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Change Nameserver"
            print_g "2) Change Hostname"
            print_g "3) Change SSH Port"
            print_g "4) Change Password (root)"
            print_g "5) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-5) : ')" 1 5
            ST_ACTION=$INPUT

              # Change Nameserver
            if [ $ST_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to change the Nameserver?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -p "Enter Primary Nameserver: " PRIMARY_NS
                read -p "Enter Secondary Nameserver: " SECONDARY_NS
                if [ -f /etc/resolv.conf ]; then
                  sed -i 's/^nameserver/#nameserver/g' /etc/resolv.conf
                  echo "nameserver $PRIMARY_NS" >> /etc/resolv.conf
                  echo "nameserver $SECONDARY_NS" >> /etc/resolv.conf
                  print_b "Nameserver Changed To -> [ "$PRIMARY_NS" - "$SECONDARY_NS" ]"
                fi
              fi
            fi

              # Change hostname
            if [ $ST_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to change the Hostname?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -rp "Enter your Hostname : " HOSTNAME
                hostnamectl set-hostname $HOSTNAME
                print_b "Hostname Changed To -> "$HOSTNAME""
              fi
            fi

              # Change SSH Port
            if [ $ST_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change SSH Port?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -rp "Enter new SSH port : " NEW_PORT
                sudo sed -i "s/^#*Port 22/Port $NEW_PORT/" /etc/ssh/sshd_config
                service sshd restart
                print_b "SSH Port Changed To -> "$NEW_PORT""
              fi
            fi

              # Change Password (root)
            if [ $ST_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change Password Server?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ $(whoami) = "root" ]; then
                  passwd root
                else
                  sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart ssh && sudo passwd
                fi
                print_b "Password Changed (root) Successfully"
              fi
            fi
            if [ $ST_ACTION -eq 5 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup CSF
      if [ $CP_ACTION -eq 3 ]; then
        clear
        echo -e "\033[0;32m${CSF}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup CSF?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Install CSF"
            print_g "2) CSF Configuration"
            print_g "3) CSF Blocklists Configuration"
            print_g "4) Unblock Telegram IPs"
            print_g "5) Uninstall CSF"
            print_g "6) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-6) : ')" 1 6
            CSF_ACTION=$INPUT

              # Install CSF
            if [ $CSF_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install CSF?(y/n) :')"
              if [ $INPUT = "y" ]; then
                cd /usr/src ; rm -fv csf.tgz ; wget https://download.configserver.com/csf.tgz ; tar -xzf csf.tgz ; cd csf ; sh install.sh ; perl /usr/local/csf/bin/csftest.pl ; cd
                print_g "ConfigServer Security & Firewall (CSF) Successfully Installed"
              fi
            fi

              #CSF Configuration
            if [ $CSF_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Configuration CSF?(y/n) :')"
              if [ $INPUT = "y" ]; then
                # Set the parameters
                TESTING="0"
                CT_LIMIT="100"
                CT_INTERVAL="30"
                CT_EMAIL_ALERT="1"
                CT_PORTS="80,443,2083,2082,2087,20,21,25,110,113,123,465,993,995,22"
                CT_BLOCK_TIME="3600"
                CT_PERMANENT="1"
                CONNLIMIT="22;5,443;20,80;20,20;20,21;20,25;20,110;20,113;20,123;20,465;20,993;20,995;20,2083;20,2082;20"
                RESTRICT_SYSLOG="3"
                DENY_IP_LIMIT="200"
                PACKET_FILTER="1"
                PORTFLOOD="1"
                # Update the csf.conf file
                sed -i "s/^TESTING=.*/TESTING=$TESTING/g" /etc/csf/csf.conf
                sed -i "s/^CT_LIMIT=.*/CT_LIMIT=$CT_LIMIT/g" /etc/csf/csf.conf
                sed -i "s/^CT_INTERVAL=.*/CT_INTERVAL=$CT_INTERVAL/g" /etc/csf/csf.conf
                sed -i "s/^CT_EMAIL_ALERT=.*/CT_EMAIL_ALERT=$CT_EMAIL_ALERT/g" /etc/csf/csf.conf
                sed -i "s/^CT_PORTS=.*/CT_PORTS=$CT_PORTS/g" /etc/csf/csf.conf
                sed -i "s/^CT_BLOCK_TIME=.*/CT_BLOCK_TIME=$CT_BLOCK_TIME/g" /etc/csf/csf.conf
                sed -i "s/^CT_PERMANENT=.*/CT_PERMANENT=$CT_PERMANENT/g" /etc/csf/csf.conf
                sed -i "s/^CONNLIMIT=.*/CONNLIMIT=$CONNLIMIT/g" /etc/csf/csf.conf
                sed -i "s/^RESTRICT_SYSLOG=.*/RESTRICT_SYSLOG=$RESTRICT_SYSLOG/g" /etc/csf/csf.conf
                sed -i "s/^DENY_IP_LIMIT=.*/DENY_IP_LIMIT=$DENY_IP_LIMIT/g" /etc/csf/csf.conf
                sed -i "s/^PACKET_FILTER=.*/PACKET_FILTER=$PACKET_FILTER/g" /etc/csf/csf.conf
                sed -i "s/^PORTFLOOD=.*/PORTFLOOD=$PORTFLOOD/g" /etc/csf/csf.conf
                print_b "CSF configuration is successfully."
              fi
            fi

              # CSF Blocklists Configuration
            if [ $CSF_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to CSF Blocklists Configuration?(y/n) :')"
                if [ $INPUT = "y" ]; then
                  while read line; do
                    # Check if the line starts with #
                    if [[ $line == \#* ]]; then
                      # Skip comment lines
                      continue
                    fi
                    # Split the line by | character
                    IFS='|' read -ra arr <<< "$line"
                  done < /etc/csf/csf.blocklists | sed 's/# Split the line by | character//'
                  print_b "CSF Blocklists Configuration is Successfully."
                fi
            fi

              # Unblock Telegram IPs
            if [ $CSF_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Unblock Telegram IPs?(y/n) :')"
                if [ $INPUT = "y" ]; then
                  csf -a 149.154.168.0/22 ; csf -a 149.154.164.0/22 ; csf -a 149.154.172.0/22 ; csf -a 149.154.160.0/22 ; csf -a 91.108.4.0/22 ; csf -a 91.108.56.0/22 ; csf -a 91.108.16.0/22 ; csf -a 91.108.12.0/22 ; csf -a 91.108.8.0/22
                  print_b "Unblock Telegram IPs is Successfully."
                fi
            fi

              # uninstall CSF
            if [ $CSF_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Uninstall CSF?(y/n) :')"
                if [ $INPUT = "y" ]; then
                  cd /etc/csf ; sh uninstall.sh
                  print_b "Uninstall CSF is Successfully."
                fi
            fi
            if [ $CSF_ACTION -eq 6 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Install Plugins
      if [ $CP_ACTION -eq 4 ]; then
        clear
        echo -e "\033[0;32m${Plugins}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Install Plugins?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Install LiteSpeed"
            print_g "2) Install ImunifyAV"
            print_g "3) Install SSL"
            print_g "4) Install WHMReseller"
            print_g "5) Install WP Toolkit"
            print_g "6) Install PostgreSQL"
            print_g "7) Install Softaculous"
            print_g "8) Install SitePad"
            print_g "9) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-9) : ')" 1 9
            PG_ACTION=$INPUT

              # Install LiteSpeed
            if [ $PG_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install LiteSpeed?(y/n) :')"
              if [ $INPUT = "y" ]; then
                cd /usr/src ; wget http://www.litespeedtech.com/packages/cpanel/lsws_whm_plugin_install.sh ; chmod 700 lsws_whm_plugin_install.sh ; ./lsws_whm_plugin_install.sh ; rm -f lsws_whm_plugin_install.sh ; cd
                print_b "LiteSpeed Successfully Installed"
              fi
            fi

              # Install ImunifyAV
            if [ $PG_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install ImunifyAV?(y/n) :')"
              if [ $INPUT = "y" ]; then
                wget https://repo.imunify360.cloudlinux.com/defence360/imav-deploy.sh ; bash imav-deploy.sh ; rm -rf /root/imav-deploy.sh
                print_b "ImunifyAV Successfully Installed"
              fi
            fi

              # Install SSL
            if [ $PG_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install SSL?(y/n) :')"
              if [ $INPUT = "y" ]; then
                /usr/local/cpanel/bin/checkallsslcerts ; /scripts/install_lets_encrypt_autossl_provider
                print_b "Let's Encrypt Autossl (SSL) Successfully Installed"
              fi
            fi

              # Install WHMReseller
            if [ $PG_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install WHMReseller?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"centos"* ]]; then
                  yum install gcc-c++ -y ; cd /usr/local/cpanel/whostmgr/docroot/cgi ; wget http://deasoft.com/install.cpp ; g++ install.cpp -o install ; chmod 700 install ; ./install ; cd
                  print_b "WHMReseller Successfully Installed"
                else
                  print_r "WHMReseller installation is only supported on CentOS."
                fi
              fi
            fi

              # Install WP Toolkit
            if [ $PG_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install WP Toolkit?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ $WP_ACTION -eq 1 ]; then
                  sh <(curl https://wp-toolkit.plesk.com/cPanel/installer.sh || wget -O - https://wp-toolkit.plesk.com/cPanel/installer.sh)
                  print_b "WP Toolkit Successfully Installed"
                fi
              fi
            fi

              # Install PostgreSQL
            if [ $PG_ACTION -eq 6 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install PostgreSQL?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"centos"* ]]; then
                    yum install postgresql-server -y ; systemctl enable postgresql.service ; systemctl start postgresql.service ; /usr/local/cpanel/scripts/installpostgres
                    print_b "PostgreSQL Successfully Installed"
                else
                    print_r "PostgreSQL installation is only supported on CentOS."
                fi
              fi
            fi

              # Install Softaculous
            if [ $PG_ACTION -eq 7 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure that ioncube is installed and active on your server?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if php -m | grep -q ionCube ; then
                  wget -N http://files.softaculous.com/install.sh && chmod 755 install.sh && ./install.sh
                  print_b "Softaculous Successfully Installed"
                else
                  print_r "Error: ionCube is not installed on your server.
                  Please go to this address to install and activate ionCube -> Home / Server Configuration / Tweak Settings -> PHP -> cPanel PHP loader"
                fi
              fi
            fi

              # Install SitePad
            if [ $PG_ACTION -eq 8 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure that ioncube is installed and active on your server?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if php -m | grep -q ionCube ; then
                  cd /usr/local/src/ ; rm -fv install.sh ; wget -N https://files.sitepad.com/install.sh ; chmod +x install.sh ; ./install.sh ; cd
                  print_b "SitePad Successfully Installed"
                else
                  print_r "Error: ionCube is not installed on your server.
                  Please go to this address to install and activate ionCube -> Home / Server Configuration / Tweak Settings -> PHP -> cPanel PHP loader"
                fi
              fi
            fi
            if [ $PG_ACTION -eq 9 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup CloudLinux
      if [ $CP_ACTION -eq 5 ]; then
        clear
        echo -e "\033[0;32m${CloudLinux}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup CloudLinux?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Install CloudLinux"
            print_g "2) Install CageFS"
            print_g "3) Install alt-php"
            print_g "4) Install ea-php"
            print_g "5) install mod-lsapi"
            print_g "6) Install Python"
            print_g "7) Install Ruby"
            print_g "8) Install NodeJS"
            print_g "9) Install MySQL Governor (not recommended)"
            print_g "10) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-10) : ')" 1 10
            CL_ACTION=$INPUT

              # Install CloudLinux
            if [ $CL_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install CloudLinux?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"centos"* ]]; then
                  wget https://repo.cloudlinux.com/cloudlinux/sources/cln/cldeploy -O cldeploy.sh
                    print_g "Get a 30-day CloudLinux License : https://www.cloudlinux.com/trial"
                    validate_yn_input "$(print_y 'Do you use the free 30-day License?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      read -rp "Enter your License : " License
                      sh cldeploy.sh -k "$License"
                      print_b "CloudLinux Successfully Installed, Please Reboot Your System"
                    else
                      print_g "Use your installation and activation command"
                    fi
                else
                  print_r "CloudLinux installation is only supported on CentOS."
                fi
              fi
            fi

              # Install CageFS
            if [ $CL_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install CageFS?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum install cagefs -y ; /usr/sbin/cagefsctl --init ; /usr/sbin/cagefsctl --enable-all
                  print_b "CageFS Successfully Installed"
                else
                  print_r "CageFS installation is only supported on CentOS with CloudLinux."
                fi
              fi
            fi

              # Install alt-php
            if [ $CL_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install alt-php?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum groupinstall alt-php -y ; yum update cagefs lvemanager -y ; yum groupupdate alt-php -y
                  print_b "alt-php Successfully Installed"
                else
                  print_r "alt-php installation is only supported on CentOS."
                fi
              fi
            fi

              # Install ea-php
            if [ $CL_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install ea-php?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum install ea-php82 -y ; yum install ea-php81 -y ; yum install ea-php80 -y ; yum install ea-php74 -y ; yum install ea-php73 -y ; yum install ea-php72 -y ; yum install ea-php71 -y ; yum install ea-php70 -y ; yum install ea-php51 -y ; yum install ea-php52 -y ; yum install ea-php53 -y ; yum install ea-php54 -y ; yum install ea-php55 -y ; yum install ea-php56 -y ; yum update cagefs lvemanager
                  print_b "ea-php Successfully Installed"
                else
                  print_r "ea-php installation is only supported on CentOS."
                fi
              fi
            fi

              # Install mod-lsapi
            if [ $CL_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install mod-lsapi?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum install liblsapi liblsapi-devel ; yum install ea-apache24-mod_lsapi ; /usr/bin/switch_mod_lsapi --setup ; service httpd restart
                  print_b "mod-lsapi Successfully Installed"
                else
                  print_r "mod-lsapi installation is only supported on CentOS."
                fi
              fi
            fi

              # Install Python
            if [ $CL_ACTION -eq 6 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install Python?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum -y groupinstall "Development Tools"
                  yum -y install openssl-devel bzip2-devel libffi-devel
                  yum groupinstall alt-python -y
                  yum install lvemanager lve-utils alt-python-virtualenv
                  yum install lve-utils lvemanager alt-python-virtualenv alt-mod-passenger -y
                  yum install lvemanager alt-python-virtualenv
                  yum install alt-python27-devel -y
                  print_b "Python Successfully Installed"
                else
                  print_r "Python installation is only supported on CentOS."
                fi
              fi
            fi

              # Install Ruby
            if [ $CL_ACTION -eq 7 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install Ruby?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum grouplist | grep alt-ruby
                  yum groupinstall alt-ruby -y
                  yum install lvemanager alt-python-virtualenv
                  yum install ea-ruby24-mod_passenger -y
                  print_b "Ruby Successfully Installed"
                else
                    print_r "Ruby installation is only supported on CentOS."
                fi
              fi
            fi

              # Install NodeJS
            if [ $CL_ACTION -eq 8 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install NodeJS?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum groupinstall alt-nodejs -y
                  yum install lvemanager lve-utils -y
                  yum install lvemanager lve-utils alt-mod-passenger -y
                  print_b "NodeJS Successfully Installed"
                else
                  print_r "NodeJS installation is only supported on CentOS."
                fi
              fi
            fi

              # Install MySQL Governor
            if [ $CL_ACTION -eq 9 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install MySQL Governor?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"cloudlinux"* ]]; then
                  yum remove db-governor db-governor-mysql
                  yum install governor-mysql -y
                  read -rp "Enter Mysql Version : " MysqlV
                  /usr/share/lve/dbgovernor/mysqlgovernor.py --mysql-version="$MysqlV"
                  /usr/share/lve/dbgovernor/mysqlgovernor.py --install --yes
                  /usr/share/lve/dbgovernor/mysqlgovernor.py --dbupdate
                  service db_governor restart
                  service db_governor start
                  print_b "MySQL Governor Successfully Installed"
                else
                  print_r "MySQL Governor installation is only supported on CentOS."
                fi
              fi
            fi
            if [ $CL_ACTION -eq 10 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup FTP Server
      if [ $CP_ACTION -eq 6 ]; then
        clear
        echo -e "\033[0;32m${FTP}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup FTP Server?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Pure-FTPd FTP Server (recommended)"
            print_g "2) ProFTP FTP Server"
            print_g "3) Disable FTP Services"
            print_g "4) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
            FTP_ACTION=$INPUT
            if [ $FTP_ACTION -eq 1 ]; then
              /usr/local/cpanel/scripts/setupftpserver pure-ftpd
              print_b "Pure-FTPd Successfully Configured"
              sleep 5s
              clear
              break
            elif [ $FTP_ACTION -eq 2 ]; then
              /usr/local/cpanel/scripts/setupftpserver proftpd
              print_b "ProFTP Successfully Configured"
              sleep 5s
              clear
              break
            elif [ $FTP_ACTION -eq 3 ]; then
              /usr/local/cpanel/scripts/setupftpserver disabled
              print_b "FTP Services Successfully Disabled"
              sleep 5s
              clear
              break
            elif [ $FTP_ACTION -eq 4 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Advanced Tools
      if [ $CP_ACTION -eq 7 ]; then
        clear
        echo -e "\033[0;32m${Advanced}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Advanced Tools?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Restore Backup"
            print_g "2) Clear RAM Cache"
            print_g "3) Delete all error_log"
            print_g "4) Clear /tmp"
            print_g "5) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-5) : ')" 1 5
            AT_ACTION=$INPUT

              #Restore Backup
            if [ $AT_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to restore the user backup?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -rp "Enter the location home Directory (by default /home) : " directory
                if [ -z "$directory" ]; then
                  cd /home
                  read -rp "Enter Link Backup : " BackUP
                  print_g "Downloading the backup file..."
                  wget "$BackUP"
                  read -rp "Enter NameFile Backup : " FileBackup
                  print_g "Restoring the backup file..."
                  /usr/local/cpanel/scripts/restorepkg "$FileBackup"
                else
                  cd "$directory"
                  read -rp "Enter Link Backup : " BackUP
                  print_g "Downloading the backup file..."
                  wget "$BackUP"
                  read -rp "Enter NameFile Backup : " FileBackup
                  print_g "Restoring the backup file..."
                  /usr/local/cpanel/scripts/restorepkg "$FileBackup"
                fi
              fi
            fi

              # Clear RAM Cache
            if [ $AT_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Clear RAM Cache?(y/n) :')"
              if [ $INPUT = "y" ]; then
                sync; echo 1 > /proc/sys/vm/drop_caches ; sync; echo 2 > /proc/sys/vm/drop_caches ; sync; echo 3 > /proc/sys/vm/drop_caches ; swapoff -a ; swapon -a
                print_b "RAM Cache Successfully Cleared"
              fi
            fi

              # Delete all error_log
            if [ $AT_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Clear RAM Cache?(y/n) :')"
              if [ $INPUT = "y" ]; then
                /usr/bin/find /root*/* -type f -name error_log -exec du -sh {} \;
                /usr/bin/find /root*/* -type f -name error_log -exec rm -rf {} \;
                /usr/bin/find /home*/*/public_html/*/* -type f -name error_log -exec du -sh {} \;
                /usr/bin/find /home*/*/public_html/*/* -type f -name error_log -exec rm -rf {} \;
                print_b "all error_log Successfully Delete"
              fi
            fi

              # Clear /tmp
            if [ $AT_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Clear /tmp?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"centos"* ]]; then
                  yum install tmpwatch -y ; /usr/sbin/tmpwatch --mtime --all 6 /tmp
                  print_b "/tmp Successfully Cleared"
                elif [[ $(cat /etc/os-release | grep -w "ID") == *"ubuntu"* ]]; then
                  apt install tmpreaper -y ; /usr/sbin/tmpwatch --mtime --all 6 /tmp
                  print_b "/tmp Successfully Cleared"
                fi
              fi
            fi
            if [ $AT_ACTION -eq 5 ]; then
              clear
              break
            fi
          done
        fi
      fi
    done
  fi

  # sub-menu for Plesk
  if [ $CP_CHOICE -eq 2 ]; then
    clear
    while true; do
      echo -e "\033[0;32m${Plesk}\033[0m"
      print_y "What do you want to do?"
      print_g "1) Install Plesk"
      print_g "2) Server Tools [4]"
      print_g "3) Setup CSF [4]"
      print_g "4) install Plugins [4]"
      print_g "5) Advanced Tools [4]"
      print_g "6) Back to Menu"
      validate_menu_input "$(print_y 'Enter your choice (1-6) : ')" 1 6
      PK_ACTION=$INPUT

      if [ $PK_ACTION -eq 6 ]; then
        clear
        break
      fi

        # Install Plesk
      if [ $PK_ACTION -eq 1 ]; then
        clear
        echo -e "\033[0;32m${InstallPlesk}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Install Plesk?(y/n) :')"
        if [ $INPUT = "y" ]; then
          sh <(curl https://autoinstall.plesk.com/one-click-installer || wget -O - https://autoinstall.plesk.com/one-click-installer)
        fi
      fi

        # Server Tools
      if [ $PK_ACTION -eq 2 ]; then
        clear
        echo -e "\033[0;32m${Tools}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Server Tools?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Change Nameserver"
            print_g "2) Change Hostname"
            print_g "3) Change SSH Port"
            print_g "4) Change Password (root)"
            print_g "5) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-5) : ')" 1 5
            ST_ACTION=$INPUT

              # Change Nameserver
            if [ $ST_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to change the Nameserver?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -p "Enter Primary Nameserver: " PRIMARY_NS
                read -p "Enter Secondary Nameserver: " SECONDARY_NS
                if [ -f /etc/resolv.conf ]; then
                  sed -i 's/^nameserver/#nameserver/g' /etc/resolv.conf
                  echo "nameserver $PRIMARY_NS" >> /etc/resolv.conf
                  echo "nameserver $SECONDARY_NS" >> /etc/resolv.conf
                  print_b "Nameserver Changed To -> [ "$PRIMARY_NS" - "$SECONDARY_NS" ]"
                fi
              fi
            fi

              # Change hostname
            if [ $ST_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to change the Hostname?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -rp "Enter your Hostname : " HOSTNAME
                hostnamectl set-hostname $HOSTNAME
                print_b "Hostname Changed To -> "$HOSTNAME""
              fi
            fi

              # Change SSH Port
            if [ $ST_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change SSH Port?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -rp "Enter new SSH port : " NEW_PORT
                sudo sed -i "s/^#*Port 22/Port $NEW_PORT/" /etc/ssh/sshd_config
                service sshd restart
                print_b "SSH Port Changed To -> "$NEW_PORT""
              fi
            fi

              # Change Password (root)
            if [ $ST_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change Password Server?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ $(whoami) = "root" ]; then
                  passwd root
                else
                  sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart ssh && sudo passwd
                fi
                print_b "Password Changed (root) Successfully"
              fi
            fi
            if [ $ST_ACTION -eq 5 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup CSF
      if [ $PK_ACTION -eq 3 ]; then
        clear
        echo -e "\033[0;32m${CSF}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup CSF?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Install CSF"
            print_g "2) CSF Configuration"
            print_g "3) CSF Blocklists Configuration"
            print_g "4) Unblock Telegram IPs"
            print_g "5) Uninstall CSF"
            print_g "6) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-6) : ')" 1 6
            CSF_ACTION=$INPUT

              # Install CSF
            if [ $CSF_ACTION -eq 1 ]; then
              clear
              validate_yn_input "$(print_y 'Are you sure you want to Install CSF?(y/n) :')"
              if [ $INPUT = "y" ]; then
                cd /usr/src ; rm -fv csf.tgz ; wget https://download.configserver.com/csf.tgz ; tar -xzf csf.tgz ; cd csf ; sh install.sh ; perl /usr/local/csf/bin/csftest.pl ; cd
                print_g "ConfigServer Security & Firewall (CSF) Successfully Installed"
              fi
            fi

              #CSF Configuration
            if [ $CSF_ACTION -eq 2 ]; then
              clear
              validate_yn_input "$(print_y 'Are you sure you want to Configuration CSF?(y/n) :')"
              if [ $INPUT = "y" ]; then
                # Set the parameters
                TESTING="0"
                CT_LIMIT="100"
                CT_INTERVAL="30"
                CT_EMAIL_ALERT="1"
                CT_PORTS="80,443,2083,2082,2087,20,21,25,110,113,123,465,993,995,22"
                CT_BLOCK_TIME="3600"
                CT_PERMANENT="1"
                CONNLIMIT="22;5,443;20,80;20,20;20,21;20,25;20,110;20,113;20,123;20,465;20,993;20,995;20,2083;20,2082;20"
                RESTRICT_SYSLOG="3"
                DENY_IP_LIMIT="200"
                PACKET_FILTER="1"
                PORTFLOOD="1"
                # Update the csf.conf file
                sed -i "s/^TESTING=.*/TESTING=$TESTING/g" /etc/csf/csf.conf
                sed -i "s/^CT_LIMIT=.*/CT_LIMIT=$CT_LIMIT/g" /etc/csf/csf.conf
                sed -i "s/^CT_INTERVAL=.*/CT_INTERVAL=$CT_INTERVAL/g" /etc/csf/csf.conf
                sed -i "s/^CT_EMAIL_ALERT=.*/CT_EMAIL_ALERT=$CT_EMAIL_ALERT/g" /etc/csf/csf.conf
                sed -i "s/^CT_PORTS=.*/CT_PORTS=$CT_PORTS/g" /etc/csf/csf.conf
                sed -i "s/^CT_BLOCK_TIME=.*/CT_BLOCK_TIME=$CT_BLOCK_TIME/g" /etc/csf/csf.conf
                sed -i "s/^CT_PERMANENT=.*/CT_PERMANENT=$CT_PERMANENT/g" /etc/csf/csf.conf
                sed -i "s/^CONNLIMIT=.*/CONNLIMIT=$CONNLIMIT/g" /etc/csf/csf.conf
                sed -i "s/^RESTRICT_SYSLOG=.*/RESTRICT_SYSLOG=$RESTRICT_SYSLOG/g" /etc/csf/csf.conf
                sed -i "s/^DENY_IP_LIMIT=.*/DENY_IP_LIMIT=$DENY_IP_LIMIT/g" /etc/csf/csf.conf
                sed -i "s/^PACKET_FILTER=.*/PACKET_FILTER=$PACKET_FILTER/g" /etc/csf/csf.conf
                sed -i "s/^PORTFLOOD=.*/PORTFLOOD=$PORTFLOOD/g" /etc/csf/csf.conf
                print_b "CSF configuration is successfully."
              fi
            fi

              # CSF Blocklists Configuration
            if [ $CSF_ACTION -eq 3 ]; then
              clear
              validate_yn_input "$(print_y 'Are you sure you want to CSF Blocklists Configuration?(y/n) :')"
                if [ $INPUT = "y" ]; then
                  while read line; do
                    # Check if the line starts with #
                    if [[ $line == \#* ]]; then
                      # Skip comment lines
                      continue
                    fi
                    # Split the line by | character
                    IFS='|' read -ra arr <<< "$line"
                  done < /etc/csf/csf.blocklists | sed 's/# Split the line by | character//'
                  print_b "CSF Blocklists Configuration is Successfully."
                fi
            fi

              # Unblock Telegram IPs
            if [ $CSF_ACTION -eq 4 ]; then
              clear
              validate_yn_input "$(print_y 'Are you sure you want to Unblock Telegram IPs?(y/n) :')"
                if [ $INPUT = "y" ]; then
                  csf -a 149.154.168.0/22 ; csf -a 149.154.164.0/22 ; csf -a 149.154.172.0/22 ; csf -a 149.154.160.0/22 ; csf -a 91.108.4.0/22 ; csf -a 91.108.56.0/22 ; csf -a 91.108.16.0/22 ; csf -a 91.108.12.0/22 ; csf -a 91.108.8.0/22
                  print_b "Unblock Telegram IPs is Successfully."
                fi
            fi

              # uninstall CSF
            if [ $CSF_ACTION -eq 5 ]; then
              clear
              validate_yn_input "$(print_y 'Are you sure you want to Uninstall CSF?(y/n) :')"
                if [ $INPUT = "y" ]; then
                  cd /etc/csf ; sh uninstall.sh
                  print_b "Uninstall CSF is Successfully."
                fi
            fi
            if [ $CSF_ACTION -eq 6 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Install Plugins
      if [ $PK_ACTION -eq 4 ]; then
        clear
        echo -e "\033[0;32m${Plugins}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Install Plugins?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Install LiteSpeed"
            print_g "2) Install ImunifyAV"
            print_g "3) Install Softaculous"
            print_g "4) Install SitePad"
            print_g "5) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-5) : ')" 1 5
            PG_ACTION=$INPUT

              # Install LiteSpeed
            if [ $PG_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install LiteSpeed?(y/n) :')"
              if [ $INPUT = "y" ]; then
                cd /usr/src ; wget http://www.litespeedtech.com/packages/plesk/litespeed-plesk.zip ; unzip litespeed-plesk.zip ; cd plib/resources ; chmod 700 pleskInstall.sh ; ./pleskInstall.sh ; rm -f pleskInstall.sh ; cd
                print_b "LiteSpeed Successfully Installed"
              fi
            fi

              # Install ImunifyAV
            if [ $PG_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Install ImunifyAV?(y/n) :')"
              if [ $INPUT = "y" ]; then
                wget https://repo.imunify360.cloudlinux.com/defence360/imav-deploy.sh ; bash imav-deploy.sh ; rm -rf /root/imav-deploy.sh
                print_b "ImunifyAV Successfully Installed"
              fi
            fi

              # Install Softaculous
            if [ $PG_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure that ioncube is installed and active on your server?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if php -m | grep -q ionCube ; then
                  wget -N http://files.softaculous.com/install.sh && chmod 755 install.sh && ./install.sh
                  print_b "Softaculous Successfully Installed"
                else
                  print_r "Error: ionCube is not installed on your server.
                  Please go to this address to install and activate ionCube -> Home / Server Configuration / Tweak Settings -> PHP -> cPanel PHP loader"
                fi
              fi
            fi

              # Install SitePad
            if [ $PG_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure that ioncube is installed and active on your server?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if php -m | grep -q ionCube ; then
                  cd /usr/local/src/ ; rm -fv install.sh ; wget -N https://files.sitepad.com/install.sh ; chmod +x install.sh ; ./install.sh ; cd
                  print_b "SitePad Successfully Installed"
                else
                  print_r "Error: ionCube is not installed on your server.
                  Please go to this address to install and activate ionCube -> Tools & Settings > General Settings > PHP Settings > PHP 8.1 > Manage PECL Packages"
                fi
              fi
            fi
            if [ $PG_ACTION -eq 5 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Advanced Tools
      if [ $PK_ACTION -eq 5 ]; then
        clear
        echo -e "\033[0;32m${Advanced}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Advanced Tools?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Clear RAM Cache"
            print_g "2) Delete all error_log"
            print_g "3) Clear /tmp"
            print_g "4) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
            AT_ACTION=$INPUT

              # Clear RAM Cache
            if [ $AT_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Clear RAM Cache?(y/n) :')"
              if [ $INPUT = "y" ]; then
                sync; echo 1 > /proc/sys/vm/drop_caches ; sync; echo 2 > /proc/sys/vm/drop_caches ; sync; echo 3 > /proc/sys/vm/drop_caches ; swapoff -a ; swapon -a
                print_b "RAM Cache Successfully Cleared"
              fi
            fi

              # Delete all error_log
            if [ $AT_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Clear RAM Cache?(y/n) :')"
              if [ $INPUT = "y" ]; then
                /usr/bin/find /root*/* -type f -name error_log -exec du -sh {} \;
                /usr/bin/find /root*/* -type f -name error_log -exec rm -rf {} \;
                /usr/bin/find /var*/*www/* -type f -name error_log -exec du -sh {} \;
                /usr/bin/find /var*/*www/* -type f -name error_log -exec rm -rf {} \;
                /usr/bin/find /var*/www/*vhosts/*/* -type f -name error_log -exec du -sh {} \;
                /usr/bin/find /var*/www/*vhosts/*/* -type f -name error_log -exec rm -rf {} \;
                /usr/bin/find /home*/* -type f -name error_log -exec du -sh {} \;
                /usr/bin/find /home*/* -type f -name error_log -exec rm -rf {} \;
                print_b "All error_log Successfully Delete"
              fi
            fi

              # Clear /tmp
            if [ $AT_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Clear /tmp?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [[ $(cat /etc/os-release | grep -w "ID") == *"centos"* ]]; then
                  yum install tmpwatch -y ; /usr/sbin/tmpwatch --mtime --all 6 /tmp
                  print_b "/tmp Successfully Cleared"
                elif [[ $(cat /etc/os-release | grep -w "ID") == *"ubuntu"* ]]; then
                  apt install tmpreaper -y ; /usr/sbin/tmpwatch --mtime --all 6 /tmp
                  print_b "/tmp Successfully Cleared"
                fi
              fi
            fi
            if [ $AT_ACTION -eq 4 ]; then
              clear
              break
            fi
          done
        fi
      fi
    done
  fi

  # sub-menu for aaPanel
  if [ $CP_CHOICE -eq 3 ]; then
    clear
    while true; do
      echo -e "\033[0;32m${aaPanel}\033[0m"
      print_y "What do you want to do?"
      print_g "1) Install aaPanel"
      print_g "2) Server Tools [4]"
      print_g "3) Setup Management [10]"
      print_g "4) Setup WebServer [2]"
      print_g "5) Setup Mysql [10]"
      print_g "6) Setup FTP [7]"
      print_g "7) Setup Redis [7]"
      print_g "8) Setup Memcached [5]"
      print_g "9) Back to Menu"
      validate_menu_input "$(print_y 'Enter your choice (1-9) : ')" 1 9
      AP_ACTION=$INPUT

      if [ $AP_ACTION -eq 9 ]; then
        clear
        break
      fi

        # Install aaPanel
      if [ $AP_ACTION -eq 1 ]; then
        clear
        echo -e "\033[0;32m${InstallaaPanel}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Install aaPanel?(y/n) :')"
        if [ $INPUT = "y" ]; then
          if [[ $(cat /etc/os-release | grep -w "ID") == *"centos"* ]]; then
            yum install -y wget && wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh aapanel
            print_g "aaPanel Successfully Installed, Please Login Panel"
          elif [[ $(cat /etc/os-release | grep -w "ID") == *"ubuntu"* ]]; then
            wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh aapanel
            print_g "aaPanel Successfully Installed, Please Login Panel"
          elif [[ $(cat /etc/os-release | grep -w "ID") == *"debian"* ]]; then
            wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && bash install.sh aapanel
            print_g "aaPanel Successfully Installed, Please Login Panel"
          else
            print_r "aaPanel installation is only supported on CentOS, Ubuntu, Debian."
          fi
        fi
      fi

        # Server Tools
      if [ $AP_ACTION -eq 2 ]; then
        clear
        echo -e "\033[0;32m${Tools}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Server Tools?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Change Nameserver"
            print_g "2) Change Hostname"
            print_g "3) Change SSH Port"
            print_g "4) Change Password (root)"
            print_g "5) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-11) : ')" 1 5
            ST_ACTION=$INPUT

              # Change Nameserver
            if [ $ST_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to change the Nameserver?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -p "Enter Primary Nameserver: " PRIMARY_NS
                read -p "Enter Secondary Nameserver: " SECONDARY_NS
                if [ -f /etc/resolv.conf ]; then
                  sed -i 's/^nameserver/#nameserver/g' /etc/resolv.conf
                  echo "nameserver $PRIMARY_NS" >> /etc/resolv.conf
                  echo "nameserver $SECONDARY_NS" >> /etc/resolv.conf
                  print_b "Nameserver Changed To -> [ "$PRIMARY_NS" - "$SECONDARY_NS" ]"
                fi
              fi
            fi

              # Change hostname
            if [ $ST_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to change the Hostname?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -rp "Enter your Hostname : " HOSTNAME
                hostnamectl set-hostname $HOSTNAME
                print_b "Hostname Changed To -> "$HOSTNAME""
              fi
            fi

              # Change SSH Port
            if [ $ST_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change SSH Port?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -rp "Enter new SSH port : " NEW_PORT
                sudo sed -i "s/^#*Port 22/Port $NEW_PORT/" /etc/ssh/sshd_config
                service sshd restart
                print_b "SSH Port Changed To -> "$NEW_PORT""
              fi
            fi

              # Change Password (root)
            if [ $ST_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change Password Server?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ $(whoami) = "root" ]; then
                  passwd root
                else
                  sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && sudo systemctl restart ssh && sudo passwd
                fi
                print_b "Password Changed (root) Successfully"
              fi
            fi
            if [ $ST_ACTION -eq 5 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup Management
      if [ $AP_ACTION -eq 3 ]; then
        clear
        echo -e "\033[0;32m${Management}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup Management?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Start aaPanel"
            print_g "2) Stop aaPanel"
            print_g "3) Restart aaPanel"
            print_g "4) Uninstall aaPanel"
            print_g "5) Change Password aaPanel"
            print_g "6) View Current Port"
            print_g "7) Change Port aaPanel"
            print_g "8) Turn off SSL aaPanel"
            print_g "9) View Error logs aaPanel"
            print_g "10) View Error logs Site"
            print_g "11) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-11) : ')" 1 11
            SM_ACTION=$INPUT

              # Start aaPanel
            if [ $SM_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Start aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                service bt start
                print_g "aaPanel Successfully Started."
              fi
            fi

              # Stop aaPanel
            if [ $SM_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Stop aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                service bt stop
                print_g "aaPanel Successfully Stoped."
              fi
            fi

              # Restart aaPanel
            if [ $SM_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Restart aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                service bt restart
                print_g "aaPanel Successfully Restarted."
              fi
            fi

              # Uninstall aaPanel
            if [ $SM_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Uninstall aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                service bt stop ; chkconfig --del bt ; rm -f /etc/init.d/bt ; rm -rf /www/server/panel
                print_g "aaPanel Successfully Uninstalled."
              fi
            fi

              # Change Password aaPanel
            if [ $SM_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change Password aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                  read -rp "Enter Password : " Pass
                  cd /www/server/panel ; python tools.py panel $Pass
                  print_b "Password Changed To -> "$Pass""
              fi
            fi

              # View Current Port
            if [ $SM_ACTION -eq 6 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to View Current Port?(y/n) :')"
              if [ $INPUT = "y" ]; then
                cat /www/server/panel/data/port.pl
              fi
            fi

              # Change Port aaPanel
            if [ $SM_ACTION -eq 7 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Uninstall aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                read -p "Enter Port aaPanel : " Port
                echo $Port > /www/server/panel/data/port.pl ; service bt restart ; firewall-cmd --permanent --zone=public --add-port=$Port/tcp firewall-cmd --reload ; service bt stop ; chkconfig --del bt ; rm -f /etc/init.d/bt ; rm -rf /www/server/panel
                print_g "aaPanel Successfully Changed Port To -> "$Port"."
              fi
            fi

              # Turn off SSL aaPanel
            if [ $SM_ACTION -eq 8 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Turn off SSL aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                rm -f /www/server/panel/data/ssl.pl ; /etc/init.d/bt restart
                print_g "aaPanel SSL successfully disabled."
              fi
            fi

              # View Error logs aaPanel
            if [ $SM_ACTION -eq 9 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to View Error logs aaPanel?(y/n) :')"
              if [ $INPUT = "y" ]; then
                cat /tmp/panelBoot
              fi
            fi

              # View Error logs Site
            if [ $SM_ACTION -eq 10 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to View Error logs Site?(y/n) :')"
              if [ $INPUT = "y" ]; then
                cat /www/wwwlogs
              fi
            fi
            if [ $SM_ACTION -eq 11 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # WebServer
      if [ $AP_ACTION -eq 4 ]; then
        clear
        echo -e "\033[0;32m${WebServer}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to WebServer section?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_y "Select your Web Server type"
            print_g "1) Setup Nginx [7]"
            print_g "2) Setup Apache [7]"
            print_g "3) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-3) : ')" 1 3
            WS_ACTION=$INPUT

              # Setup Nginx
            if [ $WS_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Setup Nginx?(y/n) :')"
              if [ $INPUT = "y" ]; then
                while true; do
                  print_g "1) Start Nginx"
                  print_g "2) Stop Nginx"
                  print_g "3) Restart Nginx"
                  print_g "4) Reload Nginx"
                  print_g "5) Status Nginx"         
                  print_g "6) Configuration Nginx"
                  print_g "7) Open Directory Nginx"
                  print_g "8) Back to Menu"
                  validate_menu_input "$(print_y 'Enter your choice (1-8) : ')" 1 8
                  SN_ACTION=$INPUT
                  
                    # Start Nginx
                  if [ $SN_ACTION -eq 1 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Start Nginx?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v nginx)" ]; then
                        systemctl start nginx
                        print_g "Nginx Successfully Started."
                      else
                        print_r "Nginx is not installed"
                      fi
                    fi
                  fi

                    # Stop Nginx
                  if [ $SN_ACTION -eq 2 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Stop Nginx?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v nginx)" ]; then
                        systemctl stop nginx
                        print_g "Nginx Successfully Stoped."
                      else
                        print_r "Nginx is not installed"
                      fi
                    fi
                  fi

                    # Restart Nginx
                  if [ $SN_ACTION -eq 3 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Restart Nginx?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v nginx)" ]; then
                        systemctl restart nginx
                        print_g "Nginx Successfully Restarted."
                      else
                        print_r "Nginx is not installed"
                      fi
                    fi
                  fi

                    # Reload Nginx
                  if [ $SN_ACTION -eq 4 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Reload Nginx?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v nginx)" ]; then
                        systemctl reload nginx
                        print_g "Nginx Successfully Reloaded."
                      else
                        print_r "Nginx is not installed"
                      fi
                    fi
                  fi

                    # Status Nginx
                  if [ $SN_ACTION -eq 5 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Srarus Nginx?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v nginx)" ]; then
                        systemctl status nginx
                      else
                        print_r "Nginx is not installed"
                      fi
                    fi
                  fi

                    # Configuration Nginx
                  if [ $SN_ACTION -eq 6 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Configuration Nginx?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v nginx)" ]; then
                        while true; do
                          print_y ""
                          print_g "1) nano editor"
                          print_g "2) vi editor"
                          print_g "3) vim editor"
                          print_g "4) Back to Menu"
                          validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
                          CN_ACTION=$INPUT
                          
                            # nano editor
                          if [ $CN_ACTION -eq 1 ]; then
                          nano /www/server/nginx/conf/nginx.conf
                          sleep 2s
                          clear
                          fi

                            # vi editor
                          if [ $CN_ACTION -eq 2 ]; then
                          vi /www/server/nginx/conf/nginx.conf
                          sleep 2s
                          clear
                          fi

                            # vim editor
                          if [ $CN_ACTION -eq 3 ]; then
                          vim /www/server/nginx/conf/nginx.conf
                          sleep 2s
                          clear
                          fi
                          if [ $CN_ACTION -eq 4 ]; then
                          vim /www/server/nginx/conf/nginx.conf
                          sleep 2s
                          clear
                          fi
                        done
                      else
                        print_r "Nginx is not installed"
                      fi
                    fi
                  fi

                    # Open Directory Nginx
                  if [ $SN_ACTION -eq 7 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Open Directory Nginx?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v nginx)" ]; then
                        cd /www/server/nginx ; ls
                      else
                        print_r "Nginx is not installed"
                      fi
                    fi
                  fi
                  if [ $SN_ACTION -eq 8 ]; then
                    clear
                    break
                  fi
                done
              fi
            fi

              # Setup Apache
            if [ $WS_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Setup Apache?(y/n) :')"
              if [ $INPUT = "y" ]; then
                while true; do
                  print_g "1) Start Apache"
                  print_g "2) Stop Apache"
                  print_g "3) Restart Apache"
                  print_g "4) Reload Apache"
                  print_g "5) Status Apache"
                  print_g "6) Configuration Apache"
                  print_g "7) Open Directory Apache"
                  print_g "8) Back to Menu"
                  validate_menu_input "$(print_y 'Enter your choice (1-8) : ')" 1 8
                  SP_ACTION=$INPUT
                  
                    # Start Apache
                  if [ $SP_ACTION -eq 1 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Start Apache?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v apache2)" ]; then
                        systemctl start apache2
                        print_g "Apache Successfully Started."
                      else
                        print_r "Apache is not installed"
                      fi
                    fi
                  fi

                    # Stop Apache
                  if [ $SP_ACTION -eq 2 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Stop Apache?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v apache2)" ]; then
                        systemctl stop apache2
                        print_g "Apache Successfully Stoped."
                      else
                        print_r "Apache is not installed"
                      fi
                    fi
                  fi

                    # Restart Apache
                  if [ $SP_ACTION -eq 3 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Restart Apache?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v apache2)" ]; then
                        systemctl restart apache2
                        print_g "Apache Successfully Restarted."
                      else
                        print_r "Apache is not installed"
                      fi
                    fi
                  fi

                    # Reload Apache
                  if [ $SP_ACTION -eq 4 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Reload Apache?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v apache2)" ]; then
                        systemctl reload apache2
                        print_g "Apache Successfully Reloaded."
                      else
                        print_r "Apache is not installed"
                      fi
                    fi
                  fi

                    # Status Apache
                  if [ $SP_ACTION -eq 5 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Status Apache?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v apache2)" ]; then
                        systemctl status apache2
                      else
                        print_r "Apache is not installed"
                      fi
                    fi
                  fi

                    # Configuration Apache
                  if [ $SP_ACTION -eq 6 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Configuration Apache?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v apache2)" ]; then
                        while true; do
                          print_y ""
                          print_g "1) nano editor"
                          print_g "2) vi editor"
                          print_g "3) vim editor"
                          print_g "4) Back to Menu"
                          validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
                          CA_ACTION=$INPUT
                          
                            # nano editor
                          if [ $CA_ACTION -eq 1 ]; then
                          nano /www/server/apache/conf/httpd.conf
                          sleep 2s
                          clear
                          fi

                            # vi editor
                          if [ $CA_ACTION -eq 2 ]; then
                          vi /www/server/apache/conf/httpd.conf
                          sleep 2s
                          clear
                          fi

                            # vim editor
                          if [ $CA_ACTION -eq 3 ]; then
                          vim /www/server/apache/conf/httpd.conf
                          sleep 2s
                          clear
                          fi
                          if [ $CA_ACTION -eq 4 ]; then
                          vim /www/server/apache/conf/httpd.conf
                          sleep 5s
                          clear
                          fi
                        done
                      else
                        print_r "Apache is not installed"
                      fi
                    fi
                  fi

                    # Open Directory Apache
                  if [ $SP_ACTION -eq 7 ]; then
                    clear
                  validate_yn_input "$(print_y 'Are you sure you want to Open Directory Apache?(y/n) :')"
                    if [ $INPUT = "y" ]; then
                      if [ -x "$(command -v apache2)" ]; then
                        cd /www/server/httpd ; ls
                      else
                        print_r "Apache is not installed"
                      fi
                    fi
                  fi
                  if [ $SP_ACTION -eq 8 ]; then
                    clear
                    break
                  fi
                done
              fi
            fi
            if [ $WS_ACTION -eq 3 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup Mysql
      if [ $AP_ACTION -eq 5 ]; then
        clear
        echo -e "\033[0;32m${Mysql}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup Mysql?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Start Mysql"
            print_g "2) Stop Mysql"
            print_g "3) Restart Mysql"
            print_g "4) Reload Mysql"
            print_g "5) Status Mysql"
            print_g "6) Change Password MySQL"
            print_g "7) Configuration Mysql"
            print_g "8) Open Directory Mysql"
            print_g "9) Open Directory phpmyadmin"
            print_g "10) Open Directory Data Storage"   
            print_g "11) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-11) : ')" 1 11
            SM_ACTION=$INPUT
            
              # Start Mysql
            if [ $SM_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Start Mysql?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  systemctl start mysql
                  print_g "Mysql Successfully Started."
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Stop Mysql
            if [ $SM_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Stop Mysql?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  systemctl stop mysql
                  print_g "Mysql Successfully Stoped."
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Restart Mysql
            if [ $SM_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Restart Mysql?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  systemctl restart mysql
                  print_g "Mysql Successfully Restarted."
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Reload Mysql
            if [ $SM_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Reload Mysql?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  systemctl reload mysql
                  print_g "Mysql Successfully Reloaded."
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Status Mysql
            if [ $SM_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Status Mysql?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  systemctl status mysql
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Change Password MySQL
            if [ $SM_ACTION -eq 6 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Change Password MySQL?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  read -rp "Enter Password : " Pass
                  cd /www/server/panel ; python3 tools.py root $Pass
                  print_b "Password Changed To -> "$Pass""
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Configuration Mysql
            if [ $SM_ACTION -eq 7 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Configuration Mysql?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  while true; do
                    print_y ""
                    print_g "1) nano editor"
                    print_g "2) vi editor"
                    print_g "3) vim editor"
                    print_g "4) Back to Menu"
                    validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
                    CA_ACTION=$INPUT
                    
                      # nano editor
                    if [ $CA_ACTION -eq 1 ]; then
                    nano /etc/my.cnf
                    sleep 2s
                    clear
                    fi

                      # vi editor
                    if [ $CA_ACTION -eq 2 ]; then
                    vi /etc/my.cnf
                    sleep 2s
                    clear
                    fi

                      # vim editor
                    if [ $CA_ACTION -eq 3 ]; then
                    vim /etc/my.cnf
                    sleep 2s
                    clear
                    fi
                    if [ $CA_ACTION -eq 4 ]; then
                    vim /etc/my.cnf
                    sleep 2s
                    clear
                    fi
                  done
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Open Directory Mysql
            if [ $SM_ACTION -eq 8 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Open Directory Mysql?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  cd /www/server/mysql ; ls
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Open Directory phpmyadmin
            if [ $SM_ACTION -eq 9 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Open Directory phpmyadmin?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  cd /www/server/phpmyadmin ; ls
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi

              # Open Directory Data Storage
            if [ $SM_ACTION -eq 10 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Open Directory Data Storage?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -x "$(command -v mysql)" ]; then
                  cd /www/server/data ; ls
                else
                  print_r "Mysql is not installed"
                fi
              fi
            fi
            if [ $SM_ACTION -eq 11 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup FTP
      if [ $AP_ACTION -eq 6 ]; then
        clear
        echo -e "\033[0;32m${FTP}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup FTP?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Start FTP"
            print_g "2) Stop FTP"
            print_g "3) Restart FTP"
            print_g "4) Reload FTP"
            print_g "5) Status FTP"
            print_g "6) Configuration FTP"
            print_g "7) Open Directory FTP"
            print_g "8) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-8) : ')" 1 8
            SF_ACTION=$INPUT
            
              # Start FTP
            if [ $SF_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Start FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/pure-ftpd ]; then
                  systemctl start pure-ftpd
                  print_g "FTP Successfully Started."
                else
                  print_r "FTP is not installed"
                fi
              fi
            fi

              # Stop FTP
            if [ $SF_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Stop FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/pure-ftpd ]; then
                  systemctl stop pure-ftpd
                  print_g "FTP Successfully Stoped."
                else
                  print_r "FTP is not installed"
                fi
              fi
            fi

              # Restart FTP
            if [ $SF_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Restart FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/pure-ftpd ]; then
                  systemctl restart pure-ftpd
                  print_g "FTP Successfully Restarted."
                else
                  print_r "FTP is not installed"
                fi
              fi
            fi

              # Reload FTP
            if [ $SF_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Reload FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/pure-ftpd ]; then
                  systemctl reload pure-ftpd
                  print_g "FTP Successfully Reloaded."
                else
                  print_r "FTP is not installed"
                fi
              fi
            fi

              # Status FTP
            if [ $SF_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Status FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/pure-ftpd ]; then
                  systemctl status pure-ftpd
                else
                  print_r "FTP is not installed"
                fi
              fi
            fi

              # Configuration FTP
            if [ $SF_ACTION -eq 6 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Configuration FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/pure-ftpd ]; then
                  while true; do
                    print_y ""
                    print_g "1) nano editor"
                    print_g "2) vi editor"
                    print_g "3) vim editor"
                    print_g "4) Back to Menu"
                    validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
                    CA_ACTION=$INPUT
                    
                      # nano editor
                    if [ $CA_ACTION -eq 1 ]; then
                    nano /www/server/pure-ftpd/etc/pure-ftpd
                    sleep 2s
                    clear
                    fi

                      # vi editor
                    if [ $CA_ACTION -eq 2 ]; then
                    vi /www/server/pure-ftpd/etc/pure-ftpd
                    sleep 2s
                    clear
                    fi

                      # vim editor
                    if [ $CA_ACTION -eq 3 ]; then
                    vim /www/server/pure-ftpd/etc/pure-ftpd
                    sleep 2s
                    clear
                    fi
                    if [ $CA_ACTION -eq 4 ]; then
                    vim /www/server/pure-ftpd/etc/pure-ftpd
                    sleep 2s
                    clear
                    fi
                  done
                else
                  print_r "FTP is not installed"
                fi
              fi
            fi

              # Open Directory FTP
            if [ $SF_ACTION -eq 7 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Open Directory FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/pure-ftpd ]; then
                  cd /www/server/pure-ftpd ; ls
                else
                  print_r "FTP is not installed"
                fi
              fi
            fi
            if [ $SF_ACTION -eq 8 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup Redis
      if [ $AP_ACTION -eq 7 ]; then
        clear
        echo -e "\033[0;32m${Redis}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup Redis?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Start Redis"
            print_g "2) Stop Redis"
            print_g "3) Restart Redis"
            print_g "5) Status Redis"
            print_g "6) Configuration Redis"
            print_g "7) Open Directory Redis"
            print_g "8) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-8) : ')" 1 8
            SR_ACTION=$INPUT
            
              # Start Redis
            if [ $SR_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Start Redis?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/redis ]; then
                  systemctl start redis
                  print_g "Redis Successfully Started."
                else
                  print_r "Redis is not installed"
                fi
              fi
            fi

              # Stop Redis
            if [ $SR_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Stop Redis?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/redis ]; then
                  systemctl stop redis
                  print_g "Redis Successfully Stoped."
                else
                  print_r "Redis is not installed"
                fi
              fi
            fi

              # Restart Redis
            if [ $SR_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Restart FTP?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/redis ]; then
                  systemctl restart redis
                  print_g "Redis Successfully Restarted."
                else
                  print_r "Redis is not installed"
                fi
              fi
            fi

              # Reload Redis
            if [ $SR_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Reload Redis?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/redis ]; then
                  systemctl reload redis
                  print_g "Redis Successfully Reloaded."
                else
                  print_r "Redis is not installed"
                fi
              fi
            fi

              # Status Redis
            if [ $SR_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Status Redis?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/redis ]; then
                  systemctl status redis
                else
                  print_r "Redis is not installed"
                fi
              fi
            fi

              # Configuration Redis
            if [ $SR_ACTION -eq 6 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Configuration Redis?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/redis ]; then
                  while true; do
                    print_y ""
                    print_g "1) nano editor"
                    print_g "2) vi editor"
                    print_g "3) vim editor"
                    print_g "4) Back to Menu"
                    validate_menu_input "$(print_y 'Enter your choice (1-4) : ')" 1 4
                    CA_ACTION=$INPUT
                    
                      # nano editor
                    if [ $CA_ACTION -eq 1 ]; then
                    nano /www/server/redis/redis.conf
                    sleep 2s
                    clear
                    fi

                      # vi editor
                    if [ $CA_ACTION -eq 2 ]; then
                    vi /www/server/redis/redis.conf
                    sleep 2s
                    clear
                    fi

                      # vim editor
                    if [ $CA_ACTION -eq 3 ]; then
                    vim /www/server/redis/redis.conf
                    sleep 2s
                    clear
                    fi
                    if [ $CA_ACTION -eq 4 ]; then
                    vim /www/server/redis/redis.conf
                    sleep 2s
                    clear
                    fi
                  done
                else
                  print_r "Redis is not installed"
                fi
              fi
            fi

              # Open Directory Redis
            if [ $SR_ACTION -eq 7 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Open Directory Redis?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /www/server/redis ]; then
                  cd /www/server/redis ; ls
                else
                  print_r "Redis is not installed"
                fi
              fi
            fi
            if [ $SR_ACTION -eq 8 ]; then
              clear
              break
            fi
          done
        fi
      fi

        # Setup Memcached
      if [ $AP_ACTION -eq 8 ]; then
        clear
        echo -e "\033[0;32m${Memcached}\033[0m"
      validate_yn_input "$(print_y 'Are you sure you want to Setup Memcached?(y/n) :')"
        if [ $INPUT = "y" ]; then
          while true; do
            print_g "1) Start Memcached"
            print_g "2) Stop Memcached"
            print_g "3) Restart Memcached"
            print_g "5) Status Memcached"
            print_g "6) Open Directory Memcached"
            print_g "7) Back to Menu"
            validate_menu_input "$(print_y 'Enter your choice (1-8) : ')" 1 8
            SMC_ACTION=$INPUT
            
              # Start Memcached
            if [ $SMC_ACTION -eq 1 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Start Memcached?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /usr/local/memcached ]; then
                  systemctl start memcached
                  print_g "Memcached Successfully Started."
                else
                  print_r "Memcached is not installed"
                fi
              fi
            fi

              # Stop Memcached
            if [ $SMC_ACTION -eq 2 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Stop Memcached?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /usr/local/memcached ]; then
                  systemctl stop memcached
                  print_g "Memcached Successfully Stoped."
                else
                  print_r "Memcached is not installed"
                fi
              fi
            fi

              # Restart Memcached
            if [ $SMC_ACTION -eq 3 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Restart Memcached?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /usr/local/memcached ]; then
                  systemctl restart memcached
                  print_g "Memcached Successfully Restarted."
                else
                  print_r "Memcached is not installed"
                fi
              fi
            fi

              # Reload Memcached
            if [ $SMC_ACTION -eq 4 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Reload Memcached?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /usr/local/memcached ]; then
                  systemctl reload memcached
                  print_g "Memcached Successfully Reloaded."
                else
                  print_r "Memcached is not installed"
                fi
              fi
            fi

              # Status Memcached
            if [ $SMC_ACTION -eq 5 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Status Memcached?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /usr/local/memcached ]; then
                  systemctl status memcached
                else
                  print_r "Memcached is not installed"
                fi
              fi
            fi

              # Open Directory Memcached
            if [ $SMC_ACTION -eq 7 ]; then
              clear
            validate_yn_input "$(print_y 'Are you sure you want to Open Directory Memcached?(y/n) :')"
              if [ $INPUT = "y" ]; then
                if [ -d /usr/local/memcached ]; then
                  cd /usr/local/memcached ; ls
                else
                  print_r "Memcached is not installed"
                fi
              fi
            fi
            if [ $SMC_ACTION -eq 8 ]; then
              clear
              break
            fi
          done
        fi
      fi
    done
  fi
done