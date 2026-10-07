output "ec2_instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.this.id
}

output "ec2_public_dns" {
  description = "Public DNS name of the EC2 instance."
  value       = aws_instance.this.public_dns
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket."
  value       = aws_s3_bucket.this.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket."
  value       = aws_s3_bucket.this.arn
}
