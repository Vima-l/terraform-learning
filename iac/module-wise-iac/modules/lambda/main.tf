data "archive_file" "lambda_zip" {
  type = "zip"

  source_dir  = "${path.module}/../../src/invoice_lambda"
  output_path = "${path.module}/../../build/lambda.zip"
}

resource "aws_lambda_function" "invoice_lambda" {
  function_name = "${var.project_name}-${var.environment}-invoice"
  role          = var.lambda_role_arn

  runtime = "python3.12"

  handler = "app.lambda_handler"

  filename = data.archive_file.lambda_zip.output_path

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  timeout = 30

  memory_size = 128

}