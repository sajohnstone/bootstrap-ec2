data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = var.resource_name
  description        = "Role for the ${var.resource_name} ec2 instance"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = {
    Name = var.resource_name
  }
}

resource "aws_iam_instance_profile" "iam_profile" {
  name = "ec2_profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
