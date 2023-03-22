# Get the latest Ubuntu 22.04 AMI

# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"] # Canonical
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }
#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }
# }

#Retrieve IP address & use it to create security group

data "http" "myip" {
  url = "https://ipv4.icanhazip.com"
}

# Pass CloudInit user data to EC2 instance

data "cloudinit_config" "user_data" {
  gzip          = false
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    filename     = "cloud-init.yml"
    content      = file("./cloud-init.yml")
  }
}
