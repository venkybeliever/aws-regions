#!/bin/bash
#Regions=$(aws ec2 describe-regions | jq .Regions[].RegionName | tr -d '"')
Regions=$@
instance=$(aws ec2 describe-instances --region us-east-1| jq .Reservations[].Instances[].ImageId)
#echo $instance
for reg in $Regions
do
vpcs=$(aws ec2 describe-vpcs --region $reg | jq .Vpcs[].VpcId)
vpcarray=$vpcs
length=${#vpcarray}
Cidr=$(aws ec2 describe-vpcs --region $reg | jq .Vpcs[].CidrBlock)
#echo $reg
#echo "$vpcs=======>$Cidr"
#echo --------------------------------
#vpcarray=$vpcs
cidarray=$Cidr
#echo $vpcarray
#echo $cidarray
#length=${#vpcarray}
done



for ((i=0;i<$length;i++))
do
	echo "{$i ====>$vpcarray[i]} ==> {$cidarray[i]}"
done
