resource "aws_s3_bucket" "s3-bucket" {
  bucket = "w7-terraform-apc-app-new-s3"

  tags = {
    Name = "w7-terraform-apc-app-new-s3"
  }
}
