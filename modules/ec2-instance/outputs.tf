
output "instance_public_ip" {
  value = aws_instance.base_instance.public_ip
}

output "instance_public_dns_address" {
  value = aws_instance.base_instance.public_dns
}