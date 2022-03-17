## NOte :- run this script only on assembled gpu.
# for inbuilt gpu system please run inbuiltgpu_nvidia_drivers.sh script.

echo "check drivers"
echo "$apt search nvidia-driver"

echo "installing required driver nvidia-driver-460"
sudo apt install nvidia-driver-460

