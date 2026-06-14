resource "aws_api_gateway_rest_api" "apigateway" {
  name = "${var.project_name}-api-gateway"

}

resource "aws_api_gateway_resource" "hello" {
  rest_api_id = aws_api_gateway_rest_api.apigateway.id
  parent_id   = aws_api_gateway_rest_api.apigateway.root_resource_id
  path_part   = "hello"
}

resource "aws_api_gateway_method" "get_hello" {
  authorization = "None"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.hello.id
  rest_api_id   = aws_api_gateway_rest_api.apigateway.id
}

resource "aws_api_gateway_integration" "lambda" {
  http_method = aws_api_gateway_method.get_hello.http_method
  resource_id = aws_api_gateway_resource.hello.id
  rest_api_id = aws_api_gateway_rest_api.apigateway.id
  type        = "AWS_PROXY"
  integration_http_method = "POST"

  uri         = var.lambda_invoke_arn
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id = "AllowExecution"
  action = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.apigateway.execution_arn}/*/*"
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.apigateway.id
  depends_on = [aws_api_gateway_integration.lambda]
}

resource "aws_api_gateway_stage" "dev" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.apigateway.id
  stage_name    = "dev"
}



