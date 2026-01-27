module "vpc" {
  source = "../../modules/vpc"
  env_tag = "dev"
  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  subnet_az = "${var.aws_region}a"
}
module "ec2" {
  source = "../../modules/ec2"
  ami_id = "ami-04233b5aecce09244"
  instance_type = "t2.micro"
  subnet_id = module.vpc.subnet_id
  ec2_count = 1
  env_tag = "dev"
}