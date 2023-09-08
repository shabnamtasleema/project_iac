# provider "aws" {
#   access_key = var.access_key
#   secret_key = var.secret_key
#   region     = "us-west-1"
# }
locals {

serverconfig = [

for server in var.conf : {
#  [

# for i in range(1, server.no_of_instances+1) : {

instance_name = server.instance_name

instance_type = server.instance_type
}
# ami = server.ami
# }
# ]
]
}

locals {
instances = flatten(local.serverconfig)
}



resource "aws_instance" "ec2_instance" {
  for_each = {for server in local.instances: server.instance_name => server}
  instance_type = each.value.instance_type
  
  ami             = var.aws_ami_ami
  subnet_id       = var.subnet_id
  key_name        = var.ami_key_pair_name
  security_groups = [aws_security_group.instance_sc2.id, aws_security_group.instance_sc1.id]
  tags = merge(
    local.tags, {
      Name = each.value.instance_name
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

