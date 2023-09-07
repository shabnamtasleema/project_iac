# provider "aws" {
#   access_key = var.access_key
#   secret_key = var.secret_key
#   region     = "us-west-1"
# }

resource "aws_instance" "ec2_instance" {
  ami             = var.aws_ami_ami
  subnet_id       = var.subnet_id
  instance_type   = var.instance_type
  key_name        = var.ami_key_pair_name
  security_groups = [aws_security_group.instance_sc2.id, aws_security_group.instance_sc1.id]
  tags = merge(
    local.tags, {
      Name = var.instance_name

  })
}


# data "aws_ami" "ami1" {
# #   executable_users = ["self"]
#   most_recent      = true
#   owners           = ["aws-marketplace"]

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

