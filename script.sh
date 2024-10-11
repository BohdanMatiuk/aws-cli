#!/bin/bash

cidr_block="172.16.0.0/16"
subnet_cidr_block="172.16.1.0/24"
region="us-east-2"

vpc_id=$(aws ec2 create-vpc --cidr-block $cidr_block --region $region --query Vpc.VpcId --output text)

aws ec2 create-subnet --vpc-id $vpc_id --cidr-block $subnet_cidr_block --region $region --query Subnet.SubnetId --output text

igw_id=$(aws ec2 create-internet-gateway --region $region --query InternetGateway.InternetGatewayId --output text)

aws ec2 attach-internet-gateway --vpc-id $vpc_id --internet-gateway-id $igw_id --region $region

#https://aws.plainenglish.io/amazon-ec2-with-cli-deploy-ec2-instance-in-a-custom-vpc-494fbb9b566f