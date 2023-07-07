#! /bin/bash
#timesyncd attempts to reach out to ntp.ubuntu.com but hangs because it gets not response, this will speed up overall loadtime.
systemctl stop systemd-timesyncd
systemctl disable systemd-timesyncd


echo "begin proxy test" >> script.test
sudo apt update
sudo apt -y install ec2-instance-connect
sudo apt -y install tinyproxy
sudo cp /etc/tinyproxy/tinyproxy.conf /home/ubuntu
sudo echo "Allow 172.31.0.0/16" >> /home/ubuntu/tinyproxy.conf
sudo echo "BasicAuth tstark pssecrocks" >> /home/ubuntu/tinyproxy.conf
sudo echo "" >> /home/ubuntu/tinyproxy.conf
sudo cp /home/ubuntu/tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
#/sbin/iptables -I INPUT -p tcp --dport 8888 -m state --state NEW,ESTABLISHED -j ACCEPT
#/sbin/iptables -I OUTPUT -p tcp --sport 8888 -m state --state ESTABLISHED -j ACCEPT
sudo systemctl restart tinyproxy

sudo echo "Match address 172.31.0.0/16" >> /etc/ssh/sshd_config
sudo echo "     PasswordAuthentication yes"

sudo systemctl restart sshd

sudo useradd tstark -ppssecrocks -G sudo -m
#sudo apt remove ec2-instance-connect

