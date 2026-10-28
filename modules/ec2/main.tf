resource "aws_security_group" "training" {
  name_prefix = "${var.project}-${var.environment}"
  description = "Activity 7 instance - no inbound"
  vpc_id      = var.vpc_id

  egress {
    description = "Outbound access for package repositories"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}"
  }
}

resource "aws_instance" "training" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.training.id]
  associate_public_ip_address = false

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name = "${var.project}-${var.environment}"
  }
}