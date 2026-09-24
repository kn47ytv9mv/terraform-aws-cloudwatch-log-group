variable "name" {
  default     = null
  description = "The name of the log group. If null, a unique name is generated."
}

variable "kms_key_id" {
  default     = null
  description = "The ARN of the KMS key used to encrypt log data. If null, log data is encrypted with the default CloudWatch Logs encryption."
}

variable "retention_in_days" {
  default     = null
  description = "Number of days to retain log events. If null, events never expire."
}

variable "tags" {
  default     = null
  description = "A map of tags to assign to the log group."
}
