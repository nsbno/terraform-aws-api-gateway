terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_api_gateway_rest_api" "this" {
  name = var.application_name
  body = var.schema
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  triggers = {
    redeployment = sha256(var.schema)
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_base_path_mapping" "this" {
  api_id      = aws_api_gateway_rest_api.this.id
  stage_name  = aws_api_gateway_stage.this.stage_name
  domain_name = var.domain_name
  base_path   = var.base_path
}

resource "aws_api_gateway_stage" "this" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  deployment_id = aws_api_gateway_deployment.this.id
  stage_name    = var.stage_name

  xray_tracing_enabled = var.enable_xray

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_gateway_access_log.arn
    format          = file("${path.module}/resources/access_log_format.json")
  }

  variables = {
    hash = sha256(var.schema)
  }

}

resource "aws_cloudwatch_log_group" "api_gateway_access_log" {
  name              = "API-Gateway-${aws_api_gateway_rest_api.this.name}-access-log"
  retention_in_days = var.access_log_retention_in_days
}

