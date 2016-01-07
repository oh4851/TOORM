#!/bin/bash

# TODO: Doing
# 0. append new file location to manage_list.dat
#    - edit file on vim
#    - if to use w(write) command
#    - save "pwd" to manage_list
# 1. run script on bash is loaded
#    - start bash shell
# 4. select backup / remove
# 5. move files
# 6. remove or manage files
# TODO: Done
# 2. read file location list from 'manage_list.dat'
# 3. check date difference

# get Now date in seconds
nowD=`date "+%Y%m%d"`
nowD=`date -d $nowD "+%s"`

for elem in $(cat manage_list.dat); do
  echo $elem

  # get Element create/modify date in seconds
  elemD=`date -r $elem "+%Y%m%d"`
  elemD=`date -d $elemD "+%s"`

  # get Date Difference in days
  diff="$((($nowD-$elemD)/(60*60*24)))"
  echo $diff

  # check date over
  if [ $elemD -eq $nowD ]; then
    # not over
	echo "ok";
  else
    # over
    echo "no";
  fi
done
