terraform {
        required_providers {
        aws = {
        source ="hashicorp/aws"
        version = "~> 4.16"
}
}
required_version = ">= 1.2.0"
}

provider "aws"{
        region = "ap-south-1"
}

resource "aws_vpc" "my_vpc"{
        cidr_block = "10.0.0.0/16"
        tags = {
        Name = " MY VPC"
  }

}
resource "aws_subnet" "my_public_subnet" {
         vpc_id = aws_vpc.my_vpc.id
    cidr_block  = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
  

    tags = {
       Name = "My Public Subnet"
  }
}

resource "aws_subnet" "my_private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "My Private Subnet"
  }
}

resource "aws_internet_gateway" "my_ig" {
        vpc_id = aws_vpc.my_vpc.id
         tags = {
        Name = "My Internet Gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.my_ig.id
  }
 tags = {
    Name = "Public Route Table"
  }
}
resource "aws_route_table_association" "public_1_rt_a" {
        subnet_id = aws_subnet.my_public_subnet.id
        route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.my_vpc.id
 ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
 }
     ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
         ingress {
    from_port   = 3306  # MySQL port
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]  # Restrict access to the public subnet or other specific IPs
  }
  }
resource "aws_db_instance" "my_rds_instance" {
  identifier            = "my-rds-instance"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t2.micro"
  username              = "admin"
  password              =


resource "aws_instance" "ec2_instance_1"{
        ami = "ami-02eb7a4783e7e9317"
        instance_type = "t2.micro"
        tags = {
        Name = "EC2_instance_1"
        } 
        subnet_id = aws_subnet.my_public_subnet.id
        vpc_security_group_ids  = [aws_security_group.web_sg.id]
        associate_public_ip_address = true

}
