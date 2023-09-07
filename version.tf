terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "3.53"
    }
  }
  required_version = "1.5.6"
}



# Configure the AWS Provider
provider "aws" {
  region  = "us-west-1"
  profile = "shabnam"
}