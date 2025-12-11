variable "aws_region" {
  type    = string
  description = "AWS region to create resources in"
  default = "ap-south-1"
}

variable "aws_profile" {
  type    = string
  description = "AWS CLI profile to use"
  default = "default"
}

variable "instance_type" {
  type    = string
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  description = "Name of the existing key pair to attach to the instance"
  default = ""
}

variable "instance_tags" {
  type = map(string)
  default = {
    Owner = "shreyash"
    Project = "terraform-ec2-demo"
  }
}
