##
#
# AWS EC2 instances
#
##

# Create an EC2 instance, using our existing key pair.
resource "aws_instance" "demo" {
  ami = data.aws_ami.ubuntu_with_current_version.id
  instance_type = var.aws_instance__instance_type__free_tier
  associate_public_ip_address = true
  key_name = "administrator@joelparkerhenderson.com=64454c6722400862d74e9b91f15d7033=ssh-rsa-with-automation"
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.demo.id]

  tags = {
    Name = "demo"
  }

  root_block_device {
    volume_size           = var.aws_instance__root_block_device__volume_size__free_tier
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
