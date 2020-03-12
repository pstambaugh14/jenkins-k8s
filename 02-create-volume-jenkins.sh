#!/bin/bash
minikube ssh "sudo mkdir -p /mnt/vda1/jenkins" &&
minikube ssh "sudo chown -R  docker:docker /mnt/vda1/jenkins/" &&
minikube ssh "sudo chmod 0755 -R /mnt/vda1/jenkins" &&
#mkdir -p /mnt/vda1/jenkins
#echo "Be Sure to Set Permissions to your /mnt/vda1/jenkins kubernetes/minikube Directory after installation!: 'sudo chown -R  docker:docker /mnt/vda1/jenkins/ && sudo chmod 0755 -R /mnt/vda1/jenkins'"
volvar=`kubectl get pv -n jenkins |grep -i jenk | awk '{ print $ 1}'`
#if [[ $volvar =~ '^jenk*' ]]; then
echo $volvar
if [[ $volvar != 'jenks-pv-volume' ]]
then
#if [[ "$nsvar" != 'jenkins' ]]; then
  echo "Volume does not Exist, Will Create Volume..."
  kubectl create -f jenkins-volume.yaml
else
  echo "Volume already exists... moving on..."
#  break
fi

export volvar=$volvar
