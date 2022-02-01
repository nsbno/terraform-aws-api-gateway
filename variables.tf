variable "name_prefix" {
  description = "A prefix for all resources"
  type        = string
}

variable "application_name" {
  description = "The name of the application"
  type        = string
}

variable "schema" {
  description = "The OpenAPI Schema to use for the API Gateway"
  type        = string
}

variable "domain_name" {
  description = "The domain name to associate the API Gateway with"
  type = string
}

variable "base_path" {
  description = "The base path of the API Gateway"
  type = string
}

variable "stage_name" {
  description = "The name of the API Stage"
  type = string

  default = "v1"
}

variable "enable_xray" {
  description = "Use AWS XRay with this API Gateway?"
  type = bool

  default = false
}

variable "access_log_retention_in_days" {
  description = "Amount of days to keep the access logs"
  type = number

  default = 14
}

