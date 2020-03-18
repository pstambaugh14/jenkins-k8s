#!/bin/bash
#Script's purpose: To Gather and Set Environment Variables
echo "Getting the Jenkins accessible IP address... "
hostip=`kubectl get pods -n jenkins -o yaml | grep -i hostip | awk '{ print $2 }'`
echo "$hostip is the IP address of the Jenkins service."
export hostip=$hostip
echo ""
echo "Getting the Jenkins accessible Port... "
serviceport=`kubectl get service -n jenkins -o json |grep -i nodePort | awk '{ print $ 2 }' | sed 's/\,//g' | head -n 01`
echo "$serviceport is the port used by Jenkins service."
export serviceport=$serviceport
echo ""
url="http://$hostip:$serviceport"
export url=$url
echo "Access $url to visit your Jenkins instance!"
sleep 1
xdg-open $url
