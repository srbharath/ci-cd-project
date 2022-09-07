#!/bin/bash
sudo yum install epel-release -y
sudo yum update -y
sudo yum install wget -y
sudo yum install socat -y
sudo wget https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_23.3.1-1~centos~7_amd64.rpm
sudo yum -y install esl-erlang*.rpm
sudo wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.19/rabbitmq-server-3.8.19-1.el7.noarch.rpm
sudo yum -y install rabbitmq-server*.rpm 
sudo systemctl start rabbitmq-server.service
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server
