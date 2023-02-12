module "s3" {
  source         = "git::https://github.com/tapplay-tech/terraform-mod-frontend.git//frontend/s3?ref=v0.0.2"
  s3_bucket_site = lookup(var.s3_bucket_site, terraform.workspace)
  tags           = lookup(var.tags, terraform.workspace)
}

module "s3_object" {
  source           = "git::https://github.com/tapplay-tech/terraform-mod-frontend.git//frontend/s3_object?ref=v0.0.2"
  s3_object_key    = var.s3_object_key
  s3_object_bucket = module.s3.bucket_site_id
  s3_object_file   = var.s3_object_file
}

module "cloudfront" {
  source                      = "git::https://github.com/tapplay-tech/terraform-mod-frontend.git//frontend/cloudfront?ref=v0.0.2"
  cf_domainname               = module.s3.bucket_site_domainname
  cf_origin_id                = module.s3.bucket_site_domainname
  cf_acm_certificate_arn      = var.cf_acm_certificate_arn
  cf_minimum_protocol_version = var.cf_minimum_protocol_version
  cf_aliases                  = lookup(var.cf_aliases, terraform.workspace)
  cf_locations                = var.cf_locations
}

module "route53" {
  source            = "git::https://github.com/tapplay-tech/terraform-mod-frontend.git//frontend/route53?ref=v0.0.2"
  r53_zone_id       = var.r53_zone_id
  r53_domainname    = lookup(var.r53_domainname, terraform.workspace)
  r53_type          = var.r53_type
  cf_domain_name    = module.cloudfront.cf_domain_name
  cf_hosted_zone_id = module.cloudfront.cf_hosted_zone_id
}