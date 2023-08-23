provider "aws" {
  region  = "ap-south-1"
  # These must be given by  IAM Role here or AWS CLI for executing this file 
  access_key = "AKIA375AC2OIS3UOS4HV" 
  secret_key = "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"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "MyVpc"
    "purpose" = "Assignment"
  }
}

resource "aws_subnet" "publicsubnet" {
  availability_zone = "ap-south-1a"
    vpc_id = aws_vpc.vpc.id 
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "MyPublicSubnet"
        "purpose" = "Assignment"
    }
}

resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.vpc.id 
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "MyPrivateSubnet"
        "purpose" = "Assignment"
    }
}

#without InternetGateWay we cannot access the ec2 in public subnet
resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.vpc.id 
    tags = {
        Name = "InternetGateWayForPublicSubnet"
        "purpose" = "Assignment"
    }
}

resource "aws_route_table" "vpcRoutetable"{
  vpc_id = aws_vpc.vpc.id 
  tags = {
    Name = "Routetable for vpc"
    "purpose" = "Assignment"
  }
}

resource "aws_route" "vpcIn"{
  route_table_id = aws_route_table.vpcRoutetable.id 
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  /*
  tags = {
    Name = "Creating a inbound route for vpc by vpcRoutetable from IGW gateway to everywhere(0.0.0.0/0) inside vpc"
    "purpose" = "Assignment"
  }*/
}

resource "aws_route_table_association" "public_subnet_association_with_vpc"{
  subnet_id = aws_subnet.publicsubnet.id 
  route_table_id = aws_route_table.vpcRoutetable.id 
  /*tags = {
    Name = "public Subnet association with internetgateway by vpcroutetable"
    "purpose" = "Assignment"
  }*/
}

resource "aws_security_group" "instance_sg"{
  vpc_id = aws_vpc.vpc.id
  name = "instance-security-geoup"
  description = "security group for ec2 instance"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
      "purpose" = "Assignment"
    }
} 

resource "aws_instance" "ec2" {
    subnet_id = aws_subnet.publicsubnet.id 
    ami = "ami-0da59f1af71ea4ad2"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.instance_sg.id]
    availability_zone = "ap-south-1a"
    associate_public_ip_address = true
    root_block_device{
      volume_type = "gp2"
      #condition: volume_size >= snapshot size so volume_size>=8  
      #volume_size = 5  This is not possible due to above condition 
      volume_size = 8
      delete_on_termination = true
      encrypted = false
    }
    tags = {
      Name = "Ec2ForAssignment"
      "purpose" = "Assignment"
    }
}

