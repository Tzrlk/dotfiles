#!/bin/bash

export DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/`dirname $0`

echo '+ Updating bash config'
rm -f ~/.bashrc
cp $DIR/bash/bashrc ~/.bashrc

if [ -e /sdcard/Android ]; then
	cat $DIR/bash/bashrc_android >> ~/.bashrc
fi

echo '+ Updating vim config'
rm -rf ~/.vimrc ~/.vim
cp $DIR/vim/vimrc ~/.vimrc

echo '+ Making sure pathogen is set up right.'

(cd ~ && git clone git@github.com:tpope/vim-pathogen.git .vim)

if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
	echo 'Something went wrong setting up pathogen.'
	return 0
fi

echo '+ Preparing plugins directory'
rm -rf ~/.vim/bundle
mkdir ~/.vim/bundle

echo '+ Downloading plugins'
(cd ~/.vim/bundle && git clone git@github.com:digitaltoad/vim-jade.git)
(cd ~/.vim/bundle && git clone git@github.com:pangloss/vim-javascript.git)
(cd ~/.vim/bundle && git clone git@github.com:tpope/vim-markdown.git)
(cd ~/.vim/bundle && git clone git@github.com:dagwieers/asciidoc-vim.git)

echo '+ Updating git config'
rm -f ~/.gitconfig ~/.gitignore
cp $DIR/git/gitconfig ~/.gitconfig
cp $DIR/git/gitignore ~/.gitignore

