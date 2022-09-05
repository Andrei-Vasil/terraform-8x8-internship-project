variable "name" {
  type = string
}

variable "subnet_id" {
  type    = string
  default = "subnet-0a8132b5bdf3ead49"
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
}

variable "ansible_yml_path" {
  type = string
}

variable "instance_profile" {
  type = string
}
