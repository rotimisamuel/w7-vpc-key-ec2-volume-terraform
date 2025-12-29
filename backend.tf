// backend.tf
terraform {
  backend "s3" {
    bucket       = "s3-terraform-statefile-storrage-wk-7" # replace with your bucket
    key          = "week7/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = false
  }
}
