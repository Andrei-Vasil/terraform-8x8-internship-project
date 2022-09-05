
resource "aws_instance" "base_instance" {
  ami                         = "ami-052efd3df9dad4825"
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  security_groups             = [var.security_group_id]
  iam_instance_profile        = var.instance_profile
  key_name                    = var.key_name

  tags = {
    Name = var.name
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'wait untill ssh is ready'"
    ]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = aws_instance.base_instance.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${var.ssh_user}@${aws_instance.base_instance.public_ip}, --private-key ${var.private_key_path} ${var.ansible_yml_path}"
  }
}
