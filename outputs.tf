output "ec2_instance_id" {
  description = "ID of the deployed EC2 instance."
  value       = module.application_resource.ec2_instance_id
}

output "ec2_public_dns" {
  description = "Public DNS name assigned to the EC2 instance, if available."
  value       = module.application_resource.ec2_public_dns
}

output "s3_bucket_name" {
  description = "Name of the deployed S3 bucket."
  value       = module.application_resource.s3_bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the deployed S3 bucket."
  value       = module.application_resource.s3_bucket_arn
}
