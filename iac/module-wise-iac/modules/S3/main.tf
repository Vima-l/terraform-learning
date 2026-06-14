resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

# Prevents new public ACLs from being added to the bucket or its objects
  block_public_acls = true

  # Ignores any existing public ACLs that might already exist
  ignore_public_acls = true

  # Prevents bucket policies that would make the bucket public
  block_public_policy = true

  # Restricts access to the bucket if it has a public policy,
  # allowing only AWS service principals and authorized users
  restrict_public_buckets = true
}