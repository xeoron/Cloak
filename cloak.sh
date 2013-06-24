#!/bin/bash
# File: cloak.sh
# Purpose: to make files and folders hidden or shown in OS X's Desktop, Finder, and Spotlight
# Author: Jason Campisi
# Date: 6/23/2013
# License: GPL 2 or higher

declare -r VERSION="0.2.1"

for arg in "$@"
do
   case $arg in
    -h|--help)
        echo "Usage: $0 <option> /location/to/folder"
        echo " "
        echo "Cloak any file/folder from Finder and Spotlight on your Mac"
        echo "-c --cloak location from Finder and Spotlight"
        echo "-u --uncloak location from Finder and Spotlight"
        echo "-v --version"
        echo "-h --help"
        echo " "
        exit 0
        ;;

    -u|--uncloak)
        echo " Uncloaking $2 ..."
        chflags -H -R nohidden "$2"
        echo " Adding $2 location to Spotlight's index..."
        mdimport $2
        exit 0
        ;; 
    -c|--cloak)
        echo " Cloaking $2 ..."
    	chflags -H -R hidden "$2"
    	echo " Removing $2 location from Spotlight's index..."
    	mdutil $2 >/dev/null
    	exit 0
        ;;
    -v|--version)
        echo " Cloak version: $VERSION"
        echo " System requirements: Mac OSX.5 Leopard or higher"
    	;;
   esac
done
exit 0