variable "enabled" {
  description = "specifies whether to create this resource or not"
  type        = bool
  default     = false
}

variable "vpc_cidr" {
  description = "specifies an AWS VPC-CIDR"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "specifies an AWS VPC name"
  type        = string
  default     = ""
}

variable "additional_tags" {
  description = "Add extra tags to resources"
  type        = map(string)
  default     = {}
}