##
#
# AWS default VPC
#
##

# Connect to our existing AWS default virtual public cloud (VPC).
# If your AWS doesn't have a default VPC, then you can either omit
# this block, or use the AWS console (or API) to create a default VPC.
#
# To import our default VPC:
#
#     terraform import aws_default_vpc.default vpc-08001b96a6b3ff0bd
#
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default"
  }
}
