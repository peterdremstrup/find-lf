#!/bin/bash
wget https://puredata.info/downloads/pd-extended-0-43-3-on-raspberry-pi-raspbian-wheezy-armhf/releases/1.0/Pd-0.43.3-extended-20121004.deb 
dpkg -i Pd-0.43.3-extended-20121004.deb 


# Update
apt-get update
apt-get install -f -y git htop vim python3 python3-requests

# Install wireshark and other basics using all defaults
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy install wireless-tools firmware-atheros usbutils wireshark tshark hostapd

# Copy latest scan.py from the repo
wget https://raw.githubusercontent.com/peterdremstrup/find-lf/master/node/scan.py -O scan.py
wget https://raw.githubusercontent.com/peterdremstrup/find-lf/master/node/signal.pd -O signal.pd

# Generate SSH key
ssh-keygen -b 2048 -t rsa -f /home/pi/.ssh/id_rsa -q -N ""

git clone https://github.com/tbird20d/grabserial
cd grabserial
python setup.py install
