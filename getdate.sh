#!/bin/bash

# TODO: 
# 0. write to manage_list new file location
# 1. run script on bash is loaded
# 2. manage_list read
# 3. check date
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
