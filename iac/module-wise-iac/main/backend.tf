terraform {
  backend "s3" {
    bucket         = "terraform-learning-state-102156246557"
    key            = "terraform-learning/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}