terraform {
  required_version = ">= 0.15.3"
  backend "local" {
    path = "terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.40.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
