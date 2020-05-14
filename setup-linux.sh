#!/bin/bash

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   eoan
   stable"
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt update
sudo apt install -y stow git neovim nodejs gcc g++ make yarn ruby ruby-dev \
  python3-pip apt-transport-https ca-certificates curl gnupg-agent \
  software-properties-common docker-ce docker-ce-cli containerd.io \
  golang go-md2man latexmk stow neovim

sudo gem install neovim
yarn global add neovim
pip3 install neovim-remote

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc

mkdir -p $HOME/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

stow zsh
stow nvim

vim +'PlugInstall --sync' +qa
cd $HOME/.config/nvim/plugged
for i in coc*;
	do (cd $i && yarn);
done
