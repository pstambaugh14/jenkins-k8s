#!/bin/bash
#ansible-playbook -vvvv playbook.yml
eval $(minikube docker-env)
./01-create-ns-jenkins.sh
./02-create-volume-jenkins.sh
./03-create-PVC-jenkins.sh
./04-create-deployment-jenkins.sh
./05-create-service-jenkins.sh
./06-create-SA-jenkins.sh
./jenks_service_connect.sh


#echo "Your initial setup admin password is located in the jenkins pod at: /mnt/vda1/jenkins/secrets/initialAdminPassword"
podvar=`kubectl get pods -n jenkins | grep -i jenkins-deployment | awk '{ print $1 }'`
echo $podvar
kubectl exec -it $podvar -n jenkins /bin/bash
passvar=`cat /var/jenkins_home/secrets/initialAdminPassword`
echo "'$passvar' is your first login admin password for Jenkins"

#export passvar=$passvar
