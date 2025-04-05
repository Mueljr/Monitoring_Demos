# Use AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 instance
resource "aws_instance" "monitoring_server" { # Instance name for Terraform
  ami           = "ami-084568db4383264d4"  # Ubuntu 22.04 AMI
  instance_type = "t2.micro"  # Free-tier eligible
  key_name      = "dev-proj"  # Replace with your actual AWS key pair

  # Attach Security Group
  security_groups = [aws_security_group.monitoring_sg.name]

  # Tag the instance
  tags = {
    Name = "realtime-monitoring" # Instance name for AWS
  }
}

# Security Group for monitoring services
resource "aws_security_group" "monitoring_sg" {
  name        = "monitoring_sg"
  description = "Allow access to monitoring services"


# Ingress Rules for Prometheus, Grafana, Node Exporter, Alert Manager

  # Prometheus (9090)
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Grafana (3000)
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Node Exporter (9100)
  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Alert Manager (9093)
  ingress {
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH (22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Egress Rules for HTTP and HTTPS

# HTTP (80)
egress {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

# HTTPS (443)
egress {
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

# Alert Manager (9093)
  ingress {
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}