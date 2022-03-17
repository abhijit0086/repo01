echo "Removing old docker packages..."
echo
sudo apt purge docker* containerd* -y
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo rm -rf /var/lib/docker 
sudo rm -r /etc/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo rm -rf /usr/bin/docker-compose
echo
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt-get update -y
echo "Docker removed successfully"