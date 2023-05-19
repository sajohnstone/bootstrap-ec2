resource "aws_ssm_document" "this" {
  name            = var.resource_name
  document_format = "YAML"
  document_type   = "Command"
  content         = data.template_file.ssm_doc.rendered
}

resource "aws_ssm_association" "this" {
  name = aws_ssm_document.this.name

  targets {
    key    = "InstanceIds"
    values = ["${aws_instance.this.id}"]
  }
}

data "template_file" "ssm_doc" {
  template = file("resources/ssm.yml")
}
