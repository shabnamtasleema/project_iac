terraform {
  backend "s3" {
    bucket  = "my-s3-bucket-new-shab"
    key     = var.key
    region  = "us-west-1"
    profile = "shabnam"
  }
}
