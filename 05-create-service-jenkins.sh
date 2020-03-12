#!/bin/bash
servvar=`kubectl get service -n jenkins | grep -i jenkins | awk '{ print $1 }'`

#if [[ $servvar =~ '^jenk*' ]]; then
if [[ "$nsvar" != 'jenkins' ]]; then 
  echo "Service does not Exist, Will Create Service..."
  kubectl create -f jenkins-service.yaml
else
  echo "Service already exists... exiting"
  break
fi

export servvar=$servvar
