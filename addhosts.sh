#! /bin/bash

ansihosts=/etc/ansible/hosts
docql=`docker ps -ql`
docqlip=`docker inspect --format ' {{ .NetworkSettings.IPAddress }} ' $docql`

grep $docqlip $ansihosts > /dev/null
    if [ $? -eq 0 ] ;then
        echo "$docqlip"
        echo "The hosts has already been described!"
        exit 1
    fi

echo "$docqlip" >> $ansihosts
    if [ $? -eq 0 ] ;then
        echo "$docqlip"
        echo "+Success! hosts added"
    fi
