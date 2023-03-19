#! /bin/bash


internal_senpai_display_help() {
    # taken from https://stackoverflow.com/users/4307337/vincent-stans
    echo "Usage: senpai [option...] {start|stop|install|uninstall}" >&2
    echo
    echo "   -h, -help                  Show this help dialog "
    echo "   -p                         Generate New Plugin [this need to run within web-root/wp-content/plugins ] "
    echo "   -t                         Generate New Theme [this need to run within web-root/wp-content/themes ] "
    echo "   install                    Create new wordpress website [settings entred interctivly ] "
    echo "   uninstall [website-name]   Remove wordpress website under localhost "
    echo
    # echo some stuff here for the -a or --add-options 
    #exit 0
}