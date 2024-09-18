#!/bin/bash

SRC_DIR="$HOME/.config/"
DEST_DIR="/home/elo/Public/Hyprland-Dots-GetTuh/config/"

folders=(
    "Kvantum"
    "ags"
    "btop"
    "cava"
    "fastfetch"
    "hypr"
    "kitty"
    "nvim"
    "qt5ct"
    "qt6ct"
    "rofi"
    "swappy"
    "swaync"
    "wallust"
    "waybar"
    "wlogout"
)

copy_to_dest() {
    for folder in "${folders[@]}"; do
        if [ -d "$SRC_DIR$folder" ]; then
            echo "Copying $folder to destination..."
            cp -r "$SRC_DIR$folder" "$DEST_DIR"
            echo "$folder copied to destination"
        else
            echo "$folder does not exist in $SRC_DIR"
        fi
    done
}

copy_to_src() {
    for folder in "${folders[@]}"; do
        if [ -d "$DEST_DIR$folder" ]; then
            echo "Copying $folder to source..."
            cp -r "$DEST_DIR$folder" "$SRC_DIR"
            echo "$folder copied to source"
        else
            echo "$folder does not exist in $DEST_DIR"
        fi
    done
}

echo "Select the direction of copying:"
echo "1) Copy Current config to git folder"
echo "2) Copy git to current config"
read -rp "Enter your choice (1 or 2): " choice

if [ "$choice" == "1" ]; then
    copy_to_dest
elif [ "$choice" == "2" ]; then
    copy_to_src
else
    echo "Invalid choice! Exiting..."
    exit 1
fi

echo "Operation completed!"
