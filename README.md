# [Ghost](https://ghost.org/) blog setup with terraform and ansible

### Status ⚠

This is a work in progress.

- [x] Install dependencies required for ghost
- [ ] Configure mySQL
- [ ] Configure Nginx
- [ ] Configure Ghost

### Prerequisites

- Terraform
- Ansible
- AWS account
- AWS CLI configured with credentials

### Usage

1. Clone this repo
2. Run `terraform init`
3. Run `terraform apply`

Running the ansible playbook seperately is not required, it is part of terraform apply.


### Variables

| Variable | Description | Default | Location |
|----------|-------------|---------|----------|
| region | AWS region to deploy to | ap-south-1 | terraform.tfvars |
| ami | AMI to use for the instance | ami-0f8ca728008ff5af4 | terraform.tfvars |
| nodejs_version | NodeJS version to install | 16.x | ghost.yml |
| site_name | Name of the site | ghost | ghost.yml |


### Limitations
- Only works on **AWS Ubuntu 22.04** AMI
- Only works with a single instance
- No host key checking for ssh connections through ansible
- Does not create a new user for ghost ⚠