resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "${local.prefix}-${var.bucket_name}"
  tags = {
    Name = "Bucket via Terraform"
  }
}