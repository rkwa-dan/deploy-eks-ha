terraform {
  backend "s3" {
    bucket = "dc-terraform-statefiles"
    key    = "eks-ha/terraform-statefile"
    region = "eu-west-2"
  }
}

