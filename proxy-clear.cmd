@ECHO OFF

git config --global --unset-all http.proxy
git config --global --unset-all https.proxy

CALL npm config -g delete proxy
CALL npm config -g delete https-proxy

SETX http_proxy ""
SETX https_proxy ""
SETX ftp_proxy ""

