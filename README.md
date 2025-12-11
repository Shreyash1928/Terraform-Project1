🚀 Terraform AWS EC2 Deployment (Beginner Project)

This project demonstrates how to deploy an Amazon EC2 instance on AWS using Terraform.
It is a beginner-friendly Infrastructure-as-Code (IaC) project that shows how to automate cloud resources, manage configurations, and create reusable Terraform modules.

📌 Project Overview

Using Terraform, we automated the provisioning of:

An EC2 instance (Amazon Linux 2)

A Security Group (allowing SSH + HTTP)

Automatic public IP assignment

NGINX installation using user_data script

🏗️ Terraform Resources Used

aws_instance

aws_security_group

aws_ami (data source)

aws_vpc (default VPC)

📁 Project Structure
terraform-ec2/
│── main.tf
│── variables.tf
│── terraform.tfvars
│── outputs.tf
│── README.md
│── .gitignore

⚙️ Prerequisites

Before running this project:

AWS account

IAM user with:

Programmatic access

Access keys

AWS CLI configured using:

aws configure

Terraform installed on your system

A key pair (PEM file) stored on your machine

Provider region set to ap-south-1 (Mumbai)

🚀 How to Run This Project
1. Initialize Terraform :
terraform init

terraform validate

terraform plan

terraform apply -auto-approve

terraform destroy

🔐 SSH into the EC2 Instance
ssh -i ~/.ssh/devops-key.pem ec2-user@<PUBLIC_IP>

🌐 Check NGINX Installation

Open in browser:

http://<PUBLIC_IP>


You should see:

Hello from Terraform EC2 - <hostname>

📝 What I Learned

Terraform basics (providers, resources, variables, outputs)

Managing AWS infrastructure using IaC

Debugging subnet, VPC, AMI, and permissions issues

Using user_data to automate server configuration

Writing maintainable Terraform code

Connecting Terraform with AWS CLI
