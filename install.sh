#!/bin/bash

echo '+ Updating bash config'
rm -f ~/.bashrc
cp bash/bashrc ~/.bashrc

echo '+ Updating vim config'
rm -rf ~/.vimrc ~/.vim
cp vim/vimrc ~/.vimrc

echo '+ Making sure pathogen is set up right.'
if [ ! -e ~/.vim/autoload/pathogen.vim ]; then

	echo '+ Ensuring autoload directory exists'
	mkdir -p ~/.vim/autoload

	echo '+ Installing curl'
	sudo apt-get install curl --yes

	echo '+ Downloading pathogen'
	basepath=https://raw.githubusercontent.com
	repopath=$basepath/tpope/vim-pathogen/master
	filepath=$repopath/autoload/pathogen.vim
	curl -#So ~/.vim/autoload/pathogen.vim $filepath

	if [ ! -e ~/.vim/autoload/pathogen.vim ]; then
		echo 'Something went wrong setting up pathogen.'
		return 0
	fi
fi

echo '+ Preparing plugins directory'
rm -rf ~/.vim/bundle
mkdir ~/.vim/bundle

echo '+ Downloading plugins'
(cd ~/.vim/bundle && git clone git://github.com/digitaltoad/vim-jade.git)
(cd ~/.vim/bundle && git clone https://github.com/pangloss/vim-javascript.git)
(cd ~/.vim/bundle && git clone git@github.com:tpope/vim-markdown.git)
(cd ~/.vim/bundle && git clone git@github.com:dagwieers/asciidoc-vim.git)

echo '+ Updating git config'
rm -f ~/.gitconfig ~/.gitignore
cp git/gitconfig ~/.gitconfig
cp git/gitignore ~/.gitignore

