<div style="text-align: right">GCP-searxngSearx is a free and open-source metasearch engine. It aggregates results from more than 70 search engines and allows users to search the web anonymously. It is written in Python and is designed to be lightweight and easily extensible. Users can customize their search experience by selecting different search engines, themes, and other settings. Searx can also be self-hosted, which means that you can run your own instance of the search engine on your own server. This gives you more control over your data and privacy.</div>


###Installation process:
```bash
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
```
