module "s3"{
  source = "../modules/S3"

  bucket_name=var.bucket_name

  tags = var.tags
}

module "IAM" {
  source = "../modules/IAM"
  project_name = var.project_name
  environment = var.environment
}

module "lambda" {
  source = "../modules/lambda"
  project_name=var.project_name
  environment = var.environment

  lambda_role_arn = module.IAM.lambda_role_arn
}

module "api_gateway" {
  source = "../modules/apigateway"
  project_name = var.project_name
  lambda_invoke_arn = module.lambda.invoke_arn
  lambda_function_name = module.lambda.lambda_name
}

