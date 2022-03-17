## install only after docker is installed & docker.json file is updated as required(cpu/gpu)
sudo swapoff -a

echo "Update the apt package index and install packages needed to use the Kubernetes apt repository:"
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

echo "Download the Google Cloud public signing key:"
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "Add the Kubernetes apt repository:"
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo "Update apt package index, install kubelet, kubeadm and kubectl, and pin their version:"
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

echo "Please run init script (02_init_k8s.sh) to initialize the kubernetes"
