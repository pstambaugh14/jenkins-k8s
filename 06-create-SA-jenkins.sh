#!/bin/bash
savar=`kubectl -n kube-system get sa |grep -i jenkins`
if [[ $savar =~ '^jenk*' ]]; then
  echo "Service Account does not Exist, Will Create Service Account..."
  kubectl -n kube-system create sa jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:default
else
  echo "Service Account already exists... exiting"
  break
fi

export savar=$savar
