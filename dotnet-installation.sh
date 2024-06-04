#!/bin/bash

mkdir -p $HOME/dotnet
read -p "Enter dotnet zip file: " dotnetTarFile
echo "Yohave enter file name: " $dotnetTarFile
tar zxf $dotnetTarFile -C $HOME/dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
source ~/.bashrc
dotnet --version
sleep 2
mkdir -p /usr/local/share/dotnet
tar zxf $dotnetTarFile -C /usr/local/share/dotnet
echo 'export PATH="$PATH:/usr/local/share/dotnet"' >> /etc/profile.d/dotnet.sh

chmod -R a+rX /usr/local/share/dotnet
dotnet --version

touch /var/lib/jenkins/.bashrc
echo 'export PATH="$PATH:/usr/local/share/dotnet"' >> /var/lib/jenkins/.bashrc
source /var/lib/jenkins/.bashrc
dotnet --version
