#!/bin/bash
ip=`ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
base=`echo $ip|sed -e 's/[0-9]*$//g'`
if [ "$1" == "list" ]; then
  sudo arp-scan --interface=enp2s0 --localnet
fi
echo "Enter node"
read node
echo "Enter link"
read link
if [ "$link" == "" ]; then
  link=$node
fi
ip=$base$link
ssh -o "StrictHostKeyChecking no" system$node@$ip
