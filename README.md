# SFTP to S3 Terraform Setup

## Overview

This project uses Terraform to set up an AWS Transfer Family (SFTP) server that uploads files to an S3 bucket. This setup enables secure file transfers via SFTP directly into Amazon S3.

## Prerequisites

- **AWS Account**: Ensure you have an active AWS account.
- **Terraform**: [Install Terraform](https://www.terraform.io/downloads.html) on your local machine.
- **GitHub Account**: For cloning the repository and possibly managing CI/CD.

## Setup Instructions

1. **Clone the Repository**:
    git clone https://github.com/your-username/repository-name.git
    cd repository-name
  

2. **Configure Variables**:
    Edit `variables.tf` to set your desired values for `region` and `bucket_name`.

3. **Initialize Terraform**:
    terraform init
  
4. **Review Configuration**:
    terraform plan
  

5. **Apply Configuration**:
    terraform apply
    

## Variables

- `region`: The AWS region (default: `eu-west-1`).
- `bucket_name`: The name of the S3 bucket.

## Adding/Removing Agencies

To manage SFTP users, modify the `aws_transfer_user` resource in `sftp.tf` as needed.

## Handling Issues

- Check AWS CloudWatch logs for troubleshooting issues related to the SFTP server or the S3 bucket.
