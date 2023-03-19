#! /bin/bash

# Includes your config file
source ~/senpai-wp-cli/wp-scripts/config.sh




function internal_senpai_wp_install() {

DEST=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "Website directory?" 8 39 --title "SenpaiCodes CLI" 3>&1 1>&2 2>&3)
WP_ADMIN_USER=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "admin user-name?" 8 39 "senpai-team" --title "SenpaiCodes CLI" 3>&1 1>&2 2>&3)
WP_ADMIN_EMAIL=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "admin email?" 8 39 "admin@senpai.codes" --title "SenpaiCodes CLI" 3>&1 1>&2 2>&3)
WP_ADMIN_PASSWORD=$(whiptail --inputbox --backtitle "SENPAI.CODES 🦉" "admin email?" 8 39 "changeme" --title "SenpaiCodes CLI" 3>&1 1>&2 2>&3)



CHOICE_PLUGIN=$(whiptail --ok-button Next  --title "Install default plugins?" --backtitle "SenpaiCodes CLI" --radiolist "Choose" 20 40 15 \
"Yes" "" ON \
"NO" "" OFF \
3>&1 1>&2 2>&3)

clear

#DEST=$1

# Create the database.
DB_NAME=$(echo $DEST | sed -e 's/-/_/g')
echo "Creating database $DB_NAME..."

mysql -u$DB_USER -p$DB_PASS -e"CREATE DATABASE $DB_NAME"

# Download WP Core.
wp core download --path=$SITE_PATH/$DEST

# Generate the wp-config.php file
wp core config --path=$SITE_PATH/$DEST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --extra-php <<PHP
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
define('WP_MEMORY_LIMIT', '1024M');
PHP

# Install the WordPress database. PROJECT_PATH
wp core install --skip-plugins --path=$SITE_PATH/$DEST --url=$BASE_URL/$DEST --title=$DEST --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
cd $SITE_PATH$DEST/wp-content/plugins

if [ "$CHOICE_PLUGIN" == 'Yes' ]; then
    # Install/remove plugins
    rm hello.php
    wp plugin install $PROJECT_PATH/advanced-custom-fields-pro.zip
    wp plugin install all-in-one-wp-migration
    wp plugin install limit-login-attempts-reloaded
    wp plugin install usagedd
    wp plugin install pexlechris-adminer
    wp plugin install server-ip-memory-usage
    wp plugin install wp-crontrol
    #wp plugin install login-ip-country-restriction
    wp plugin install $PROJECT_PATH/all-in-one-wp-migration-unlimited-extension.zip
    #wp plugin install query-monitor
    #wp plugin install debug-bar
    wp plugin install show-current-template
    wp plugin activate --all
    wp plugin deactivate akismet
fi

#show helper MSG
echo ""
echo "Website live at $BASE_URL/$DEST"
echo ""
echo "Website admin at $BASE_URL/$DEST/wp-admin"
echo ""
}
