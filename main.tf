resource "aws_instance" "this" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.aws_ubuntu.id
  user_data              = data.template_file.user_data.rendered
  vpc_security_group_ids = [aws_security_group.default_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.iam_profile.name

  tags = {
    Name = var.resource_name
  }
}

data "template_file" "user_data" {
  template = file("resources/userdata.sh")
}
