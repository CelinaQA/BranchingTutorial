#! /bin/bash
sudo apt update
sudo apt install -y openjdk-8-jdk
sudo apt install -y maven

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
sudo apt install -y jenkins

sleep 5s
echo "Waiting for initial Admin Password"
sleep 15s
echo "Your initialAdminPassword is: $(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)"
