
resource "aws_security_group" "flask-app-security-group" {
  name   = var.name
  vpc_id = var.vpc_id
}
