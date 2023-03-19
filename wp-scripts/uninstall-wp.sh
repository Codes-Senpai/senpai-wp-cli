#! /bin/bash

# Include the config file
source ~/senpai-wp-cli/wp-scripts/config.sh


function internal_senpai_wp_uninstall() {

if [ $# -ne 1 ]; then
    echo $0: usage: Installation name
    exit 1
fi

DEST=$1

read -p "Are you sure you want to delete the files and DB for '$DEST' [Yes,yes]?" -n 1 -r
echo    # Move to new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

    echo 'Deleting files...'

    # Delete files
    rm -rf $SITE_PATH/$DEST/

    # Delete the database.
    DB_NAME=$(echo $DEST | sed -e 's/-/_/g')
    echo "Deleting database $DB_NAME..."

    mysql -u$DB_USER -p$DB_PASS -e"DROP DATABASE $DB_NAME"


    #show helper MSG
    echo ""
    echo ""
    echo 'WordPress deleted successfully.'
fi



}