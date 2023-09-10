ami_key_pair_name = "my-jenkins-key1"
ami_id            = "ami-0f8e81a3da6e2510a"
subnet_id         = "subnet-06a96865e8c56df1e"
instance_type     = "t2.micro"
instance_name     = "instance"
security_grp      = "securitygrp"
aws_vpc_id        = "vpc-01043d6a238f3cc48"
aws_ami_ami       = "ami-0f8e81a3da6e2510a"
key               = "dev/terraform.tfstate"
environment       = "dev"


#----------S3 module vars-----
my_s3          = "my-first-s3-shabnam"
s3_bucket_name = "aws-first-s3-shabnam"


conf = [
  {
    instance_type = "t2.micro",
    instance_name = "instance_small"
  },
  {
    instance_type = "t2.large",
    instance_name = "instance_large"
  }
]


# tagging standards

product_name  = " product"
orchestration = "https://github.com/shabnamtasleema/project_iac.git"
role_name     = "admin"