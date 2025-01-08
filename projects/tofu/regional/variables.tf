# Define local varibles that notate what the AWS free tier can do.
# Naming convention is <resource-id>__<resource-attribute>__<semantic>

variable "aws_instance__instance_type__free_tier" {
  default = "t2.micro"
}

variable "aws_instance__root_block_device__volume_size__free_tier" {
   default = "30"
}

