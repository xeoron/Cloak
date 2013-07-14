#!/bin/sh -e
#Author: Jason Campisi
#Date: 6/30/2013
#version 0.2.2
#Released under the GPL v2 or higher
NAME="cloak"
EXT="sh"
FILE="$NAME.$EXT"
echo "$FILE installer:";

 echo " Checking if '$FILE' exists in the current folder..."
   if [ ! -n "$FILE" ]; then
      echo " $NAME.$EXT Error - File name is not set!"
      exit 1;
   elif [ ! -e "$FILE" ]; then
      echo " Error - The location of '$NAME.$EXT' does not exist!"
      exit 1;
   fi
 echo " ...found!";
 
echo " Setting file to executable...";
chmod +x ./$FILE

echo " Checking if you have the clearance to install this ...";
if [ "$(whoami)" != 'root' ]; then
	echo " You do not have permission to install './$FILE'";
	echo " ->You must be a root user.";
	echo " ->Try instead: sudo $0";
	exit 1;
else
	echo " Root access granted for $0";	
fi

echo " Installing $NAME to /usr/bin/ ...";
cp ./$FILE /usr/bin/$NAME
echo " Setup complete."
echo "Testing install with this command\n>$NAME --version";
$NAME --version