#!/bin/bash

# TODO: Doing
# 0. append new file location to 'manage_list.dat'
#    - edit file on vim
#    - if to use w(write) command
#    - save "pwd" to manage_list
# 1. run script on bash is loaded
#    - start bash shell
# 6. remove file location from 'manage_list.dat'
# 7. remove or manage files
# TODO: Done
# 2. read file location list from '~/.TOORM/manage_list.dat'
# 3. check date difference
# 4. choose manage / remove
# 5. move files

# get datetime in seconds function
# param: empty | $1=file location
# return: absolute seconds
function getDateInSeconds(){
    local input=$1
    if [ -z $input ]; then
        input=`date "+%Y%m%d"`
    else
        input=`date -r $input "+%Y%m%d"`
    fi
    echo `date -d $input "+%s"`
}

# get boolean of date is over
# param: $1=now date(sec), $2=element date(sec)
# return: 0=date over (0 is true case in shell script)
function isDateOver(){
    local diff="$((($1-$2)/(60*60*24)))"
    echo -n '[Datediff:' $diff'] >> '
    if [ $diff -gt 1 ]; then
        echo 'OVER'
        return 0
    fi
    echo 'OK'
    return 1
}

# move file to remove or manage directory function
# param: $1=file location, $2=option(r/m)
function moveFile(){
    local location=$1
    local option=$2
    if [ $option = 'r' ]; then
        echo "    * mv $location ~/.TOORM/remove/"
    elif [ $option = 'm' ]; then
        echo "    * mv $location ~/.TOORM/manage/"
    fi
#TODO: remove file location from 'manage_list.dat'
}

echo '#############################################'
echo '#                                           #'
echo '#   LLLLL    LLL     LLL    LLLL    L   L   #'
echo '#     L     L   L   L   L   L   L   LL LL   #'
echo '#     L     L   L   L   L   LLLL    L L L   #'
echo '#     L     L   L   L   L   L  L    L L L   #'
echo '#     L      LLL     LLL    L   L   L L L   #'
echo '#                                           #'
echo '#     - Version 0.1.2                       #'
echo '#     - author: oh4851 (Hyeok Oh)           #'
echo '#                                           #'
echo '#############################################'
echo ''

# get Now date in seconds
nowD=$(getDateInSeconds)

for elem in $(cat ~/.TOORM/manage_list.dat); do
  echo -n '[File:' $elem']'

  # get Element create/modify date in seconds
  elemD=$(getDateInSeconds $elem)

  # check date over
  if isDateOver $nowD $elemD; then
    # choose, how to operating about time over file
    while :; do
        echo -n '  > Choose Manage(m) / Remove(r): '
        read option
        if [ -z $option ]; then
            echo '    * invalid input, please input [m] or [r]'
            continue
        fi
        if [ $option != 'm' ] && [ $option != 'r' ]; then
            echo '    * invalid input, please input [m] or [r]'
        else
            moveFile $elem $option
            break
        fi
    done
  fi
done
