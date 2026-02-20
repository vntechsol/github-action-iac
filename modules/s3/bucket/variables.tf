variable "enabled" {
  description = "specifies whether to create this resource or not"
  type        = bool
  default     = false
}

variable "s3_bucket_name" {
  description = "specifies an AWS S3-Bucket name"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Add extra tags"
  type        = map(string)
  default     = {}
}