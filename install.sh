#!/bin/bash
#ansible-playbook -vvvv playbook.yml
#eval $(minikube docker-env)
./01-create-ns-jenkins.sh
./02-create-volume-jenkins.sh
./03-create-PVC-jenkins.sh
./04-create-deployment-jenkins.sh
./05-create-service-jenkins.sh
./06-create-SA-jenkins.sh
#./environment
kubectl rollout status deployment.v1.apps/jenkins-deployment -n jenkins && ./jenks_service_connect.sh && ./jenks_init_pw.sh
