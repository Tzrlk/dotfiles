@ECHO OFF

ECHO Installing git config files to %USERPROFILE%.
DEL /Q "%USERPROFILE%\.gitconfig" "%USERPROFILE%\.gitignore"
MKLINK /H "%USERPROFILE%\.gitconfig" "git\gitconfig"
MKLINK /H "%USERPROFILE%\.gitignore" "git\gitignore"
ECHO .

ECHO Installing vim config files to %USERPROFILE%
DEL /Q "%USERPROFILE%\.vimrc"
MKLINK /H "%USERPROFILE%\.vimrc" "vim\vimrc"
ECHO .

ECHO Removing and re-creating vimfiles directory.
RMDIR /Q /S "%USERPROFILE%\vimfiles"
MKDIR "%USERPROFILE%\vimfiles"
ECHO .

ECHO Creating autoload directory and downloading pathogen.
MKDIR "%USERPROFILE%\vimfiles\autoload"
curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim > "%USERPROFILE%\vimfiles\autoload\pathogen.vim"
ECHO .

ECHO Creating bundle directory.
MKDIR "%USERPROFILE%\vimfiles\bundle"
ECHO .

