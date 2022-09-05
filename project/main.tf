
### common security group ###
module "security_group" {
  source = "../modules/security-group"

  name = "flask-app-security-group"
}

### create a ssh security group rule ###
module "ssh_security_rule" {
  source = "../modules/security-group-rule"

  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.security_group.security_group_id
}

### allow internet access ###
module "allow_internet_security_rule" {
  source = "../modules/security-group-rule"

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  security_group_id = module.security_group.security_group_id
}

### ecr readonly iam role ###
module "ecr_readonly_iam_role" {
  source = "../modules/iam-role"

  name               = "ecr_readonly_iam_role"
  iam_role_json_path = "${path.root}/iam_role_jsons/ecr_readonly.json"
}

### basic instane ###
module "ec2_flask_instance_1" {
  source = "../modules/ec2-instance"

  name              = "module-test-1"
  security_group_id = module.security_group.security_group_id
  key_name          = "ec2-key-1"
  private_key_path  = "${path.root}/.ec2-key-1.pem"
  ansible_yml_path  = "${path.root}/ansible-setup-flask-app-containerised/playbook.yml"
  instance_profile  = module.ecr_readonly_iam_role.instance_profile_name
}

# ### image running docker compose ###
# module "ec2_flask_instance_2" {
#   source = "../modules/ec2-instance"

#   name              = "module-test-2"
#   security_group_id = module.security_group.security_group_id
#   key_name          = "ec2-key-2"
#   private_key_path  = "${path.root}/.ec2-key-2.pem"
#   ansible_yml_path  = "${path.root}/ansible-setup-flask-app-containerised/playbook.yml"
#   instance_profile  = module.ecr_readonly_iam_role.instance_profile_name
# }
