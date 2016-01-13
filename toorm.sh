#!/bin/bash

# TODO: Doing
# 0. make command option on this program
#     - add {filename}(absolute path / just file name)
#       > regist file location(path) to manage_list.dat
#     - rm {filename}(absolute path / just file name)
#       > remove file location from manage_list.dat
#     - show
#       > show limit date diff and managed file list
#     - limit {new limit}
#       > change limit date
# 1. auto run script when bash is loaded

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
    echo -n '(Diff: '$diff')] >> '
    if [ $diff -gt $LIMITDIFF ]; then
        echo 'OVER'
        return 0
    fi
    echo 'OK'
    return 1
}

# manage file with option function
# param: $1=file location, $2=option(r/e/n)
function manageFile(){
    local location=$1
    local option=$2
    if [ $option = 'r' ]; then
        echo "    * Move to .remove directory and Except from list"
        mv $location ~/TOORM/.remove/
        sed -i "\,$location,d" ~/TOORM/.manage_list.dat
    elif [ $option = 'e' ]; then
        echo "    * Does not manage this file anymore, Except from list"
        sed -i "\,$location,d" ~/TOORM/.manage_list.dat
    elif [ $option = 'n' ]; then
        echo "    * Do nothing this time, Manage next time"
    fi
    # remove file location from 'manage_list.dat'
}

echo '#############################################'
echo '#                                           #'
echo '#   LLLLL    LLL     LLL    LLLL    L   L   #'
echo '#     L     L   L   L   L   L   L   LL LL   #'
echo '#     L     L   L   L   L   LLLL    L L L   #'
echo '#     L     L   L   L   L   L  L    L L L   #'
echo '#     L      LLL     LLL    L   L   L L L   #'
echo '#                                           #'
echo '#     - Version : 0.2.2                     #'
echo '#     - Author  : oh4851 (Hyeok Oh)         #'
echo '#                                           #'
echo '#############################################'$'\n'

# load config file
echo '[TOORM: config value Loading...]'
source ~/TOORM/.toorm.cfg

# get Now date in seconds
nowD=$(getDateInSeconds)

echo '[TOORM: manage_list Reading...]'$'\n'
for elem in $(cat ~/TOORM/.manage_list.dat); do
    echo -n '[TOORM: '$elem' -- '

    # get Element create/modify date in seconds
    elemD=$(getDateInSeconds $elem)

    # check date over
    if isDateOver $nowD $elemD; then
        # choose, how to operating about time over file
        while :; do
            echo -n '  > Choose Remove(r) / ExceptList(e) / NextTime(n): '
            read option
            if [ -z $option ]; then
                echo '    * invalid input, please input [r], [e], [n]'
                continue
            fi
            if [ $option != 'r' ] && [ $option != 'e' ] && [ $option != 'n' ]; then
                echo '    * invalid input, please input [r], [e]. [n]'
            else
                manageFile $elem $option
                break
            fi
        done
    fi
done

echo ''
# remove files in ~/TOORM/remove/
echo '[TOORM: remove all files in ~/TOORM/.remove]'
ls -a --color=auto --show-control-chars ~/TOORM/.remove/
rm -rf ~/TOORM/.remove/*

echo $'\n''[TOORM: program end... good bye~]'

