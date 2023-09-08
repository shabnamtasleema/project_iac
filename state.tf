terraform {
  backend "s3" {
    bucket  = "myawsbucket-shabnam"
    key     = var.key
    region  = "us-west-1"
    profile = "shabnam"
  }
}
