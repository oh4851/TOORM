#!/bin/bash

# check file already exists in manage_list
filename=`realpath $1`
result=`sed -n "\,$filename,p" ~/TOORM/manage_list.dat`

if [ -z $result ]; then
    echo $'\n''[TOORM: new file !!!]'
    echo -n '[TOORM: manage this file? (y/n)] '
    read option
    if [ $option = 'y' ]; then
        echo "yes"
    else
        echo "no"
    fi
fi
