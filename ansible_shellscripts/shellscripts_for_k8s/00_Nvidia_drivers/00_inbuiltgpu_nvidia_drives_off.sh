# Note:- run this script only on systems which has inbuilt gpu
# for assembled systems pls run manual commands.

echo "Install the kernel headers and development packages for the currently running kernel"
sudo apt-get install linux-headers-$(uname -r)

echo "Setup the CUDA network repository and ensure packages on the CUDA network repository have priority over the Canonical repository"
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g') \
   && wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin \
   && sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600

echo "Install the CUDA repository GPG key:"
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub \
   && echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list

echo "Update the apt repository cache and install the driver using the cuda-drivers meta-package"
sudo apt-get update \
   && sudo apt-get -y install cuda-drivers --no-install-recommends
