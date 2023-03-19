#! /bin/bash



function internal_senpai_stop() {
sudo service apache2 stop
sudo service mysql stop
}


function internal_senpai_start() {
sudo service apache2 start
sudo service mysql start
}
