#! /bin/bash
echo "Install Virtual-Box"
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get install -y virtualbox virtualbox-ext-pack

echo "install kubernetes"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

echo "install minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.2/minikube-linux-amd64
chmod +x minikube && sudo mv minikube /usr/local/bin/
minikube start
kubectl api-versions

echo "forward port your virtual mchine"
# VBoxManage controlvm minikube natpf1 rule1,tcp,,8997,,30000

