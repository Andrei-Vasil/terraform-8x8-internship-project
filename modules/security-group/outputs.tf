
output "security_group_id" {
  value = aws_security_group.flask-app-security-group.id
}

output "security_group_name" {
  value = aws_security_group.flask-app-security-group.name
}
