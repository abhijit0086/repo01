#!/bin/bash

echo "Installation for DOCKER "
echo
# echo "Removing old docker packages..."
# echo
# sudo apt purge docker* containerd* -y
# sudo apt-get remove docker docker-engine docker.io containerd runc -y
# #sudo rm -rf /var/lib/docker 
# sudo rm -r /etc/docker
# sudo groupdel docker
# sudo rm -rf /var/run/docker.sock
# sudo rm -rf /usr/bin/docker-compose
# echo
# sudo apt autoremove -y
sudo apt autoclean -y
sudo apt-get update -y
sudo update-ca-certificates
echo
sudo apt-get install  apt-transport-https  ca-certificates  curl gnupg lsb-release -y
echo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo
echo  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo
sudo apt-get update -y
echo
sudo apt-get install docker-ce=5:20.10.7~3-0~ubuntu-$(lsb_release -cs) docker-ce-cli=5:20.10.7~3-0~ubuntu-$(lsb_release -cs) containerd.io -y
sudo dpkg --configure -a
#sudo systemctl restart docker.service
echo
echo "Running <sudo docker run hello-world> command to verify docker is installed"
sudo docker run hello-world
echo
echo "Docker is installed"
echo "Adding docker in sudoers list to run docker commands without sudo"
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
echo
sudo systemctl show -p ActiveState --value docker.service
echo "You can check the docker service by :-"
echo "sudo systemctl status docker.service"
echo "Docker(20.10.7) installation successfull."
