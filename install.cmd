@ECHO OFF

ECHO Installing git config files to %GIT_HOME%.
DEL /Q "%GIT_HOME%\etc\gitconfig" "%GIT_HOME%\etc\gitignore"
MKLINK /H "%GIT_HOME%\etc\gitconfig" "git\gitconfig"
MKLINK /H "%GIT_HOME%\etc\gitignore" "git\gitignore"
