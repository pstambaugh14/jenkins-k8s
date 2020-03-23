#!/bin/bash
#ansible-playbook -vvvv playbook.yml
#eval $(minikube docker-env)
echo "Checking to see if namespace Jenkins exists already and deploying if not..."
./01-create-ns-jenkins.sh
echo "Checking to see if persistent volume for Jenkins exists already and will leave it if so, create one if not..."
./02-create-volume-jenkins.sh
echo "Checking to see if persistent volume claim for Jenkins exists already and will leave it if so, create one if not..."
./03-create-PVC-jenkins.sh
echo "Checking to see if pods and deployments already exist for and will delete the previous if so, create new ones either way."
./04-create-deployment-jenkins.sh
echo "Creating Service for Jenkins if they don't already exist..."
./05-create-service-jenkins.sh
echo "Creating Service Accounts for Jenkins if they don't already exist..."
./06-create-SA-jenkins.sh
#clear
echo "Executing Post-Installation Scripts..."
sleep 3
#./environment
kubectl rollout status deployment.v1.apps/jenkins-deployment -n jenkins && sleep 1 && ./jenks_init_pw.sh
sleep 3
echo "Executing Validation scripts..."
./jenks_service_connect.sh
