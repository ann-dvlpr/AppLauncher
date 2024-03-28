#!/bin/bash

# Set the working path
workedin=$(pwd)
cd ~/code/FAS # workpath

# Function to list all app packages
listaa() {
    su -c "pm list packages | sed 's/package://' > apps.txt"
    sed -i 's/\/.*//' apps.txt
    APP=$(cat apps.txt | gum filter)
    rm -f apps.txt
}

if [[ $1 == "" ]]; then
    listaa
    OPEN=$(cat activities.txt | grep ${APP}/ | gum filter)
    su -c am start --user 0 -n $OPEN
    echo $OPEN >> history
    comp=y
elif [[ $1 == "-h" ]]; then
    if [[ $2 == "" ]]; then
        su -c am start --user 0 -n $(cat history | gum filter)
        comp=y
    elif [[ $2 == "clear" ]]; then
        > history
        comp=y
    fi
elif [[ $1 == "-s" ]]; then
    if [[ $2 == "" ]]; then
        su -c am start --user 0 -n $(cat shortcuts | gum filter)
        comp=y
    elif [[ $2 == "add" ]]; then
        listaa
        cat activities.txt | gum filter >> shortcuts
        rm -f apps.txt
        comp=y
    fi
elif [[ $1 == "-d" ]]; then
    if [[ $2 == "activities" ]]; then
         rm -f activities.txt
         su -c dumpsys package | grep -Eo '^[[:space:]]+[0-9a-f]+[[:space:]]+.*' | grep -oE '[^[:space:]]+$' | grep . >> activities.txt
         comp=y
    elif [[ $2 == "history" ]]; then
          rm -rf history
          touch history
          comp=y
    fi      
fi          

if [[ $comp == "" ]]; then
    echo "AppLaunch: Wrong arguments / Code failure."
fi

# Reset working directory
cd $workedin
