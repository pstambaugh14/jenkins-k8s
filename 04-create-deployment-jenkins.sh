#!/bin/bash
pod_exists=`kubectl get pods -n jenkins | grep -i jenkins | awk '{ print $1 }'`
echo $pod_exists
#if [[ $pod_exists =~ '^jenkins*' ]]; then
#if [[ "$nsvar" != 'jenkins' ]]; then
#if [[ "$pod_exists" =~ '^jenkins*' ]]; then
#then
#if [ "$pod_exists" =~ ^"[jenkins.*]$" ]
if ! [[ $pod_exists =~ jenkins* ]] ;
then
  echo "Pod does not Exist, Will Create Pods via Deployment..."
  kubectl create -f jenkins-deployment.yaml
else
  echo "Pod/Deployment Already Exists, Deleting Previous Pod & Creating a New One..."
  kubectl delete deployment jenkins-deployment -n jenkins && kubectl delete pod $pod_exists -n jenkins &&  kubectl create -f jenkins-deployment.yaml
fi

export pod_exists=$pod_exists


#if [[ $pod_exists =~ '^jenkins*' ]]; then
#  echo "Pod does not Exist, Will Create Pod..."
#  kubectl create -f jenkins-deployment.yaml
#else
#  echo "Pod Already Exists, Deleting Previous Pod & Creating a New One..."
#  kubectl delete deployment jenkins-deployment -n jenkins
#  kubectl delete pod $pod_exists -n jenkins && kubectl create -f jenkins-deployment.yaml
#fi
