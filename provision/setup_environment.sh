#!/bin/bash

echo "===================================================="
echo "Provisioning virtual machine..."
echo "===================================================="

# some packages to install
sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install gfortran
sudo apt-get -y install tcsh
sudo apt-get -y install zip
sudo apt-get -y install m4
sudo apt-get -y install build-essential


