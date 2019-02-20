echo "apt update..."
sudo apt -y update && apt -y upgrade
echo "✔ update done!"

sudo apt -y install curl zsh git vim
echo "✔ to make sure base packeges are installed"

git pull origin master
echo "dotfiles are uptodate"

ln -sf ~/.dotfiles/bashrc ~/.bashrc
echo "✔ zsh as default shell"

# Run ZSH Automatically
chsh -s /usr/bin/zsh

# install oh-my-zsh
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "✔ oh my zsh configured!"

ln -sf ~/.dotfiles/zshrc ~/.zshrc
echo "✔ .zshrc symlinked"

ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
echo "✔ .gitconfig symlinked"

mkdir -p ~/.config

rm -f ~/c
ln -sf /mnt/c ~/c
ln -sf /mnt/d/Workspace/ ~/dev
echo "✔ alias for windows folders"

cp ~/.dotfiles/.hyper.js ~/c/Users/trqnw/
echo "✔ copied .hyper.js to home"
