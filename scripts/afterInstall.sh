#!/bin/bash
echo "Strating the forver node server" >> 'home/ec2-user/mmmll.txt'
cd /home/ec2-user/

# Use it if you have multiple ENI Attached, becoz below will fail in case of Multiple ENI
# INTERFACE=$(curl --silent http://169.254.169.254/latest/meta-data/network/interfaces/macs/ | head -n1)

INTERFACE=$(curl --silent http://169.254.169.254/latest/meta-data/network/interfaces/macs/)
SUBNET_ID=$(curl --silent http://169.254.169.254/latest/meta-data/network/interfaces/macs/${INTERFACE}/subnet-id)
VPC_ID=$(curl --silent http://169.254.169.254/latest/meta-data/network/interfaces/macs/${INTERFACE}/vpc-id)

mkdir -p appConfig

echo "NodeDetail: 
        Local IP: $(curl http://169.254.169.254/latest/meta-data/local-ipv4)
        InstaceId: $(curl http://169.254.169.254/latest/meta-data/instance-id)
        Ami-Id: $(curl http://169.254.169.254/latest/meta-data/ami-id)
        Availability Zone: $(curl http://169.254.169.254/latest/meta-data/placement/availability-zone-id)
        Subnet Id: $SUBNET_ID
        VPC Id: $VPC_ID" > appConfig/nodeDetails.txt
