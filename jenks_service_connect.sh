#!/bin/bash
echo "Getting the Jenkins accessible IP address... "
hostip=`kubectl get pods -n jenkins -o yaml | grep -i hostip | awk '{ print $2 }'`
echo "$hostip is the IP address of the Jenkins service."
echo ""
echo "Getting the Jenkins accessible Port... "
serviceport=`kubectl get service -n jenkins -o json |grep -i nodePort | awk '{ print $ 2 }' | sed 's/\,//g' | head -n 01`
echo "$serviceport is the port used by Jenkins service."
echo ""
url="http://$hostip:$serviceport"
echo "Access $url to visit your Jenkins instance!"
echo ""
echo ""

#sleep 5

#ADD HERE - WHEN POD IS AVAILABLE, EXECUTE:
#podvar=`kubectl get pods -n jenkins | awk '{ print $ 1}' |grep -i jenkins`
#kubectl rollout status deployment.v1.apps/jenkins-deployment -n jenkins
#kubectl get rs -w -n jenkins


read -n1 -sp "Would you like to open Jenkins in your default browser? Press 'y' for 'Yes', 'n' for 'No'... [y,n]" browseyesno
echo ""


while true;
do
  if [[ ! $browseyesno =~ ^(y|n)$ ]]; then
  read -n1 -sp "Please press Y/y to open a browser session, or N/n to exit, or ctrl+c to exit..." browseyesno
  elif [[ $browseyesno = "y" ]]; then
    xdg-open $url
      break
  elif [[ $browseyesno = "n" ]]; then
    clear && echo "To access the Jenkins instance please visit: $url"
    break
  else
    continue
  fi
done



#while [ $browseyesno = "y" ] || [ $browseyesno = "n" ]
#while [ $browseyesno = "y" ]
#do
#  if [ ${browseyesno,,} = "y" ]; then
#     xdg-open $url
#  elif [ ${browseyesno,,} = "n" ]; then
#     clear && echo "Exiting... To access the Jenkins instance please visit: $url"
#     break
#  fi
#     echo "Please Press 'Y' or 'N'... or 'ctrl+c' to exit..." && ./service_connect.sh
#done

#until [ $browseyesno != "y" ] || [ $browseyesno != "n" ]
#do
#  echo "Please Press 'Y' or 'N'... or 'ctrl+c' to exit..."
#while [ $browseyesno = "y" ] || [ $browseyesno = "n" ]
#while [ $browseyesno != "y" ] || [ $browseyesno != "n" ]; do
  #if [ $browseyesno != "y" ] || [ $browseyesno != "n" ];
#    unset $browseyesno &&
#    read -p "Please Press 'Y' or 'N'... or 'ctrl+c' to exit..." browseyesno
#    continue
#  if [ $browseyesno = "n" ]; then
#    clear && echo "Exiting... To access the Jenkins instance please visit: $url"
#    break
#  elif [ $browseyesno = "y" ]; then
#    clear && echo "Opening k8s Jenkins in your favorite browser!..." && xdg-open $url &&
#    break
#  fi
#done

#if [ $browseyesno = "y" ];
#then
#  xdg-open $url
#fi

#if [ $browseyesno = "n" ];
#then
#  echo "To access the Jenkins instance please visit: $url"
#fi

#if [[ ! $browseyesno =~ ^(NORTEL|NEC|CISCO)$ ]]; then
#  echo "Phone type must be nortel, cisco or nec."
#fi

#for




#echo "input yes or no"
#read a
#if [ ${browseyesno,,} = "yes" ] || [ ${browseyesno,,} = "y" ];
#then
#  xdg-open $url
#elif [ ${browseyesno,,} = "no" ] || [ ${browseyesno,,} = "n" ];
#then
#  echo "To access the Jenkins instance please visit: $url"
#else
#    echo "Please Press 'Y' or 'N'... " &&
#fi

#case $browseyesno in
#  y|Y) echo "Opening default Browser to $url" && xdg-open $url ;;
#  n|N) clear && echo "Open to Browser Declined. To access the Jenkins URL please open: $url in your favorite browser. " ;;
#  *) echo "Please Press Y/y or N/n or press ctrl+c to exit... " && case $browseyesno in ;;
#esac
