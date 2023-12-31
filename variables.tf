# variable "access_key" {
#   description = "Access key to AWS console"
# }
# variable "secret_key" {
#   description = "Secret key to AWS console"
# }

variable "no_of_instance" {
  default = 1
}

variable "instance_name" {
  description = "Name of the instance to be created"
}

variable "instance_type" {

}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will be created in"
}

variable "ami_id" {
  description = "The AMI to use"
}



variable "ami_key_pair_name" {
  default = ""
}

variable "aws_vpc_id" {

}

variable "aws_ami_ami" {

}

variable "product_name" {

}

variable "role_name" {

}

variable "orchestration" {

}

variable "environment" {

}

variable "key" {

}

variable "security_grp" {

}

# variable "conf" {
#   type = map(object({
#     instance_name = string
#     instance_type = string
#   }))
# }

variable "conf" {
  description = "The total configuration, List of Objects/Dictionary"
  default     = [{}]
}

#s3 cars -----
variable "my_s3" {

}

variable "s3_bucket_name" {

}
variable "boolean_force_destroy" {

}
