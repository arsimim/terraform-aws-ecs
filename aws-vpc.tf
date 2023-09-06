module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "ecs-vpc"
  cidr = "10.80.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.80.1.0/24", "10.80.2.0/24", "10.80.3.0/24"]
  public_subnets  = ["10.80.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "terraform-ecs"
  }

}
