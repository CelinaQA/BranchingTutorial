#!/usr/bin/env bash
sudo apt update
sudo apt install -y openjdk-8-jdk
sudo apt install -y maven

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
sudo apt install -y jenkins

sleep 5s
sudo chmod 777 /var/lib/jenkins/secrets/
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
