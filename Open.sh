workedin=$(pwd)
cd ~/code/FAS # workpath

listaa() {
	su -c "pm list packages &>> apps.txt"
	sed -i -e 's/package://g' apps.txt
	APP=$(cat apps.txt | sed 's/\/.*//' | gum filter)
	# basic setup, prompt with a choice
	su -c dumpsys package | grep -Eo $(printf "^[[:space:]]+[0-9a-f]+[[:space:]]+%s/[^[:space:]]+" "${APP}") | grep -oE "[^[:space:]]+$" | grep . &>> activities.txt
	# save activities of all apps to a file
}

if [[ $1 == "" ]]
then
	listaa
	OPEN=$(cat activities.txt | gum filter)
	su -c am start --user 0 -n $OPEN
	echo $OPEN >> history
	rm -rf activities.txt 
	rm -rf apps.txt 
	# start, clean up, reset directory
	comp=y
fi

if [[ $1 == "-h" ]]
then
	if [[ $2 == "" ]]
	then
		su -c am start --user 0 -n $(cat history | gum filter)
		comp=y
	fi
	
	if [[ $2 == "clear" ]]
	then
		rm -rf history
		touch history
		comp=y
	fi
fi

if [[ $1 == "-s" ]]
then
	if [[ $2 == "" ]]
	then
		su -c am start --user 0 -n $(cat shortcuts | gum filter)
		comp=y
	fi

	if [[ $2 == "add" ]]
	then
		listaa
		cat activities.txt | grep $APP/ | gum filter >> shortcuts
		rm -rf activities.txt
		rm -rf apps.txt
		# start, clean up, reset directory
		comp=y
	fi
fi

if [[ $comp == "" ]]
then
	echo "AppLaunch: Wrong arguments / Code failure."
fi

cd $workedin
