#!/bin/bash
cd
sudo apt install && sudo apt upgrade -y
sudo apt install docker.io -y
sudo apt install docker-compose -y
cd Downloads/
git clone https://github.com/searxng/searxng-docker.git
cd searxng-docker/
sed -i "s|ultrasecretkey|$(openssl rand -hex 32) |g" searxng/settings.yml
cd searxng/
rm settings.yml
cd
cd GCP-searxng
mv settings.yml ~/Downloads/searxng-docker/searxng
sudo docker-compose up -d
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
read Ngrok_ID
ngrok config add-authtoken $Ngrok_ID
ngrok http 8080
