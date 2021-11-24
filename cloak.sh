#!/bin/bash
# File: cloak.sh
# Purpose: to make files and folders hidden or shown in OS X's Desktop, Finder, and Spotlight
# Author: Jason Campisi
# Date: 11/23/2021
# License: GPL 2 or higher

declare -r NAME="Cloak"
declare -r VERSION="0.5.0"

option=$1
FILE=$2

 function fileCheck {
   if [ ! -n "$FILE" ]; then
      echo " $NAME Error - File or folder name is not set!"
      exit 1;
   elif [ ! -e $FILE ]; then
      echo " $NAME Error - The location of '$FILE' does not exist!"
      exit 1;
   fi
 }

 if [ -z "$option" ]; then #if option is not set
    option="-h"
 fi

 case $option in
    -h|--help)
        echo "Usage: $NAME <option> /location/to/folder"
        echo " "
        echo "$NAME any file/folder from Finder and Spotlight on your Mac"
        echo "-c --cloak  |- location from Finder and Spotlight"
        echo "-u --uncloak  |- location from Finder and Spotlight"
        echo "-s --show  |- show hidden system files"
        echo "-i --invisible  |- hide your system files"
        echo "-v --version"
        echo "-h --help"
        echo " "
        ;;
    -u|--uncloak)
        fileCheck
        echo " Uncloaking $FILE ..."
        chflags -H -R nohidden "$FILE"
        echo " Adding $FILE location to Spotlight's index..."
        mdimport $FILE
        defaults write com.apple.finder AppleShowAllFiles YES
        killall -KILL Finder
        ;; 
    -c|--cloak)
        fileCheck
        echo " Cloaking $FILE ..."
    	chflags -H -R hidden "$FILE"
    	echo " Removing $FILE location from Spotlight's index..."
    	defaults write com.apple.finder AppleShowAllFiles NO
    	killall -KILL Finder
    	mdutil $FILE >/dev/null
        ;;
    -s|--show)
        echo " Showing hidden system files"
        defaults write com.apple.finder AppleShowAllFiles YES
        killall -KILL Finder
        ;;
    -i|--invisible)
    	echo " Hiding system files"
    	defaults write com.apple.finder AppleShowAllFiles NO
    	killall -KILL Finder
    	;;
    -v|--version)
        echo " $NAME version: $VERSION"
        echo " System requirements: Mac OSX.5 Leopard or higher"
    	;;
 esac

exit 0
