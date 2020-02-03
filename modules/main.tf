provider "aws" { 
    region = "${var.aws_region}"
}

module "s3" {
    source = "./modules/s3"
    domain_name = "${var.domain_name}"
}