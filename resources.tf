resource "random_uuid" "resource" {}

resource "aws_cloudwatch_log_group" "resource" {
  name              = coalesce(var.name, random_uuid.resource.id)
  kms_key_id        = var.kms_key_id
  retention_in_days = var.retention_in_days

  tags = var.tags
}

output "id" {
  description = "The name of the log group."
  value       = aws_cloudwatch_log_group.resource.id
}

output "name" {
  description = "The name of the log group. Feed this into a consumer that targets a log group by name rather than ARN, such as terraform-aws-lambda-function's logging_config."
  value       = aws_cloudwatch_log_group.resource.name
}

output "arn" {
  description = "The ARN of the log group."
  value       = aws_cloudwatch_log_group.resource.arn
}
