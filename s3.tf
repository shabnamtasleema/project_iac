module "project_s3" {
  source         = "git@github.com:shabnamtasleema/terraform_modules.git"
  my_s3          = var.my_s3
  s3_bucket_name = var.s3_bucket_name
  environment    = var.environment
}