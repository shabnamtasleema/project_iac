module "project_s3" {
  source         = "git@github.com:shabnamtasleema/terraform_modules.git?ref=main"
  my_s3          = var.my_s3
  # boolean_force_destroy = var.boolean_force_destroy
  s3_bucket_name = var.s3_bucket_name
  environment    = var.environment
}