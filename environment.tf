// customise the environment settings for each node poole per EKS cluster

variable "eks-pool-main-size" {
 default = "3"
}

variable "eks-pool-sec-size" {
 default = "3"
}


variable "eks-cluster-name" {
 default = "EKS-HA"
}