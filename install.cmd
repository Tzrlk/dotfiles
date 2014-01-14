@ECHO OFF

ECHO Installing git config files to %HOME%.
DEL /Q "%HOME%\.gitconfig" "%HOME%\.gitignore"
MKLINK /H "%HOME%\.gitconfig" "git\gitconfig"
MKLINK /H "%HOME%\.gitignore" "git\gitignore"

ECHO Installing vim config files to %HOME%
DEL /Q "%HOME%\.vimrc"
MKLINK /H "%HOME%\.vimrc" "vim\vimrc"
