provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "jenkins_bucket" {
  bucket = "jenkins-terraform-bucket-${random_id.bucket_id.hex}"
  acl    = "private"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
