#!/bin/bash
# File: cloak.sh
# Purpose: to make files and folders hidden or shown in OS X's Desktop, Finder, and Spotlight
# Author: Jason Campisi
# Date: 6/23/2013
# License: GPL 2 or higher
declare -r NAME="Cloak"
declare -r VERSION="0.2.2"

option=""
FILE=$2

 if [ ! -e $FILE  ]; then
    echo " $NAME Error - this location does not exist: $2"
    exit 1;
 else 
	option=$1
 fi

 case $option in
    -h|--help)
        echo "Usage: $NAME <option> /location/to/folder"
        echo " "
        echo "$NAME any file/folder from Finder and Spotlight on your Mac"
        echo "-c --cloak location from Finder and Spotlight"
        echo "-u --uncloak location from Finder and Spotlight"
        echo "-v --version"
        echo "-h --help"
        echo " "
        ;;
    -u|--uncloak)
        echo " Uncloaking $2 ..."
        chflags -H -R nohidden "$2"
        echo " Adding $2 location to Spotlight's index..."
        mdimport $FILE
        ;; 
    -c|--cloak)
        echo " Cloaking $2 ..."
    	chflags -H -R hidden "$2"
    	echo " Removing $2 location from Spotlight's index..."
    	mdutil $FILE >/dev/null
        ;;
    -v|--version)
        echo " $NAME version: $VERSION"
        echo " System requirements: Mac OSX.5 Leopard or higher"
    	;;
 esac

exit 0