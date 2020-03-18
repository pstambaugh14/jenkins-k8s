#echo "Your initial setup admin password is located in the jenkins pod at: /mnt/vda1/jenkins/secrets/initialAdminPassword"
podvar=`kubectl get pods -n jenkins | grep -i jenkins-deployment | awk '{ print $1 }'`
echo $podvar
kubectl exec -it $podvar -n jenkins /bin/bash
sleep 2
cat /var/jenkins_home/secrets/initialAdminPassword
passvar=`cat /var/jenkins_home/secrets/initialAdminPassword`
echo "'$passvar' is your first login admin password for Jenkins"

export passvar=$passvar


#POSSIBLY CHANGE TO: kubectl exec "cat /var/jenkins_home/secrets/initialAdminPassword" $podvar -n jenkins
