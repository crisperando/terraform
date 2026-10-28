variable "aws_region" {
  description = "AWS region for deployment."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment identifier."
  type        = string
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod."
  }
}

variable "instance_type" {
  description = "Low-cost EC2 instance type; availability and pricing vary."
  type        = string
  default     = "t3.nano"
}

variable "project" {
  description = "Project name used for resource naming."
  type        = string
  default     = "activity5"
}
