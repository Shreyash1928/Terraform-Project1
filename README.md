🚀 Terraform AWS EC2 Deployment (Beginner Project)

This project demonstrates how to deploy an Amazon EC2 instance on AWS using Terraform.
It is a beginner-friendly Infrastructure-as-Code (IaC) project that teaches cloud automation, resource provisioning, and writing reusable Terraform configurations.

📌 Project Overview

Using Terraform, this project provisions:

✔️ Amazon EC2 instance (Amazon Linux 2)

✔️ Security Group allowing SSH (22) and HTTP (80)

✔️ Automatic public IP assignment

✔️ NGINX installation using user_data

✔️ AWS resources deployed in ap-south-1 (Mumbai)

🏗️ Terraform Resources Used

aws_instance

aws_security_group

aws_ami (data source lookup)

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

Before running this project, ensure you have:

AWS account

IAM user with:

Programmatic access

Access keys (created from IAM → Security Credentials → Access Keys)

AWS CLI installed

Terraform installed

A key pair generated in AWS

Region set to ap-south-1 (Asia Pacific – Mumbai)

Configure AWS CLI:

aws configure

🚀 How to Run This Project
1️⃣ Initialize Terraform
terraform init

2️⃣ Validate
terraform validate

3️⃣ Preview the infrastructure
terraform plan

4️⃣ Apply (Deploy EC2 Instance)
terraform apply -auto-approve

5️⃣ Destroy (Optional)
terraform destroy

🔐 SSH into the EC2 Instance
ssh -i ~/.ssh/devops-key.pem ec2-user@<PUBLIC_IP>


Make sure your PEM file has correct permissions:

chmod 400 ~/.ssh/devops-key.pem

🌐 Check NGINX Installation

Open in browser:

http://<PUBLIC_IP>


You should see:

Hello from Terraform EC2 - <hostname>

📝 What I Learned

Terraform basics (providers, resources, variables, outputs)

How to launch EC2 using IaC

Using data sources to fetch AMIs dynamically

AWS IAM, EC2, Security Groups, Key Pairs

Writing clean Terraform project structure

Installing NGINX using user_data

Troubleshooting AWS permissions, VPC, and subnet issues

How Terraform interacts with AWS CLI credentials