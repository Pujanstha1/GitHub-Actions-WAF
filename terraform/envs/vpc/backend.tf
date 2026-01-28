terraform {
  backend "s3" {
    bucket = "adex-terraform-9842463240"    
    key = vpc/terraform.tfstate
    region = "us-east-1"
  }
}