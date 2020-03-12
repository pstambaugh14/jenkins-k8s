#!/bin/bash
nsvar=`kubectl get namespace |grep -i jenkins | awk '{ print $1 }'`
echo $nsvar
#if [[ $nsvar =~ '^jenkins*' ]]; then
if [[ $nsvar != 'jenkins' ]]
then
  echo "Namespace does not Exist, Will Create Namespace..."
  kubectl create ns jenkins
else
  echo "Namespace already exists... exiting"
#  break
fi

export nsvar=$nsvar
