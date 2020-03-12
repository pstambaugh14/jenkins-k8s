#!/bin/bash
pvcvar=kubectl get pvc -n jenkins |grep -i jenk | awk '{ print $ 1}'
#if [[ $pvcvar =~ '^jenk*' ]]; then
if [[ "$nsvar" != 'jenkins' ]]; then 
  echo "PersistentVolumeClaim does not Exist, Will Create PersistentVolumeClaim..."
  kubectl create -f jenkins-PVC.yaml
else
  echo "PersistentVolumeClaim already exists... exiting"
  break
fi

export pvcvar=$pvcvar
