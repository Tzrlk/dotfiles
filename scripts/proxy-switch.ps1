
$network = $args[0]
switch ($network) {

	"Bravura" {
		$proxy_http = "http://proxy.bravurasolutions.local:3128/"
		$proxy_https = $proxy_http
		$proxy_ftp = $proxy_http
		$proxy_exclude_win = "127.0.0.1; localhost; *.bravurasolutions.*"
		$proxy_exclude_nix = "127.0.0.1,localhost,bravurasolutions.local,bravurasolutions.com"
	}

	default {
		$proxy_http = null
		$proxy_https = null
		$proxy_ftp = null
		$proxy_exclude_win = null
		$proxy_exclude_nix = null
	}

}

#[Environment]::SetEnvironmentVariable("HTTP_PROXY", @proxy, [EnvironmentVariableTarget]::Machine)
#[Environment]::SetEnvironmentVariable("HTTPS_PROXY", @proxy_https, [EnvironmentVariableTarget]::Machine
#[Environment]::SetEnvironmentVariable("FTP_PROXY", @proxy_ftp, [EnvironmentVariableTarget]::Machine
#[Environment]::SetEnvironmentVariable("NO_PROXY", @proxy_exclude_win, [EnvironmentVariableTarget]::Machine

#$reg = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
#if ( $proxy_http != null ) {
#	Set-ItemProperty -Path $reg -Name .. -Value @proxy
#
#} else {
#	Remove-ItemProperty -Path $reg -Name ProxyServer
#}

#Restart-Service docker

