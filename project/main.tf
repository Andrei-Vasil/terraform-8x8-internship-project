

### basic instane ###

module "ec2_flask_instance_1" {
  source = "../modules/ec2-instance"

  name = "module-test-1"
}


### image running docker compose ###

module "ec2_flask_instance_2" {
  source = "../modules/ec2-instance"

  name = "module-test-2"
}


