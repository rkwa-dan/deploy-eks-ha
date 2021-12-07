module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks ha vpc"
  cidr = var.cidr-block

//  azs = data.aws_availability_zones.available.names
/*
VPC creation threw an error
│   ClusterName: "EKS-HA",
│   Message_: "Cannot create cluster 'EKS-HA' because eu-west-2-wl1-lon-wlz-1, the targeted availability zone, does not currently have sufficient capacity to support the cluster. Retry and choose from these availability zones: eu-west-2c, eu-west-2a, eu-west-2b",
│   ValidZones: ["eu-west-2c","eu-west-2a","eu-west-2b"]
*/
// manually configuring 2 azs

  azs = var.eks-azs
  private_subnets = var.private-subnets
// do we need public subnets - if so, uncomment
  public_subnets  = var.public-subnets

  enable_nat_gateway = true
//  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "EKS Cluster"
  }
}

#resource "aws_subnet" "private-subnets" {
#  cidr_block = var.cidr-block
#  vpc_id     = module.vpc.vpc_id
#
#}

