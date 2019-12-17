source /home/ec2-user/.bash_profile
cd /home/ec2-user/master-server
npm install
git clone git@github.com:racerr-io/unity-bin.git | exit 0
cd unity-bin
git pull
cd ..
rm -rf ./static/WebGL/Build
ln -s "../../unity-bin/WebGL Client Build/Build" ./static/WebGL/Build