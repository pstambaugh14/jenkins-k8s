# Jenkins K8S Deployment - https://github.com/pstambaugh14/jenkins-k8s

Basic Jenkins Deployment for Developers for Kubernetes/MiniKube

This project uses the following technologies:

- Google Kubernetes/Minikube
- Jenkins Docker image
- Docker
- Containerd
- Ansible
- YAML & BASH
- Linux

## Credits

- Please check: https://hub.docker.com/r/jenkins/jenkins AND
                https://github.com/jenkinsci/docker

# Jenkins Deployment Stack
- This is an all-in-one Ansible script for the seemless deployment of a single Jenkins instance running in a pod.

# New Goals:
- Clean up Code and Make more Universally configured.

-----------------------------------------------------------------------------------------------------------------------------

# Goal of This Project
To integrate Jenkins easily into a Kubernetes Cluster or MiniKube Cluster.


# Credits:
Patrick Stambaugh, Docker, DockerHub, Git, GitHub, Anible, Google/Alphabet Kubernetes, Minikube.

## License

Created by Patrick Stambaugh.
https://github.com/pstambaugh14/jenkins-k8s

## Configuration

Make any changes that are required or desired for your environment such as heap sizes, ports, ip addresses, etc.!

## Quick Start

## Starting the Deployment of a single Jenkins Deployment into Kubernetes or Minikube using Ansible:
ansible-playbook -vvvv playbook.yml
or
simply execute the install.sh script using ./install.sh


## Quick Start Reference - Docker Container will run the following on build and execution automatically:

```
Jenkins server runs on http://<hostIP>:30000 by default.
```
