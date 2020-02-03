provider "aws" {
  region = "${var.aws_region}"
}

module "s3" {
  source      = "./modules/s3"
  domain_name = "${var.domain_name}"
}

module "acm" {
  source      = "./modules/acm"
  domain_name = "${var.domain_name}"

}

module "cloudfront" {
  source                  = "./modules/cloudfront"
  domain_name             = "${var.domain_name}"
  s3_www_website_endpoint = "${module.s3.s3_www_website_endpoint}"
  acm_certificate_arn     = "${module.acm.certificate_arn}"
}
