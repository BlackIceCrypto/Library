#!/bin/bash


cd $HOME
# Set VARS
GO_VER="1.22.8"
GO_LINK="https://golang.org/dl/go$GO_VER.linux-amd64.tar.gz"

# Download archive
wget "$GO_LINK"

# Delete old previos version
sudo rm -rf /usr/local/go

# Extract GoLang archive
sudo tar -C /usr/local -xzf "go$GO_VER.linux-amd64.tar.gz"

# Add GoLang PATH to .bashrc
echo "" >> ~/.bashrc
echo "# GoLang PATH" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/go/bin:~/go/bin" >> ~/.bashrc


source $HOME/.bashrc

mkdir -p ~/go/bin