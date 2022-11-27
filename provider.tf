provider "aws" {
  region = "eu-west-2"
}


terraform {
  required_version = "~> 1.1.2"
  required_providers {
    aws = {
      version = "~> 3.73.0"
    }
  }
}
