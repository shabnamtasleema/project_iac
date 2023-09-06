provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = "us-west-1"
}

resource "aws_instance" "ec2_instance" {
    ami = data.aws_ami.ami1.id
    count = var.number_of_instances
    subnet_id = var.subnet_id
    instance_type = var.instance_type
    key_name = var.ami_key_pair_name
    tags = {
        Name = var.instance_name
    }
} 

data "aws_ami" "ami1" {
#   executable_users = ["self"]
  most_recent      = true
  owners           = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*"]
  }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
}