# Project-on-Terraform.

Write a terraform script to create resources mentioned below :

1. You need to create VPC with one private subnet and one public subnet. No need to create NAT gateway.

2. You need to create an EC2 instance in the above created VPC in public subnet, instance type should be t2.micro, volume size should be 5gb and volume type should be gp2, should not be encrypted. You need to Add tag as key should be "purpose" and value should be "Assignment".

3. You need to create security group and attach it to above Ec2 instance. Security group should have inbound rules for ssh port and should have outbound rules of all traffic.

Please run the terraform script and attach the screenshot of the Output.

