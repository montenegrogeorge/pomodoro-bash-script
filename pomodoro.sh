#!/bin/bash 
# A Basic Pomodoro Technique App

declare -i MINS=0
declare -i HOURS=0
declare -i TOTAL=0

function getTimeForCountdown {
	echo ""
	echo "Enter Hours: "
	read HOURS
	
	echo "Enter Mins : "
	read MINS
}


# Get Time from User or passed args
case ${#} in 
		0)
			getTimeForCountdown
			;;
	 	1)
			MINS=${1}
			;;
		2)
			HOURS=${1}
			MINS=${2}
			;;
esac

# Verify input is above 0 seconds 
if [[ $HOURS == 0 && $MINS == 0 ]]
	then 
	echo "Something went wrong try again"
	./$0

fi

# Run Timer 
echo ""
TOTAL=$((${MINS}*60+${HOURS}*60*60))


while [ $TOTAL -gt 0 ]; 
do
	echo -ne  ${TOTAL} "\r"
	let "TOTAL-=1"
	sleep 1
done

echo -n

# Timer Completed Animation
echo "Time Over !" 
echo "Good job"
echo ""

exit 
