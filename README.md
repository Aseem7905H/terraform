# Terraform AWS Infrastructure Setup

## Overview
This Terraform configuration provisions an AWS infrastructure that includes the following resources:
- **S3 Bucket**: Used for storing Terraform state.
- **DynamoDB Table**: Used for state locking and consistency.
- **EC2 Instance(s)**: Created using the latest Ubuntu AMI.
- **SSH Key Pair**: Enables secure access to EC2 instances.
- **Default VPC**: Ensures a networking environment.
- **Security Group**: Controls inbound and outbound traffic.

## Prerequisites
Ensure you have the following installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS credentials configured (`aws configure`)
- SSH key (`id_ed25519.pub`) in the working directory

## Configuration Details
### Terraform Backend (S3 & DynamoDB)
- **S3 Bucket**: `tf-ankit-state-bucket`
- **DynamoDB Table**: `tf-ankit-state-dynamo-table`
- Enables remote state storage and locking to prevent conflicts.

### AWS EC2 Instance Configuration
- **AMI**: Latest Ubuntu image
- **Instance Type**: `t2.micro` (Default)
- **Count**: 1 (Can be modified via `aws_ec2_count` variable)
- **Key Pair**: Uses `deployer-key`
- **Security Group**: Allows SSH (22) and HTTP (80) access

 
