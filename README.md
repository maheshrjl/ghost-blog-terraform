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

### Limitations
- Only works on **AWS Ubuntu 22.04** AMI
- Only works with a single instance
- No host key checking for ssh connections through ansible
- Does not create a new user for ghost ⚠