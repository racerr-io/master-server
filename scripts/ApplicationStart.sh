sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000
pm2 start ./master-server/dist/server.js --name "Racerr Master Server"
pm2 start "./master-server/unity-bin/Linux Server Build/Racerr.x86_64" --name "Racerr Game Server Instance"