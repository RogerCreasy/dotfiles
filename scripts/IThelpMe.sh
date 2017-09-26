#!/bin/bash

# monitor.sh - Monitors a web page for changes
# sends a PushBullet push alert on change every 10 min

PBTOKEN="o.J0HOv9FH9VSJeTC6zGfjR6UcK2qbgOmG"
URL="http://containergraphics.com/cgi-bin/ithelpme/showlog.pl"
 
for (( ; ; )); do
    mv new.html old.html 2> /dev/null
    curl $URL -L --compressed -s > new.html
    DIFF_OUTPUT="$(diff new.html old.html)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then
        curl -u $PBTOKEN: https://api.pushbullet.com/v2/pushes -d type=note -d title="Site Changed" -d body="Visit it here $URL"
        sleep 60
    fi
done
