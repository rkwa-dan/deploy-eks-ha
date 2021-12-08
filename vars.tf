
/* Configure VPC region varibale use array of existing ones and refer to it in our code as
var.region[n] for scalability purposes.

 Supported EKS Regions
 https://docs.aws.amazon.com/general/latest/gr/eks.html

0  US East (N. Virginia)	  us-east-1
1  US East (Ohio)	          us-east-2
2  US West (N. California)	  us-west-1
3  US West (Oregon)	          us-west-2
4  Africa (Cape Town)	      af-south-1
5  Asia Pacific (Hong Kong)   ap-east-1
6  Asia Pacific (Mumbai) 	  ap-south-1
7  Asia Pacific (Osaka)	      ap-northeast-3
8  Asia Pacific (Seoul)	      ap-northeast-2
9  Asia Pacific (Singapore)   ap-southeast-1
10 Asia Pacific (Sydney)	  ap-southeast-2
11 Asia Pacific (Tokyo)	      ap-northeast-1
12 Canada (Central)	          ca-central-1
13 Europe (Frankfurt)	      eu-central-1
14 Europe (Ireland)	          eu-west-1
15 Europe (London)	          eu-west-2
16 Europe (Milan)	          eu-south-1
17 Europe (Paris)	          eu-west-3
18 Europe (Stockholm)	      eu-north-1
19 Middle East (Bahrain)	  me-south-1
20 South America (São Paulo)  sa-east-1
*/

// define the list of regions as a list/array and refer to the one we want in this instance.
variable "vpc-region-list" {
  type    = list(string)
  //
  default = ["us-east-1","us-east-2","us-west-1","us-west-2","af-south-1","ap-east-1","ap-west-1","ap-northeast-3","ap-northeast-2","ap-southeast-1","ap-southeast-2","ap-northeast-1","ca-central-1","eu-central-1","eu-west-1","eu-west-2","eu-south-1","eu-west-3","eu-north-1","me-south-1","sa-east-1"]
}

#// we could probably do without this variable and specify the vpc using the element(vpc-region-list[N]) instead in the vpc code
#variable "defined-region" {
#  default = element(vpc-region-list[15])
#}

variable "vpc_id" {
  default = ""
}

variable "eks-azs" {
default = ["eu-west-2c","eu-west-2a" ]
}


variable "cidr-block" {
  default = "10.10.0.0/16"
}

variable "private-subnets" {
  default  = ["10.10.1.0/24","10.10.2.0/24"]
}

variable "public-subnets" {
  default  = ["10.10.100.0/24","10.10.200.0/24"]
}

variable "checkCredsOutput" {
  default = "$ aws sts get-caller-identity"
}

variable "connectToEksClusterCommand" {
  default = "$ aws eks --region region update-kubeconfig --name <cluster_name>"
#  ${var.eks-cluster-name}"
}

