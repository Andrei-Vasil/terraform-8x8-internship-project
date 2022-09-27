
output "ec2_flask_instance_public_dns" {
  value = module.ec2_flask_instance.instance_public_dns_address
}
