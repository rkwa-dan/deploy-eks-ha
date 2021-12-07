
// get data source for available az's to use
data "aws_availability_zones" "available" {
#  names = element(vpc-region-list[15])
}

// eks stuff

data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}
