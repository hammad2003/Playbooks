#!/bin/bash

sudo apt install -y whiptail figlet

mensaje_smai() {
  figlet "SMAI"
}

mensaje_exit() {
  figlet "Exiting..."
}

mensaje_smai

# Check if whiptail is installed
if ! command -v whiptail &> /dev/null
then
    echo "whiptail could not be found, please install it first."
    exit 1
fi

while true; do
    CHOICE=$(whiptail --title "Script Selection Menu" --menu "Choose a script to run:" 15 60 4 \
        "1" "Install Client" \
        "2" "Install Server" \
        "3" "Exit" 3>&1 1>&2 2>&3)

    case $CHOICE in
        1)
            echo "Running install_client.sh..."
            if [ -f "install_client.sh" ]; then
                chmod +x install_client.sh
                ./install_client.sh
            else
                whiptail --title "Error" --msgbox "install_client.sh not found!" 8 45
            fi
            ;;
        2)
            echo "Running install_server.sh..."
            if [ -f "install_server.sh" ]; then
                chmod +x install_server.sh
                ./install_server.sh
            else
                whiptail --title "Error" --msgbox "install_server.sh not found!" 8 45
            fi
            ;;
        3)
            mensaje_exit
            exit 0
            ;;
        *)
            whiptail --title "Error" --msgbox "Invalid choice!" 8 45
            ;;
    esac
done