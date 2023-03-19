
                                                                                                                       

# Senpai Plugin CLI

```bash

███████╗███████╗███╗   ██╗██████╗  █████╗ ██╗ ██████╗ ██████╗ ██████╗ ███████╗███████╗
██╔════╝██╔════╝████╗  ██║██╔══██╗██╔══██╗██║██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝
███████╗█████╗  ██╔██╗ ██║██████╔╝███████║██║██║     ██║   ██║██║  ██║█████╗  ███████╗
╚════██║██╔══╝  ██║╚██╗██║██╔═══╝ ██╔══██║██║██║     ██║   ██║██║  ██║██╔══╝  ╚════██║
███████║███████╗██║ ╚████║██║     ██║  ██║██║╚██████╗╚██████╔╝██████╔╝███████╗███████║
╚══════╝╚══════╝╚═╝  ╚═══╝╚═╝     ╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝
                                                                                      
```



## Requirement

**This Software is compatible with bash and build using Ubuntu 22.04**

requirement  | minimum
------------- | -------------
PHP           | 8.0
Composer      | 2.0
Node          | 15.0.0
NPM           | 7.0.0


- Apache
```bash
    $ sudo apt update
    $ sudo apt install apache2
    $ sudo service apache2 start
```

- Disable UFW

```bash
    $ sudo ufw disable
```

- mysql
```bash
    $ sudo apt install mysql-server
    $ sudo service mysql start
    $ sudo mysql
        mysql > ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
        mysql > exit;
    $ sudo mysql_secure_installation
    $ N
    $ Y for the rest

```


- PHP 8.0
```bash
    $ sudo apt update
    $ sudo apt install software-properties-common
    $ sudo add-apt-repository ppa:ondrej/php
    $ sudo apt update
    $ sudo apt install php8.0 php8.0-common libapache2-mod-php8.0 php8.0-mysql php8.0-cli php8.0-dev php8.0-fpm php8.0-cgi php8.0-mysql php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imap php8.0-pspell php8.0-xml php8.0-imagick php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-redis php8.0-intl -y
```

- PHP Latest
```bash
    $ sudo apt install php php-common libapache2-mod-php php-mysql php-cli php-dev php-fpm php-cgi php-mysql php-xmlrpc php-curl php-gd php-pear php-imap php-pspell
```

- PHP Switch 8.1 to 8.0

```bash
    $ sudo a2dismod php8.1
    $ sudo a2enmod php8.0
    $ sudo update-alternatives --config php
    $ sudo service apache2 restart
```

- Additional config

```bash
    $ sudo a2enmod rewrite
    $ sudo nano  /etc/apache2/sites-available/000-default.conf 
        #add the following
        <Directory "/var/www/html">
            Options FollowSymLinks
            AllowOverride All
        </Directory>
        # CTRL+X to save
    $ sudo nano /etc/apache2/apache2.conf
        <Directory />
                Options FollowSymLinks
                AllowOverride None -> AllowOverride All
                Require all denied
        </Directory>
        #And
        <Directory /var/www/>
                Options Indexes FollowSymLinks
                AllowOverride None -> AllowOverride All
                Require all granted
        </Directory>
        # CTRL+X to save
    $ sudo nano /etc/apache2/envvars
        export APACHE_RUN_USER=www-data  -> export APACHE_RUN_USER=senpai
        export APACHE_RUN_GROUP=www-data -> export APACHE_RUN_GROUP=senpai
        # CTRL+X to save
    $ sudo chown -R senpai:senpai /var/www/html/
    $ sudo service apache2 restart
```


- sed
```bash 
    $ sudo apt-get install -y sed  
```
- composer
```bash
    $ sudo apt update
    $ sudo apt install php-cli unzip
    $ cd ~
    $ curl -sS https://getcomposer.org/installer -o composer-setup.php
    $ HASH=`curl -sS https://composer.github.io/installer.sig`
    $ php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    $ #expecter result "Installer verified"
    $ sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    $ composer -v
```
- WP-CLI
```bash
    $ cd ~
    $ curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    $ php wp-cli.phar --info
    $ chmod +x wp-cli.phar
    $ sudo mv wp-cli.phar /usr/local/bin/wp
    $ wp core version
```
- npm
```bash
    $ curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
    $ bash install_nvm.sh
    $ source ~/.profile
    $ nvm ls-remote
    $ nvm install -version-
    $ nvm use -version-
    $ node -v
    $ npm -v
```

## Installing senpai wp cli

```bash
    cd ~
    git clone git@github.com:Codes-Senpai/senpai-wp-cli.git
    cp ~/senpai-wp-cli/wp-scripts/example.config.sh ~/senpai-wp-cli/wp-scripts/config.sh
    nano ~/senpai-wp-cli/wp-scripts/config.sh
    #Set global settings to your system configurations
    nano  ~/senpai-wp-cli/wp-scripts/install-wp.sh
    #Change default installed plugins from WP directory or local plugins at PT directory
    echo '[ -f ~/senpai-wp-cli/bootloader.sh ] && . ~/senpai-wp-cli/bootloader.sh' >> ~/.bashrc 
    source ~/.bashrc
```
## Usage

- Create new plugin|theme boilerplate inspired by wppb.me
```bash
    $ cd web-root/wp-contents/plugins/ OR web-root/wp-contents/themes/
    $ senpai
```
- Add new WP Site
```bash
    $ senpai install site-name
```

- Remove WP Site
```bash
    $ senpai uninstall site-name
```

- Start/Stop Apache2 & Mysql
```bash
    $ senpai start
    $ senpai stop
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)