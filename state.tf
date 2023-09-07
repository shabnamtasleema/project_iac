terraform {
  backend "s3" {
    bucket = "tf-aws-shabnam"
    key = var.key
    region = "us-west-1"
    profile = "shabnam"
  }
}
