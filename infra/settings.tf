terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.50.0"
    }
  }

  backend "s3" {
    bucket = "ikari-tfstate"
    key    = "go-lambda/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
