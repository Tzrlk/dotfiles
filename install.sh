#!/bin/bash

# Set up bash
rm -f ~/.bashrc
cp bash/bashrc ~/.bashrc

# Set up vim
rm -rf ~/.vimrc ~/.vim
cp vim/vimrc ~/.vimrc
mkdir -p ~/.vim/autoload
sudo apt-get -qq install curl --yes
curl -Sso ~/.vim/autoload/pathogen.vim \
	https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Set up vim plugins
rm -rf ~/.vim/bundle
mkdir ~/.vim/bundle
(cd ~/.vim/bundle && git clone git://github.com/digitaltoad/vim-jade.git)
(cd ~/.vim/bundle && git clone https://github.com/pangloss/vim-javascript.git)

# Set up git
rm -f ~/.gitconfig ~/.gitignore
cp git/gitconfig ~/.gitconfig
cp git/gitignore ~/.gitignore
