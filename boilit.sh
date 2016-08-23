#!/bin/bash

# bouilit v0.0.2

# Description:
# Bash script for initializing a HTML5 ★ BOILERPLATE 
# in directory given by first commandline argument

# Example:
# bash ./boilit.sh -d=MyFirstBoilerPlate

# Dependencies: curl, wget , unzip

boilitDirectory="/home/lasbian/downloads/boilit"

function getNUnzip {
	if [[ $# -eq 0 ]] ; then
		echo "+++++++++++++++++++++++++++++++++++++++++"
	    echo "boilit need a destination for it's delicious."
	    echo "This is defined by using the -d argument. Example -d MyFirstBoilerPlate"
		echo "+++++++++++++++++++++++++++++++++++++++++"
	    exit 0
	else

		if [ ! -d $1 ]; then

			(latestBoilerPlate=`curl -s https://github.com/h5bp/html5-boilerplate/releases/ | grep .zip | head -n 1 | cut -d '"' -f 2`;
			wget -q https://github.com/$latestBoilerPlate -O ./boilerPlate.zip
			unzip -q ./boilerPlate.zip -d $1) & spinner
			rm ./boilerPlate.zip;

		else
		  	echo "+++++ FAIL: DIRECTORY ALREADY EXISTS +++++"
		  	exit 0

		fi


	fi
}

spinner()
{
	i=0
    local pid=$!
    local delay=0.2
    local spinstr='+ L + O + A + D + I + N + G'
        	# printf "**********"

    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    	i=$(($i + 1))
        local temp=${spinstr#?}
		printf "%c" "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
		if test $i -gt 41
		then
        	i=0
        	printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
		fi
    done
    printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
}


 
while getopts ":d:p:s:" opt; do

  case $opt in
  	d)
		if [ $OPTARG = "-p" ]; then
		    getNUnzip
		else
			DESTINATION=$OPTARG
		fi
		;;

    p)
      	PAN=$OPTARG
      	;;

    s)
      	SPICE=$OPTARG
      	;;

    \?)
      	echo "Invalid option: -$OPTARG" >&2
      	exit 1
      	;;
    :)
      	echo "Option -$OPTARG requires an argument." >&2
      	exit 1
      	;;
  esac
done

echo "";
echo "++++++++++++++ LET's BOILIT ++++++++++++++";
sleep 0.2;
echo "++ SHOPPING: LATEST HTML5 ★ BOILERPLATE ++";
sleep 0.2;
echo "+++++++ COOKING: DOWNLOAD AND UNZIP ++++++";
sleep 0.2;
getNUnzip ${DESTINATION} &&

if [ -n "$SPICE" ]; then
	# echo ${SPICE} &
	echo "+++ POWER TO BOWER: INSTALLING ANGULAR +++";
	bower -s install angularjs --config.cwd=${DESTINATION} & spinner &&

	# find template

	angularTemplate=$boilitDirectory'/angularStarter.html'
	cp $angularTemplate ${DESTINATION}/index.html

fi &&

if [ -n "$PAN" ]; then
	exec ${PAN} ${DESTINATION}&
fi &&



echo "++++++++ SERVING: DINNER's READY +++++++++";
echo "";

exit 0