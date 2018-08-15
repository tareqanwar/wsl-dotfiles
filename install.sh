echo "apt update..."
sudo apt -qq update
echo "✔ update done!"

sudo apt -qq install curl zsh git
echo "✔ base packeges are installed"

git pull origin master
echo "dotfiles are uptodate"

ln -sf $(pwd)/.dotfiles//bashrc ~/.bashrc
echo "✔ zsh as default shell"

# Run ZSH Automatically
chsh -s /usr/bin/zsh

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "✔ oh my zsh configured!"

ln -sf $(pwd)/.dotfiles//zshrc ~/.zshrc
echo "✔ .zshrc symlinked"

ln -sf $(pwd)/.dotfiles//gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"

mkdir -p ~/.config

rm -f ~/c
ln -sf /mnt/c ~/c
ln -sf /mnt/c/Users/trqnw/ ~/home
rm -f ~/projects
ln -sf /mnt/c/Projects ~/projects
rm -f ~/downloads
ln -sf /mnt/c/Users/trqnw/Downloads ~/downloads
rm -f ~/pictures
ln -sf /mnt/c/Users/trqnwr/Pictures ~/pictures
ln -sf /mnt/e/Workspace/ ~/dev
ln -sf /mnt/e/Workspace/Personal\ Dashboard/ ~/pd
echo "✔ alias for windows folders"

sudo apt -y install nodejs
sudo apt -y install npm
sudo npm install -g nodemon
echo "✔ installed nodejs, npm, nodemon"

apt-get install python-software-properties
echo "✔ installed install python-software-properties to be able to add external repo"

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt update
sudo apt -y install mongodb-org
echo "✔ installed mongodb"

echo "✔ staring lamp stack installation"

sudo apt install -y apache2 apache2-utils
systemctl status apache2
sudo systemctl start apache2
sudo systemctl enable apache2
apache2 -v
echo "✔ apache installed and enabled successfully"

sudo chown www-data:www-data /var/www/html/ -R
echo "✔ changed owner of the html folder to www-data"

sudo apt install mariadb-server mariadb-client
systemctl status mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb
echo "✔ mariadb installed and enabled successfully. but we will install mysql setting later"

sudo add-apt-repository ppa:ondrej/php
sudo apt update && apt upgrade
sudo apt install -y php7.2
sudo apt install -y php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml
echo "✔ php installed"

sudo a2enmod php7.2
sudo systemctl restart apache2
echo "✔ restarted apache"

php --version

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo "✔ installed composer"

cp ~/.dotfiles/.hyper.js ~/c/Users/trqnw/
echo "✔ copied .hyper.js to home"

sudo mysql_secure_installation
mariadb --version
echo "✔ mysql installation successful"

sudo systemctl restart apache2
echo "✔ restarted apache"
