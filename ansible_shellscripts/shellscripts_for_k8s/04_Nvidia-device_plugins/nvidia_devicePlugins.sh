# Note:- run script only after installing kubernetes cluster and helm.

# below command is from k8s official documentation.
# link:- https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/#deploying-nvidia-gpu-device-plugin


kubectl create -f https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml


############################################
### Run below script only if above fails ###
############################################

# echo "Install NVIDIA Device Plugin"
# echo "The preferred method to deploy the device plugin is as a daemonset using helm"
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
#    && chmod 700 get_helm.sh \
#    && ./get_helm.sh

# echo "Add the nvidia-device-plugin helm repository:"
# helm repo add nvdp https://nvidia.github.io/k8s-device-plugin \
#    && helm repo update

# echo "Deploy the device plugin:"
# helm install --generate-name nvdp/nvidia-device-plugin

