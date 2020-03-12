#!/bin/bash
#ansible-playbook -vvvv playbook.yml

./01-create-ns-jenkins.sh
./02-create-volume-jenkins.sh
./03-create-PVC-jenkins.sh
./04-create-deployment-jenkins.sh
./05-create-service-jenkins.sh
./06-create-SA-jenkins.sh

#echo "Your initial setup admin password is located in the jenkins pod at: /mnt/vda1/jenkins/secrets/initialAdminPassword"
#minikube ssh "docker ps -a" > dockerpsa.tmp
