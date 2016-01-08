#!/bin/bash

# check file already exists in manage_list
filename=`pwd`'/'$1
result=`sed -n "\,$filename,p" ~/TOORM/manage_list.dat`

echo $'\n''[TOORM: new file !!!]'
if [ -z $result ]; then
    echo -n '[TOORM: manage this file? (y/n)] '
    read option
fi