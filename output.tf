# OUTPUT
output "aws_instance_public_dns" {
  value = aws_instance.this.public_dns
}
