terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.59.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.region
  profile = "default"
}
