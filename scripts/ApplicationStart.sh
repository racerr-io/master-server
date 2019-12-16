source /home/ec2-user/.bash_profile
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000
pm2 start /home/ec2-user/master-server/dist/server.js --name "Racerr Master Server"
chmod +x "/home/ec2-user/master-server/unity-bin/Linux Server Build/Racerr.x86_64"
pm2 start "/home/ec2-user/master-server/unity-bin/Linux Server Build/Racerr.x86_64" --name "Racerr Game Server Instance"