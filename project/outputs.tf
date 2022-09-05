
output "ec2_flask_instance_1_public_dns" {
  value = module.ec2_flask_instance_1.instance_public_dns_address
}

# output "ec2_flask_instance_2_public_dns" {
#   value = module.ec2_flask_instance_2.instance_public_dns_address
# }
