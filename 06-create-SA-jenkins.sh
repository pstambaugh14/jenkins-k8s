#!/bin/bash
#Across the entire cluster, grant the permissions in the 'cluster-admin' ClusterRole to a service account named “jenkins” in the namespaces “kube-system”, "default" & "jenkins":
savar=`kubectl -n kube-system get sa |grep -i jenkins`
if [[ $savar =~ '^jenk*' ]]; then
#if [[ "$nsvar" != 'jenkins' ]]; then
  echo "Service Account $savar does not Exist, Will Create Service Account $savar..."
  kubectl -n kube-system create sa jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=kube-system:jenkins
else
  echo "Service Account $savar already exists... exiting"
#  break
fi

savar2=`kubectl -n default get sa |grep -i jenkins`
if [[ $savar =~ '^jenk*' ]]; then
  echo "Service Account $savar2 does not Exist, Will Create Service Account $savar2..."
  kubectl -n default create sa jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=default:jenkins
else
  echo "Service Account $savar2 already exists... exiting"
fi

savar3=`kubectl -n jenkins get sa |grep -i jenkins`
if [[ $savar =~ '^jenk*' ]]; then
  echo "Service Account $savar3 does not Exist, Will Create Service Account $savar3..."
  kubectl -n jenkins create sa jenkins
  kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:jenkins
else
  echo "Service Account $savar3 already exists... exiting"
fi

export savar=$savar
export savar2=$savar2
export savar3=$savar3
