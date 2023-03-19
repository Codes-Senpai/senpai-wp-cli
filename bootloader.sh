#! /bin/bash



#source ~/senpai-wp-cli/plugin_gen.sh TODO impliment this in future
source ~/senpai-wp-cli/theme_gen.sh
source ~/senpai-wp-cli/help.sh

source ~/senpai-wp-cli/wp-scripts/install-wp.sh
source ~/senpai-wp-cli/wp-scripts/uninstall-wp.sh
source ~/senpai-wp-cli/wp-scripts/on-off-lamp.sh



##Main entry file##

senpai() {

EMOJIS=(🥯  🦆 🦉 🥓 🦀 🍣 🍤 🍥 🍡 🥃 🥞 🤯 🤪 🤬 🤫 🤭 🧐 🐕 🦖 👾 🐉 🐓 🐋 🐌 🐢)
SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
enable_trapping #<- optional to clean up properly if user presses ctrl-c
setup_scroll_area #<- create empty progress bar
block_progress_bar 0 #<- turns the progress bar yellow to indicate some action is requested from the user

GREEN='\033[0;32m' #https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
NC='\033[0m' # No Color
#LGREEN = '\033[1;32m'
NC='\033[0m'
echo ""
echo -e "${GREEN}███████╗███████╗███╗   ██╗██████╗  █████╗ ██╗     ██████╗██╗     ██╗"
echo -e "${GREEN}██╔════╝██╔════╝████╗  ██║██╔══██╗██╔══██╗██║    ██╔════╝██║     ██║"
echo -e "${GREEN}███████╗█████╗  ██╔██╗ ██║██████╔╝███████║██║    ██║     ██║     ██║"
echo -e "${GREEN}╚════██║██╔══╝  ██║╚██╗██║██╔═══╝ ██╔══██║██║    ██║     ██║     ██║"
echo -e "${GREEN}███████║███████╗██║ ╚████║██║     ██║  ██║██║    ╚██████╗███████╗██║"
echo -e "${GREEN}╚══════╝╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚═════╝╚══════╝╚═╝${NC}"
echo -e ""


CHOICE='Plugin'

if [ "$1" == "" ]; then
    CHOICE=$(whiptail --ok-button Next  --title "Choose option" --backtitle "SENPAI.CODES 🦉" --radiolist "Choose" 20 40 15 \
    "Plugin" "" ON \
    "Theme" "" OFF \
    "Help" "" OFF \
    "New Website" "" OFF \
    3>&1 1>&2 2>&3)
else
    if [ "$1" == '-p' ]; then
    CHOICE='Plugin'
    elif [ "$1" = '-t' ]; then
    CHOICE='Theme'
    elif [ "$1" = '-h' ]; then
    CHOICE='Help'
    elif [ "$1" = '-help' ]; then
    CHOICE='Help'
    elif [ "$1" == 'install' ]; then
    CHOICE='New Website'
    elif [ "$1" == 'uninstall' ]; then
    CHOICE='uninstall-wp'
    elif [ "$1" == 'start' ]; then
    CHOICE='start-lamp'
    elif [ "$1" == 'stop' ]; then
    CHOICE='stop-lamp'
    fi
fi

#if [ "$CHOICE" == 'Plugin' ]; then
#internal_senpai_plugin_gen
#el


if [ "$CHOICE" == 'Theme' ]; then
internal_senpai_theme_gen
elif [ "$CHOICE" == 'New Website' ]; then
destroy_scroll_area #<- remove progress bar
#internal_senpai_wp_install $2
internal_senpai_wp_install
elif [ "$CHOICE" == 'uninstall-wp' ]; then
destroy_scroll_area #<- remove progress bar
internal_senpai_wp_uninstall $2
elif [ "$CHOICE" == 'Help' ]; then
destroy_scroll_area #<- remove progress bar
internal_senpai_display_help
elif [ "$CHOICE" == 'start-lamp' ]; then
destroy_scroll_area #<- remove progress bar
internal_senpai_start
destroy_scroll_area #<- remove progress bar
elif [ "$CHOICE" == 'stop-lamp' ]; then
internal_senpai_stop
fi




}