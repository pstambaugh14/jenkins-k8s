#!/bin/bash
#echo "Your initial setup admin password is located in the jenkins pod at: /mnt/vda1/jenkins/secrets/initialAdminPassword"
podvar=`kubectl get pods -n jenkins | grep -i jenkins-deployment | awk '{ print $1 }'`
#echo $podvar
passvar=`kubectl exec $podvar -n jenkins cat /var/jenkins_home/secrets/initialAdminPassword`
#passvar=`cat /var/jenkins_home/secrets/initialAdminPassword`
echo "
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
'$passvar' is your first login admin password for Jenkins.  Please COPY this temporary password and PASTE it into the Jenkins initial setup wizard.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
#export passvar=$passvar


#ADD HERE - WHEN POD IS AVAILABLE, EXECUTE:
#podvar=`kubectl get pods -n jenkins | awk '{ print $ 1}' |grep -i jenkins`
#kubectl rollout status deployment.v1.apps/jenkins-deployment -n jenkins
#kubectl get rs -w -n jenkins
#kubectl rollout status deployment.v1.apps/jenkins-deployment -n jenkins
