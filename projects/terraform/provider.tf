##
#
# Provider
#
# For example to use Amazon Web Services in the US East region,
# set the variable `aws_region` to `us-east-1`.
#
# Example:
#
#     provider "aws" {
#        version = "~> 2.43.0"
#        region = "us-east-1"
#    }
#
# We configure the provider by using environment variables:
#
#   * AWS_ACCESS_KEY_ID="…"
#
#   * AWS_SECRET_ACCESS_KEY="…"
#
#   * AWS_DEFAULT_REGION="…"
##

provider "aws" {
  version = "~> 2.43.0"
}
