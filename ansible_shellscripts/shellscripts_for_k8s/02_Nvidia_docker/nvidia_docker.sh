# Note:- run this script only after install Docker.

echo "Install NVIDIA Container Toolkit"
echo "Setup the stable repository and the GPG key:"
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

echo "Install the NVIDIA runtime packages (and their dependencies)"
sudo apt-get update \
   && sudo apt-get install -y nvidia-docker2


echo "updating /etc/docker/docker.json file as recommended by nvidia documentation"
cat <<EOF | sudo tee /etc/docker/daemon.json

{
    "default-runtime": "nvidia",
    "runtimes": { 
        "nvidia": { 
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "exec-opts": ["native.cgroupdriver=systemd"],
    "log-driver": "json-file",
    "log-opts": {
      "max-size": "100m"
    },
    "storage-driver": "overlay2"
}

EOF


echo "Restart Docker"
sudo systemctl restart docker

​echo "Tested by running a base CUDA container:"
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

