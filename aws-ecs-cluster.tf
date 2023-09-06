module "ecs_cluster" {
  source  = "infrablocks/ecs-cluster/aws"
  version = "6.1.0-rc.3"

  region                = "us-west-2"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnets
  component             = "important-component"
  deployment_identifier = "production"

  cluster_name                         = "ecs-am"
  cluster_instance_ssh_public_key_path = "~/.ssh/id_rsa.pub"
  cluster_instance_type                = "t2.micro"

  cluster_minimum_size     = 2
  cluster_maximum_size     = 4
  cluster_desired_capacity = 2

  depends_on = [module.vpc]
}
