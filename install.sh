#!/bin/sh

sudo cp /etc/hosts /etc/hosts.backup

[ -d /etc/hosts.d  ] || sudo mkdir /etc/hosts.d

sudo cp /etc/hosts /etc/hosts.d/hosts.conf

for i in "$@"
do
    file="/etc/hosts.d/$i.conf"
    if [ ! -f $file  ]; then
        echo "create file $file"
        echo "## $i HOSTS" > $file
    fi
done

