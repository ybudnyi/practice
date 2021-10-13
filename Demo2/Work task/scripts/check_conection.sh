#!/bin/bash
ANSWEAR=$(curl -I 10.26.0.144:3000 | head -n1 | cut  -d " " -f 2)
OK_ANSW=200
if [ $OK_ANSW == $ANSWEAR ]; then
echo "SITE IS WORKING"
exit 0
else
echo "SERVICE DON'T WORK"
exit 1
fi
