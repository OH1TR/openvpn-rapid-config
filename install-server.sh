#!/bin/sh

apt-get -y install openvpn python-pip

pip install pyOpenSSL

if [ ! -f server_cert.key  ]; then
    python generate.py
fi

cp -t /etc/openvpn/server client_ca.pem ta.key dh4096.pem server_cert.pem server_cert.key server.conf

systemctl enable openvpn-server@server
systemctl start openvpn-server@server

