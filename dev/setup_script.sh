# curl -fsSL https://get.docker.com -o get-docker.sh
# sudo sh get-docker.sh
# docker run -it --rm -d -p 8080:80 --name web nginx


export PATH=$PATH:/usr/bin
sudo apt-get -q update
mkdir -p /var/www/html/
mkdir -p /var/www/html/healthcheck
sudo echo "healthcheck" | sudo tee /var/www/html/healthcheck/index.html > /dev/null
sudo echo "node $1" | sudo tee /var/www/html/index.html > /dev/null
sudo apt-get -q -y install nginx
