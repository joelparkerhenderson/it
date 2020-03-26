##
#
# AWS EC2 instances
#
##

# Define local varibles that notate what the AWS free tier can do.
locals {
  aws_instance__instance_type__free_tier = "t2.micro"
  aws_instance__root_block_device__volume_size__free_tier = "30"
}

# Create an EC2 instance, using our existing key pair.
resource "aws_instance" "demo" {
  ami = data.aws_ami.ubuntu_with_current_version.id
  instance_type = local.aws_instance__instance_type__free_tier
  associate_public_ip_address = true
  key_name = aws_key_pair.administrator.key_name

  availability_zone = "us-east-1a"

  # Uncomment this if you want to set the subnet.
  #subnet_id = aws_subnet.main_public.id

  # Uncomment this if you want to set the VPC security groups.
  #vpc_security_group_ids = [aws_security_group.demo_security_group.id]

  tags = {
    Name = "demo"
  }

  root_block_device {
    volume_size           = local.aws_instance__root_block_device__volume_size__free_tier
  }

  # Install some typical software, by using the typical package manager.
  # You will likely want to customize this section for your own purposes.
  user_data = <<EOF
		#!/bin/sh
    sudo apt-get -q -y update
    sudo apt-get -q -y upgrade
    sudo apt-get -q -y autoclean
    sudo apt-get -q -y --purge autoremove
	EOF

}
