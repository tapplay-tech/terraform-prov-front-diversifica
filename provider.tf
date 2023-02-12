terraform {
  required_version = "~> 1.3.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "aplicamos-config"
    key    = "tapplay/terraform/diversifica-front"
    region = "us-east-1"
  }
}
