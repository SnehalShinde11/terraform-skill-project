resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "${var.name}-${var.environment}"
    Environment = var.environment
    Owner       = var.owner
  }
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    Owner       = var.owner
  }
}
