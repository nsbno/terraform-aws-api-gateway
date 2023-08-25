output "rest_api_arn" {
  value = aws_api_gateway_rest_api.this.arn
}

output "rest_api_id" {
  value = aws_api_gateway_rest_api.this.id
}

output "stage_arn" {
  value = aws_api_gateway_stage.this.arn
}

output "stage_id" {
  value = aws_api_gateway_stage.this.id
}

output "stage_name" {
  value = aws_api_gateway_stage.this.stage_name
}

output "deployment_id" {
  value = aws_api_gateway_deployment.this.id
}

output "access_log_group_arn" {
  value = aws_cloudwatch_log_group.api_gateway_access_log.arn
}

output "access_log_group_id" {
  value = aws_cloudwatch_log_group.api_gateway_access_log.id
}
