# Region to deploy ghost

variable "region" {
  description = "The region where ghost is deployed"
  default     = "ap-south-1"
  type        = string
}

# Environment variables

variable "environment" {
  description = "The environment where ghost is deployed (dev/prod)"
  default     = "dev"
  type        = string
}

# VPC variables

variable "dev_vpc_cidr" {
  description = "The CIDR block for the dev VPC"
  default     = "10.0.0.0/16"
  type        = string
}

variable "prod_vpc_cidr" {
  description = "The CIDR block for prod the VPC"
  default     = "192.168.0.0/16"
  type        = string
}

# SSH public key

variable "public_key" {
  description = "The path to the public key to use for the EC2 instances"
  default     = "~/.ssh/id_rsa.pub"
  type        = string
}

# AMI variables

variable "ami" {
  description = "Ubuntu 22.04 AMI"
  default     = "ami-0f8ca728008ff5af4"
  type        = string
}
