
myip=$(hostname -I | awk '{print $1}')
sudo kubeadm init --apiserver-advertise-address=$myip

# write output to file

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "install network plugin for k8s"
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

echo "please save the join command for future use to join the node."
echo "please join the nodes with join command"