#!/bin/bash
# This file contains a script for preparing the environ,ent 
# for the third lab assignment (Spark) of  the Big Data class.
# Author: Gianluca Quercini
# Year : 2017 - 2018


cwd=$1
echo -e "\n******\n\nPreparing the environment...\nAuthor : Gianluca QUERCINI\nYear : 2017 - 2018\n\n******\n"
foxconfig=~/.mozilla/firefox/
pkill -f firefox
if [ ! -d $foxconfig ]; then
   firefox &
   sleep 3
   pkill -f firefox
   sleep 2
fi
cd $foxconfig
find . -maxdepth 1 -type d -name "*default" | \
  (while read s; do
     cd $s
     echo "user_pref(\"network.proxy.type\", 0);" >> prefs.js
   done
  )
cd $cwd
jupyter notebook --no-browser




