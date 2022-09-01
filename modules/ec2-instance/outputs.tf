
output "instance_public_ip" {
  value = aws_instance.base_instance.public_ip
}
