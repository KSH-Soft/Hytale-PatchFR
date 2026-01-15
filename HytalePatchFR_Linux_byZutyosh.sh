#!/bin/bash

# ---------------------- Copyright ----------------------------------
# Code original par KSH-Soft, porté sous Linux/Bash par Zutyosh.
# Ne pas supprimer ce Copyright, merci. :-)
# ---------------------- Copyright ----------------------------------
# Ce projet est non officiel et n’est pas affilié à Hypixel Studios.
# Hytale et tous les éléments associés sont la propriété de leurs détenteurs respectifs.

# Configuration
VERSION="0.3"
# Chemin basé sur votre demande (Flatpak standard)
DEFAULT_ROOT="$HOME/.var/app/com.hypixel.HytaleLauncher/data/Hytale"
# On ajoute la structure interne standard du jeu
# TARGET_PATH="$DEFAULT_ROOT/install/release/package/game/latest/Client/Data/Shared/Language/fr-FR"
TARGET_PATH="$DEFAULT_ROOT/install/release/package/game/latest/Client/Data/Shared/Language"

# Dossiers de travail (Norme XDG Linux : ~/.local/share)
KSHSOFT_FOLDER="$HOME/.local/share/KSH-SOFT/HytalePatchFR"
TEMP_FOLDER="$KSHSOFT_FOLDER/TMP"

# Date pour les backups
MYDATE=$(date +%Y%m%d_%H%M%S)

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction Logo
show_logo() {
    clear
    echo -e "${CYAN}"
    echo "     _    _       _                 ______     _       _       ____________ "
    echo "    | |  | |     | |                | ___ \   | |     | |      |  ___| ___ \\"
    echo "    | |__| |_   _| |_ __ _ | | ___  | |_/ /_ _| |_ ___| |__    | |_  | |_/ /"
    echo "    |  __  | | | | __/ _\` || |/ _ \ |  __/ _\` | __/ __| '_ \   |  _| |    / "
    echo "    | |  | | |_| | || (_| || |  __/ | | | (_| | || (__| | | |  | |   | |\ \ "
    echo "    \_|  |_/\__, |\__\__,_||_|\___| \_|  \__,_|\__\___|_| |_|  \_|   \_| \_|"
    echo "             __/ |                                                          "
    echo "            |___/                v$VERSION - By KSH-Soft, Linux port by Zutyosh (github.com/KSH-Soft)  "
    echo -e "${NC}"
    echo ""
}

# Début du script
show_logo
echo "Mise à jour de votre Pack de langue pour Hytale !"
echo ""
read -n 1 -s -r -p "Appuyez sur une touche pour continuer..."
echo ""
echo -e "${YELLOW}Configuration...${NC}"
echo ""

# Vérification du dossier
if [ ! -d "$TARGET_PATH" ]; then
    echo -e "${RED}Erreur : le dossier par défaut n'existe pas ou le chemin a changé.${NC}"
    echo "Chemin testé : $TARGET_PATH"
    echo ""
    echo "Merci de selectionner votre dossier 'Language'"
    echo "Il se trouve généralement dans 'Data/Shared/Language' de votre jeu."
    echo ""
    read -n 1 -s -r -p "Appuyez sur une touche pour sélectionner le dossier..."
    echo ""

    # Tentative d'utilisation de Zenity (GUI) sinon fallback en ligne de commande
    if command -v zenity &> /dev/null; then
        SELECTED_FOLDER=$(zenity --file-selection --directory --title="Selectionnez votre dossier Language")
    else
        echo "Entrez le chemin complet vers le dossier 'Language' :"
        read -e SELECTED_FOLDER
    fi

    if [ -z "$SELECTED_FOLDER" ] || [ ! -d "$SELECTED_FOLDER" ]; then
        echo -e "${RED}Aucun dossier valide sélectionné. Abandon...${NC}"
        exit 1
    fi
    TARGET_PATH="$SELECTED_FOLDER"
    echo "Dossier sélectionné : $TARGET_PATH"
else
    echo -e "${GREEN}Dossier du jeu trouvé !${NC}"
fi

echo ""
read -n 1 -s -r -p "Appuyez sur une touche pour lancer l'installation..."
echo ""

# Création des dossiers de travail
mkdir -p "$KSHSOFT_FOLDER"
mkdir -p "$TEMP_FOLDER"

echo -e "${CYAN}Téléchargement... Veuillez patienter...${NC}"
echo ""

# Fonction de téléchargement pour éviter la répétition
download_file() {
    local fname=$1
    local url=$2
    echo "Téléchargement de $fname ..."
    curl -# -L -o "$TEMP_FOLDER/$fname" "$url"
    if [ $? -ne 0 ]; then
        echo -e "${RED}Erreur pendant le téléchargement de $fname.${NC}"
        echo "Merci de contacter le développeur, KSH-Soft."
        exit 1
    fi
    echo ""
}

BASE_URL="https://raw.githubusercontent.com/KSH-Soft/Hytale-PatchFR/refs/heads/main/fr-FR"

download_file "meta.lang" "$BASE_URL/meta.lang"
download_file "client.lang" "$BASE_URL/client.lang"
download_file "server.lang" "$BASE_URL/server.lang"

echo -e "${YELLOW}Installation du Patch FR...${NC}"
echo ""

DEST_DIR="$TARGET_PATH/fr-FR"
[ ! -d "$DEST_DIR" ] && mkdir -p "$DEST_DIR"

DEST_FILE1="$DEST_DIR/meta.lang"
DEST_FILE2="$DEST_DIR/client.lang"
DEST_FILE3="$DEST_DIR/server.lang"

# Backup (mv fonctionne comme move)
if [ -f "$DEST_FILE1" ]; then mv "$DEST_FILE1" "$KSHSOFT_FOLDER/meta_Backup_$MYDATE.lang"; fi
if [ -f "$DEST_FILE2" ]; then mv "$DEST_FILE2" "$KSHSOFT_FOLDER/client_Backup_$MYDATE.lang"; fi
if [ -f "$DEST_FILE3" ]; then mv "$DEST_FILE3" "$KSHSOFT_FOLDER/server_Backup_$MYDATE.lang"; fi

# Installation des nouveaux fichiers
mv "$TEMP_FOLDER/meta.lang" "$DEST_FILE1"
mv "$TEMP_FOLDER/client.lang" "$DEST_FILE2"
mv "$TEMP_FOLDER/server.lang" "$DEST_FILE3"

echo ""
echo "Nettoyage du dossier temporaire..."
rm -rf "$TEMP_FOLDER"

show_logo
echo -e "${GREEN}Mise à jour de votre Pack de langue pour Hytale Terminée !${NC}"
echo ""
echo "Vous pouvez relancer votre jeu..."
echo ""
read -n 1 -s -r -p "Appuyez sur une touche pour fermer..."
exit 0