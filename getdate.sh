#!/bin/bash

# TODO: 
# 0. append new file location to manage_list.dat
#    - edit file on vim
#    - if to use w(write) command
#    - save "pwd" to manage_list
# 1. run script on bash is loaded
#    - start bash shell
# 2. manage_list read
# 3. check date
#    - check nowDate, listDate
# 4. select backup / remove
# 5. move files
# 6. remove or manage files
for elem in $(ls); do
  echo $elem
  elemD=`date -r $elem "+%Y%m%d"`
  nowD=`date "+%Y%m%d"`
  if [ $elemD -eq $nowD ]; then
	echo "ok";
  fi
done
