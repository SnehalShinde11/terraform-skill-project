variable "name" {
  description = "Resource name."
  type        = string
}

variable "environment" {
  description = "Target environment."
  type        = string
}

variable "ami_id" {
  description = "AMI ID used to launch the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string
}

variable "owner" {
  description = "Responsible team."
  type        = string
}
