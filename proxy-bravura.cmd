@ECHO OFF

SET proxy=http://proxy.bravurasolutions.local:3128/

SETX http_proxy "%proxy%"
SETX https_proxy "%proxy%"
SETX ftp_proxy "%proxy%"
SETX no_proxy "127.0.0.1,localhost,bravurasolutions.local"

git config --global --replace-all http.proxy %proxy%
git config --global --replace-all https.proxy %proxy%

