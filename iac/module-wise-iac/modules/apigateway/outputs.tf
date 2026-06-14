output "api_id" {
  value = aws_api_gateway_rest_api.apigateway.id
}

output "root_resouce_id" {
  value = aws_api_gateway_rest_api.apigateway.root_resource_id
}

output "execution_arn" {
  value = aws_api_gateway_rest_api.apigateway.execution_arn
}

output "invoke_url" {
  value = "${aws_api_gateway_stage.dev.invoke_url}/hello"
}