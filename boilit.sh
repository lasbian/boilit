#!/bin/bash

# bouilit v0.0.2

# Description:
# Bash script for initializing a HTML5 ★ BOILERPLATE 
# in directory given by first commandline argument

# Example:
# bash ./boilit.sh -d=MyFirstBoilerPlate

# Dependencies: curl, wget , unzip

function getNUnzip {
	if [[ $# -eq 0 ]] ; then
		echo "+++++++++++++++++++++++++++++++++++++++++"
	    echo "boilit need a destination for it's delicious."
	    echo "This is defined by using the -d or --destination argument. Example -d=MyFirstBoilerPlate"
		echo "+++++++++++++++++++++++++++++++++++++++++"
	    exit 0
	else
		latestBoilerPlate=`curl -s https://github.com/h5bp/html5-boilerplate/releases/ | grep .zip | head -n 1 | cut -d '"' -f 2`;
		wget https://github.com/$latestBoilerPlate -O ./boilerPlate.zip &&
		unzip ./boilerPlate.zip -d $1 &&
		rm ./boilerPlate.zip;
	fi
}

function postUnzip {
	# subl $1;
	case "$1" in
	    sublime|s)
	    subl $2;
	    shift # past argument=value
	    ;;
	    atom|a)
	    atom $2;
	    shift # past argument=value
	    ;;
	    *)
	            # unknown option
	    ;;
	esac

}

for i in "$@"
do
case $i in
    -d=*|--destination=*)
    DESTINATION="${i#*=}"
    shift # past argument=value
    ;;
    -p=*|--pan=*)
    PAN="${i#*=}"
    shift # past argument=value
    ;;
    *)
            # unknown option
    ;;
esac
done

echo "++ SHOPPING: LATEST HTML5 ★ BOILERPLATE ++";

echo "+++++++ COOKING: DOWNLOAD AND UNZIP ++++++";

# getNUnzip $1 &&
getNUnzip ${DESTINATION} &&
postUnzip ${PAN} ${DESTINATION}

echo "++++++++ SERVING: DINNER's READY +++++++++";

exit 0