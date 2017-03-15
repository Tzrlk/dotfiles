@ECHO OFF

git config --global --unset-all http.proxy
git config --global --unset-all https.proxy

SETX http_proxy ""
SETX https_proxy ""
SETX ftp_proxy ""
SETX no_proxy "127.0.0.1,localhost"

