
resource "aws_instance" "base_instance" {
    ami           = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"

    tags = {
        Name = var.name
    }
}
