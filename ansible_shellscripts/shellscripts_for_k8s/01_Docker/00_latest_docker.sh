# download and install latest docker
echo "installing latest docker version"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "start & enable docker service"
sudo systemctl start docker
sudo systemctl enable docker
echo
echo "Docker(latest) installation successfull"
