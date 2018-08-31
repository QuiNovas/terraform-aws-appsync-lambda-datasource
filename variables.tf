variable "api_id" {
  description = "The API ID for the GraphQL API for the DataSource."
  type        = "string"
}

variable "invoke_lambda_policy_arn" {
  description = "The ARN of the policy that allows for the invocation of the Lambda function."
  type        = "string"
}

variable "lambda_function_arn" {
  description = "The ARN for the Lambda function."
  type        = "string"
}

variable "name" {
  description = "TA user-supplied name for the DataSource."
  type = "string"
}

variable "role_name_prefix" {
  default     = ""
  description = "Prefix to attach to the role name."
  type        = "string"
}
