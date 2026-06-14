output "lambda_arn" {
  value = aws_lambda_function.invoice_lambda.arn
}

output "lambda_name" {
  value = aws_lambda_function.invoice_lambda.function_name
}
output "invoke_arn" {
  value = aws_lambda_function.invoice_lambda.invoke_arn
}