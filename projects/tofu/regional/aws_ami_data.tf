##
# AMI: Amazon Machine Image
#
# For our teaching purposes, we favor Ubuntu over alternatives such
# as Apine because many of our developers already use Ubuntu locally.
#
# We favor the current version and the long term support (LTS) version,
# depending on whether the goal is freshest OS or production OS.
##

##
# AMI: Amazon Machine Image
#
# For our teaching purposes, we favor Ubuntu over alternatives such
# as Apine because many of our developers already use Ubuntu locally.
#
# We favor the current version and the long term support (LTS) version,
# depending on whether the goal is freshest OS or production OS.
##

# Define local variables.
#
# We use our preferred naming convention of a single-underscore to
# separate words, and a double-underscore to separate concepts.
# You can use any variable you want, and any naming convention.
#
# We define the AWS AMI owner id numbers of our preferred vendors:
#
#   * Canonical (the maker of Ubuntu)
#
#   * Fedora (the maker community that creates Fedora AMIs)
#
# These variables enable us to search AMIs for ones made by owners.
locals {
  aws_ami__owner__fedora = "125523088429"
  aws_ami__owner__canonical = "099720109477"
}

# Look up the AMI id of:
#
#   * Fedora OS Cloud Base
#   * Currrent version
#   * x86_64 instruction set
#   * HVM (Hardware Virtual Machine)
#
data "aws_ami" "fedora_cloud_base_current_x86_64_hvm_region_standard_0" {
  most_recent = true
  owners = [local.aws_ami__owner__fedora]

  filter {
    name   = "name"
    values = ["Fedora-Cloud-Base-*.x86_64-hvm-*-standard-0"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Look up the AMI id of:
#
#   * Ubuntu OS
#   * HVM (Hardware Virtual Machine)
#   * SSD (Solid State Drive)
#   * Current version
#   * AMD64 instruction set
#
data "aws_ami" "ubuntu_hvm_ssd_current_amd64_server" {
  most_recent = true
  owners = [local.aws_ami__owner__canonical]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Look up the AMI id of:
#
#   * Ubuntu OS
#   * HVM (Hardware Virtual Machine)
#   * SSD (Solid State Drive)
#   * LTS (Long Term Support)
#   * AMD64 instruction set
#
data "aws_ami" "ubuntu_hvm_ssd_lts_amd64_server" {
  most_recent = true
  owners = [local.aws_ami__owner__canonical]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
