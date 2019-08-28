#!/bin/bash

az group delete --name jenkinsgroup -y
az group create --name jenkinsgroup
az vm create --resource-group jenkinsgroup --name jenkinsvm --image UbuntuLTS --generate-ssh-keys
az vm open-port --resource-group jenkinsgroup --name jenkinsvm --port 22 --priority 200
az vm open-port --resource-group jenkinsgroup --name jenkinsvm --port 8080 --priority 300
ip=$(az vm list-ip-addresses --resource-group jenkinsgroup --name jenkinsvm | jq -r '.[0].virtualMachine.network.publicIpAddresses[0].ipAddress')
ssh -o "StrictHostKeyChecking=no" ${ip} << EOF
sudo apt install git -y
git clone https://www.github.com/jordan-grindrod/scripts
cd ./scripts
chmod 777 get_jenkins.sh
./get_jenkins.sh
EOF
echo ${ip}
