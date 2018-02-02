echo "apt update..."
sudo apt -qq update
echo "✔ update done!"

sudo apt -qq install curl zsh git
echo "✔ base packeges are installed"

git pull origin master
echo "dotfiles are uptodate"

ln -sf $(pwd)/bashrc ~/.bashrc
echo "✔ zsh as default shell"

# Run ZSH Automatically
chsh -s /usr/bin/zsh

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "✔ oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "✔ .zshrc symlinked"

ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"

mkdir -p ~/.config

rm -f ~/c
ln -sf /mnt/c ~/c
rm -f ~/projects
ln -sf /mnt/c/Projects ~/projects
rm -f ~/downloads
ln -sf /mnt/c/Users/trqnw/Downloads ~/downloads
rm -f ~/pictures
ln -sf /mnt/c/Users/trqnwr/Pictures ~/pictures
ln -sf /mnt/e/Workspace/ ~/dev
ln -sf /mnt/e/Workspace/Personal\ Dashboard/ ~/pd
echo "✔ alias for windows folders"

sudo apt -qq install nodejs
sudo apt -qq install npm
sudo apt -qq install python-pip
echo "✔ apt dev tools installed"

sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt -qq install php7.1 php7.1-mbstring php7.1-xml
echo "✔ php installed"

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo "✔ installed composer"

cp ~/.dotfiles/.hyper.js ~/c/Users/trqnw/
echo "✔ copied .hyper.js to home"
