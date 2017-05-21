#!/bin/bash -e

## Usage:
##   ssh-append-key.sh <key> <hosts>...
## 
## Arguments:
##   key		Either the contents of a public key, or a path to one.
##   hosts		The non-qualified hostname e.g. aklgit,
##	    		instead of aklgit.bravurasolutions.local
##

key="${1}"
shift

if [ -f "${key}" ]; then
	key="$( cat ${key} )"
fi

for host in "$@"; do
	ssh root@${host}.bravurasolutions.local <<-CMDS
		echo ${key} >> /root/.ssh/authorized_keys
	CMDS
done

