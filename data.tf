
// get data source for available az's to use
data "aws_availability_zones" "available" {
#  names = element(vpc-region-list[15])
}

// eks cluster creation data sources

data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

// get data list for subnet id's for eks cluster

data "aws_subnet_ids" "subnet_ids_eks" {
vpc_id = module.vpc.vpc_id
}

data "aws_subnet" "subnet_ids_eks" {
for_each = data.aws_subnet_ids.subnet_ids_eks.ids
id       = each.value
}

