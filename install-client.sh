#!/bin/sh

apt-get -y install openvpn

cp -t /etc/openvpn/client server_ca.pem,ta.key,client_cert.pem,client_cert.key,client.conf

systemctl enable openvpn-client@client
systemctl start openvpn-client@client

