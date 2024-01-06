#! /bin/bash
source ~/senpai-wp-cli/progress.sh


internal_senpai_theme_gen() {
EMOJIS=(🥯 🦆 🦉 🥓 🦀 🍣 🍤 🍥 🥃 🥞 🤯 🤪 🤫 🤭 🐕 🦖 👾 🐉 🐓 🐋 🐌 🐢)
SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
enable_trapping #<- optional to clean up properly if user presses ctrl-c
setup_scroll_area #<- create empty progress bar
block_progress_bar 0 #<- turns the progress bar yellow to indicate some action is requested from the user

GREEN='\033[0;32m' #https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
NC='\033[0m' # No Color
#LGREEN = '\033[1;32m'
NC='\033[0m' 
if [[ $PWD != *wp-content/themes ]]; then
  RED='\033[0;31m'
  NC='\033[0m'
  echo -e "${RED}Please run this command from themes directory [web-root/wp-contents/themes]"
  echo -e "${NC}"
  destroy_scroll_area #<- remove progress bar
  exit 1;
fi

theme_name=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Theme Name?" 8 39 --title "SenpaiCodes Theme Generate" 3>&1 1>&2 2>&3)
theme_slug=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Theme Slug? (all lower-case with - seperator)" 8 39 --title "SenpaiCodes Theme Generate" 3>&1 1>&2 2>&3)
theme_uri=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Theme Uri?" 8 39 --title "SenpaiCodes Theme Generate" 3>&1 1>&2 2>&3)
theme_short_desc=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Theme short description?" 8 69 --title "SenpaiCodes Theme Generate" 3>&1 1>&2 2>&3)
theme_author_name=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Theme Author Name?" 8 39 --title "SenpaiCodes Theme Generate" 3>&1 1>&2 2>&3)
theme_author_email=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Theme Author Email?" 8 39 --title "SenpaiCodes Theme Generate" 3>&1 1>&2 2>&3)
theme_author_uri=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Theme Author Uri?" 8 39 --title "SenpaiCodes Theme Generate" 3>&1 1>&2 2>&3)

clear

target="$PWD/$theme_slug"

if test -f "$target"; then
    echo "$theme_slug exists."
    destroy_scroll_area #<- remove progress bar
    exit 1;
fi

cp -R ~/senpai-wp-cli/theme-name $target
draw_progress_bar 5

package_name=${theme_slug//-/_}

package_name_all_caps=${package_name^^}

TN=""
IFS='-' read -ra ADDR <<< "$theme_slug"
for i in "${ADDR[@]}"; do
    TN="${TN}_${i^}"
done
package_name_upper_case=${TN:1}

src_theme_name='THEME-NAME'
src_theme_name_pretty='THEME-NAME-PRETTY'
src_theme_author_name='AUTHOR-NAME'
src_theme_uri='THEME-URI'
src_theme_author_uri='AUTHOR-URI'
src_theme_author_email='AUTHOR-EMAIL'
src_theme_short_desc="THEME-SHORT-DESC"

echo -e "\033[40m Preparing Theme files... \033[0;37m"
#s:dog:log:g
find $target -type f -name "*" -print0 | while read -d $'\0' file
do
    echo "Generate $file"
    sed -i "s|$src_theme_name_pretty|$theme_name|g" $file
    sed -i "s|$src_theme_name|$theme_name|g" $file
    sed -i "s|$src_theme_short_desc|$theme_short_desc|g" $file
    sed -i "s|$src_theme_uri|$theme_uri|g" $file
    sed -i "s|$src_theme_author_name|$theme_author_name|g" $file
    sed -i "s|$src_theme_author_email|$theme_author_email|g" $file
    sed -i "s|$src_theme_author_uri|$theme_author_uri|g" $file    
    sed -i "s|theme-name|$theme_slug|g" $file
    sed -i "s|theme_name|$package_name|g" $file
    sed -i "s|THEME_NAME|$package_name_all_caps|g" $file
    sed -i "s|Theme_Name|$package_name_upper_case|g" $file
    if [ $file != ${file/theme-name/$theme_slug} ]
        then
        mv $file ${file/theme-name/$theme_slug}
    fi

    draw_progress_bar 10
done
cd $theme_slug

echo -e "\033[40m Setup Composer dependencies... \033[0;37m"

composer -q init --name "wp-senpai/$theme_slug" --author "$theme_author_name <$theme_author_email>" --description "Composer $theme_short_desc" 
composer -q install
composer -q require senpai/wp-senpai
draw_progress_bar 50

#cd admin 
echo -e "\033[40m Installing Node Admin dependencies... \033[0;37m"
#npm i
draw_progress_bar 55

echo -e "\033[40m Generating Admin JS & CSS files... \033[0;37m"
#npm run build:development
draw_progress_bar 60
#cd ..


echo -e "\033[40m Generating Block dependencies senpai-test... \033[0;37m"
##cd blocks/senpai-test
#npm install
#npm run build
draw_progress_bar 70
#cd ..


#cd public
echo -e "\033[40m Installing Node Public dependencies... \033[0;37m"
#npm install
draw_progress_bar 80

echo -e "\033[40m Generating Public JS & CSS files... \033[0;37m"
#npm run build:development
draw_progress_bar 90

#cd ..
draw_progress_bar 100

echo ""
echo -e "${NC}"
echo -e "\033[42m Dont Forget to run npm start inside admin & public for all modification to be applied \033[0;37m"
echo ""
echo -e "\033[1;92mHappy Coding. Senpai team $SELECTED_EMOJI\033[0;37m"
echo ""
destroy_scroll_area #<- remove progress bar

code .

}