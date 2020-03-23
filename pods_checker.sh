#!/bin/bash
#kubectl get ns
#read -p "What is the namespace? " nsvar
#echo "$nsvar"
#sleep 1
#clear
echo "Listing the current directory YAML files... "
ls -la $PWD | grep -i .yaml
read -p "What is the name of the .yaml file to be deployed?: " yaml
echo $yaml
echo "Grabbing the name of the namespace from the provided YAML file... "
sleep 1
nsvar=`cat $yaml | grep -i namespace: | awk '{ print $2 }'`
#echo "$yaml"
echo "$nsvar"
#clear
#Name of the type: Deployment or Pod
echo "Grabbing the type of deployment/pod...: "
sleep 1
appvar=`cat $yaml | grep -i kind: | awk '{ print $2 }'`
appvar=${appvar,,}
echo $appvar
#Name of the Deployment or Pod
echo "Grabbing the name of the deployment/pod...: "
sleep 1
namevar=`cat $yaml | grep -i name: | head -n 01 | awk '{ print $2 }'`
echo "namevar"
sleep 1
echo "Done. Moving onto the next steps...: "
clear

deploy () {
#  return 55
  #while [[ $1 -eq "1" || "2" ]]; do
  while true; do
    exists=`kubectl get $2 -n $1 | grep -i $3 | awk '{ print $1 }'`
    #kubectl get deployments -n $1 | grep -i $2 | awk '{ print $1 }'
    if [[ $exists == $3 ]]; then
      echo "$3 Already Exists, Deleting Previous $2 & Creating a New One..."
      kubectl delete $2 -n $1 $3 && kubectl create -f $4
      break
    else [[ $exists != $3 ]];
      echo "$3 does not Exist, Will Create $2..."
      kubectl create -f $2 $4
      break
    #else
      #echo "There is something wrong... Please check configuration. "
      #pod $nsvar $podvar $deppod $file
      #continue
   fi
 done
}

#deploy $deppod $nsvar $depvar $file
deploy $nsvar $appvar $namevar $yaml

#exists2=`kubectl get deployments -n $nsvar | grep -i $1 | awk '{ print $1 }'`

#while true; do
#read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" deppod
#if [[ $appvar == "deployment" ]]; then
  #kubectl get deployments -n $nsvar
  #break
#elif [[ $appvar == "pod" ]]; then
  #kubectl get pods -n $nsvar
  #break
#else
#  echo "Please press a "1" or a "2"...: "
  #echo "Something is wrong. Please check script configuration... "
  #clear
  #continue
#fi
#done

#deppod () {
#i=$1
#while true;
#for i in {1..2}
#do
# if [[ $1 -eq "1" ]]; then
#kubectl get deployments -n $2
#exists=`kubectl get deployments -n $nsvar | grep -i .. | awk '{ print $1 }'`
#exists=`kubectl get deployments -n $nsvar | grep -i $appvar | awk '{ print $1 }'`
#read -p "Please enter the name of the deployment: " depvar
#break
#elif [[ $1 -eq "2" ]]; then
#kubectl get pods -n $2
#exists=`kubectl get pods -n $nsvar | grep -i .. | awk '{ print $1 }'`
#exists=`kubectl get deployments -n $nsvar | grep -i $appvar | awk '{ print $1 }'`
#read -p "Please enter the name of the pod: " podvar
#break
#else
  #echo "Please Enter a "1" for a Deployment or a "2" for a Pod" #$(deppod)
  #continue
#fi
#done
#}

#deppod $deppod $nsvar

#pod () {
  #exists=`kubectl get pods -n $1 | grep -i $2 | awk '{ print $1 }'`
  #while [[ $3 == "2" ]]; do
    #if [[ $exists == $2 ]]; then
      #echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
      #kubectl delete pod $2 -n $1 && kubectl create -f $4 -n $1
    #elif [[ $exists != $2 ]]; then
      #echo "Deployment does not Exist, Will Create Deployment..."
      #kubectl create -f pod $4 -n $1
    #else
      #echo "Improper Value - Restarting the Script... " $(deploy)
#   fi
#done
#}

#pod $nsvar $podvar $deppod $file


#while true; do
#read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" $1
#while [[ "$1" -eq "1" ]]; do
#read -p "What is the name of the Deployment? " $2
#exists=`kubectl get pods -n $nsvar | grep -i $1 | awk '{ print $1 }'`
#file=`source "$PWD"/"$yaml"`
#if [[ $exists =~ '^'$2'*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f deployment $file -n $nsvar
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE>
#  kubectl delete pod $exists -n $nsvar && kubectl create -f $file -n $nsvar
#fi




#while [[ "$1" -eq "1" | "2" ]]; do
#  read -p "What is the name of the Deployment? " $2
#  if [[ $exists =~ '^'$1'*' ]]; then
#    echo "Pod does not Exist, Will Create Pod..."
#    kubectl create -f deployment $file -n $nsvar
#  else
#    echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#    kubectl delete deployment $2 -n <NAMESPACE>
#    kubectl delete pod $exists -n $nsvar && kubectl create -f $file -n $nsvar
#  fi
#done



#case $1 in
#
#    1)
#    read -p "What is the name of the Deployment? " $2
#    ;;
#
#  Romania | Moldova)
#    echo -n "Romanian"
#    ;;
#
#  Italy | "San Marino" | Switzerland | "Vatican City")
#    echo -n "Italian"
#    ;;
#
#  *)
#    echo -n "unknown"
#    ;;
#esac

#exists=`kubectl get pods -n $nsvar | grep -i  | awk '{ print $1 }'`
#read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" deppod

#deploy () {
#  read -p "If it is a '<DEPLOYMENT>' press '[1]' for a '<POD>' press '[2]'" deppod
#  while [[ "$deppod" -eq "1" ]]; do
#  read -p "What is the name of the Deployment? " $2
#  exists=`kubectl get pods -n $nsvar | grep -i $1 | awk '{ print $1 }'`
#  file=`source "$PWD"/"$3"`
#  if [[ $exists =~ '^'$2'*' ]]; then
#    echo "Pod does not Exist, Will Create Pod..."
#    kubectl create -f deployment $file -n $nsvar
#  else
#    echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#    kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE>
#    kubectl delete pod $exists -n $nsvar && kubectl create -f $file -n $nsvar
#  fi
#done
#}


#read -p "What is the pod or deployment name?"
#OR
#./04_deployment_install.sh

#THIS SCRIPT IS USED TO CHECK IF YOUR POD IS CURRENTLY RUNNING

#MODIFY ACCORDINGLY TO NEEDS OF DEPLOYMENT OR POD SETUP

#FIRST CHECK IF POD EXISTS AND IS RUNNING
#exists=`kubectl get pods -n <NAMESPACE> | grep -i <POD_NAME> | awk '{ print $1 }'`

#FOR DEPLOYMENTS, COMMENT THE ABOVE LINE AND UNCOMMENT THE BELOW:
#exists=`kubectl get deployment -n <NAMESPACE> | grep -i <DEPLOYMENT> | awk '{ print $1 }'`

#if [ "$pod_exists" != "jenkins" ]
#if [[ ! $pod_exists =~ ^(jenkins*)$ ]]; then
#if [[ ! $pod_exists =~ /jenkins.*/g ]]; then
#if [[ $pod_exists =~ '^jenkins*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#else
#  echo "Pod Already Exists, Deleting Previous Pod..."
#  kubectl delete pod $pod_exists -n jenkins
#fi
#if [[ $exists =~ '^<POD_NAME>*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f <APPLICATION>-deployment.yaml -n <NAMESPACE>
  #OR
  #./04_deployment_install.sh
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete deployment <DEPLOYMENT> -n <NAMESPACE>
#  kubectl delete pod $exists -n <NAMESPACE> && kubectl create -f <APPLICATION>-deployment.yaml -n <NAMESPACE>
#fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export pod_exists=$pod_exists

#POD SETUP
#pod_exists=`kubectl get pods -n <NAMESPACE> | grep -i <POD_NAME> | awk '{ print $1 }'`
#if [[ $pod_exists =~ '^<POD_NAME>*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f <APPLICATION_POD_DEPLOY>.yaml
  #OR
  #./pods_install.sh
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete pod $pod_exists -n <NAMESPACE> && kubectl create -f <APPLICATION_POD_DEPLOY>.yaml
#fi

#IF DESIRED FOR ENVIVONMENT VARIABLES, IF, SAY, PIPELINING, UNCOMMENT:
#export pod_exists=$pod_exists
