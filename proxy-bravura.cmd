@ECHO OFF

git config --global --replace-all http.proxy http://auksquid2.bravurasolutions.local:3128
git config --global --replace-all https.proxy http://auksquid2.bravurasolutions.local:3128

CALL npm config -g set proxy http://auksquid2.bravurasolutions.local:3128/
CALL npm config -g set https-proxy http://auksquid2.bravurasolutions.local:3128/

SETX http_proxy http://auksquid2.bravurasolutions.local:3128/
SETX https_proxy http://auksquid2.bravurasolutions.local:3128/
SETX ftp_proxy http://auksquid2.bravurasolutions.local:3128/

