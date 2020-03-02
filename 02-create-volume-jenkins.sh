#!/bin/bash
volvar=kubectl get pv |grep -i jenk | awk '{ print $ 1}'
if [[ $volvar =~ '^jenk*' ]]; then
  echo "Volume does not Exist, Will Create Volume..."
  kubectl create -f jenkins-volume.yaml
else
  echo "Volume already exists... moving on..."
  break
fi

export volvar=$volvar
