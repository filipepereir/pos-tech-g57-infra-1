resource "aws_s3_bucket" "bucket-backend-postech-g57777" {
  bucket = var.bucket_name
  tags   = var.tags
}
