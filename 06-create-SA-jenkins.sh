#!/bin/bash
savar=`kubectl -n kube-system get sa |grep -i jenkins`
if [[ $savar =~ '^jenk*' ]]; then
#if [[ "$nsvar" != 'jenkins' ]]; then
  echo "Service Account does not Exist, Will Create Service Account..."
  kubectl -n kube-system create sa jenkins
  kubectl -n default create sa jenkins
  kubectl -n jenkins create sa jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=kube-system:jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=default:jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:jenkins
else
  echo "Service Account already exists... exiting"
#  break
fi

export savar=$savar
