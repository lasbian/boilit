#!/bin/bash

# bouilit v0.0.1

# Description:
# Bash script for initializing a HTML5 ★ BOILERPLATE 
# in directory given by first commandline argument

# Example:
# bash ./boilit.sh MyFirstBoilerPlate

# Dependencies: curl, wget , unzip

echo "+++ GETTING LATEST HTML5 ★ BOILERPLATE +++" &&

latestBoilerPlate=`curl -s https://github.com/h5bp/html5-boilerplate/releases/ | grep .zip | head -n 1 | cut -d '"' -f 2` &&

echo "+++++++ STARTING DOWNLOAD AND UNZIP ++++++"  &&

wget https://github.com/$latestBoilerPlate -O ./boilerPlate.zip &&
unzip ./boilerPlate.zip -d $1 &&

echo "++++++++++++++ DONE WORKING ++++++++++++++"
echo "Project destination:"`pwd`"/"$1
echo "++++++++++++++++++ END +++++++++++++++++++"

exit 0