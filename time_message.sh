#!/bin/bash

hour=$(date +'%H')

if [ "$hour" -ge 6 ] && [ "$hour" -lt 12 ]; then
    echo "Good Morning!"
elif [ "$hour" -ge 13 ] && [ "$hour" -le 14 ]; then
    echo "It's Lunch Time!"
elif [ "$hour" -ge 14 ] && [ "$hour" -lt 17 ]; then
    echo "Good Evening!"
elif [ "$hour" -ge 18 ] && [ "$hour" -le 20 ]; then
    echo "Good Night!"
else
    echo "Late Night!"
fi

