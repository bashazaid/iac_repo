terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
 
}
 
provider "aws" {
  profile = "default"
  region  = "us-east-2"
}



module "ec2" {
  #source = "./modules/ec2"
  source = "github.com/bashazaid/terraform_modules/ec2"

  instance_count = 1
  instance_type   = "t2.micro"
  instance_root_device_size = 8
}

module "s3" {
  #source = "./modules/s3"
  source = "github.com/bashazaid/terraform_modules/s3"

  bucket                = "devon"
  force_destroy         = false
  object_lock_enabled   = false


}
