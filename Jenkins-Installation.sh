#!/bin/bash

apt update
apt install fontconfig openjdk-17-jre
java -version

echo "Java installations is commpleted..."

wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update
apt-get install jenkins
systemctl status jenkins

echo "Jenkins is installed successfully..."

echo "Your jenkins admin password isgiven below..."

cat /var/lib/jenkins/secrets/initialAdminPassword
