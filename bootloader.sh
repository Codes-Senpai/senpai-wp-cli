#! /bin/bash



#source ~/senpai-wp-cli/plugin_gen.sh TODO impliment this in future
source ~/senpai-wp-cli/theme_gen.sh


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
    CHOICE=$(whiptail --ok-button Next  --title "Choose option" --backtitle "SENPAI-CODES WP CLI" --radiolist "Choose" 20 40 15 \
    "Plugin" "" ON \
    "Theme" "" OFF \
    3>&1 1>&2 2>&3)
else
    if [ "$1" == '-p' ]; then
    CHOICE='Plugin'
    elif [ "$1" = '-t' ]; then
    CHOICE='Theme'
    elif [ "$1" == '-ct' ]; then
    CHOICE='Child Theme'
    elif [ "$1" == 'install' ]; then
    destroy_scroll_area #<- remove progress bar
    CHOICE='install-wp'
    elif [ "$1" == 'uninstall' ]; then
    destroy_scroll_area #<- remove progress bar
    CHOICE='uninstall-wp'
    elif [ "$1" == 'start' ]; then
    destroy_scroll_area #<- remove progress bar
    CHOICE='start-lamp'
    elif [ "$1" == 'stop' ]; then
    destroy_scroll_area #<- remove progress bar
    CHOICE='stop-lamp'
    fi
fi

if [ "$CHOICE" == 'Plugin' ]; then
internal_senpai_plugin_gen
elif [ "$CHOICE" == 'Theme' ]; then
internal_senpai_theme_gen
elif [ "$CHOICE" == 'install-wp' ]; then
internal_senpai_wp_install $2
elif [ "$CHOICE" == 'uninstall-wp' ]; then
internal_senpai_wp_uninstall $2
elif [ "$CHOICE" == 'start-lamp' ]; then
internal_senpai_start
elif [ "$CHOICE" == 'stop-lamp' ]; then
internal_senpai_stop
fi


}