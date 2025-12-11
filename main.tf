# Get latest Amazon Linux 2 AMI in the chosen region
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Use the default VPC
data "aws_vpc" "default" {
  default = true
}

# Security group to allow SSH and HTTP
resource "aws_security_group" "web_sg" {
  name        = "tf-ec2-web-sg"
  description = "Allow SSH and HTTP inbound"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.instance_tags
}

# EC2 instance
resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y nginx1
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Hello from Terraform EC2 - $(hostname -f)</h1>" > /usr/share/nginx/html/index.html
              EOF

  tags = merge(var.instance_tags, { Name = "tf-ec2-webserver" })
}
