##
#
# Terraform file for joelparkerhenderson.com
#
##

terraform {
  required_version = ">= 0.12.18"
  backend "local" {
    path = "terraform.tfstate"
  }
}
