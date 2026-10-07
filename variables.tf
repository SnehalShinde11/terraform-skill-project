variable "resource_name" {
  description = "Base name assigned to infrastructure resources."
  type        = string
  default     = "inventory-service"
}

variable "aws_region" {
  description = "AWS region where the EC2 instance and S3 bucket are created."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "development"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance. Select an AMI available in aws_region."
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket."
  type        = string
  default     = "inventory-service-development-example-9a8c7b6d"
}

variable "owner" {
  description = "Team responsible for the resource."
  type        = string
  default     = "platform-team"
}
