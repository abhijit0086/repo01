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