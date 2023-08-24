# Project-on-Terraform.

Write a terraform script to create resources mentioned below :

1. You need to create VPC with one private subnet and one public subnet. No need to create NAT gateway.

2. You need to create an EC2 instance in the above created VPC in public subnet, instance type should be t2.micro, volume size should be 5gb and volume type should be gp2, should not be encrypted. You need to Add tag as key should be "purpose" and value should be "Assignment".

3. You need to create security group and attach it to above Ec2 instance. Security group should have inbound rules for ssh port and should have outbound rules of all traffic.

Please run the terraform script and attach the screenshot of the Output.

Execution Result video  : 

[<img src="https://img.youtube.com/vi/HCCCpKfMDbg/hqdefault.jpg" width="600" height="300"
/>](https://www.youtube.com/embed/HCCCpKfMDbg)

Results:

![image](https://github.com/Srisrijakka1/Project-on-Terraform/assets/106643865/5aacfdd8-c6a1-4bf5-8471-e6bb68169c08)

![image](https://github.com/Srisrijakka1/Project-on-Terraform/assets/106643865/1dc250af-14c6-4d67-8bb4-5bd4184a94c8)

![image](https://github.com/Srisrijakka1/Project-on-Terraform/assets/106643865/ceb7d311-c514-4ac1-9956-7b85b4ca4d2a)

![image](https://github.com/Srisrijakka1/Project-on-Terraform/assets/106643865/950ee235-61ba-4ddc-adbf-052d59cd29d7)

![image](https://github.com/Srisrijakka1/Project-on-Terraform/assets/106643865/d7c9f2a1-7ac0-4ad0-aee0-eeb46598f502)

![image](https://github.com/Srisrijakka1/Project-on-Terraform/assets/106643865/e726679a-d9c3-4b80-9b3f-a82d11772075)
