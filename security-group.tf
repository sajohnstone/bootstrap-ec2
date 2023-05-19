# Security group
resource "aws_security_group" "default_sg" {
  name        = "${var.resource_name}_security_group"
  description = "Allow HTTP port 80"
  vpc_id      = data.aws_vpc.vpc_default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.resource_name
  }
}
