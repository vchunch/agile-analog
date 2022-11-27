resource "aws_s3_bucket" "terraform_state" {
  bucket = "interview-project-agile-analog"

  versioning {
    enabled = true
  }

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "agile_locks" {
  name         = "interview-project-agile-analog-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "interview-project-agile-analog"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "interview-project-agile-analog-locks"
  }
}