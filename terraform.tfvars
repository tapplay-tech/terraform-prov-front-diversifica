#General 
region = {
  stg = "us-east-1"
  prd = "us-east-1"
}

tags = {
  stg = {
    "Name" = "diversifica"
    "Env"  = "stg"
  },
  prd = {
    "Name" = "diversifica"
    "Env"  = "prd"
  }
}

#s3
s3_bucket_site = {
  stg = "stg.diversifica.me"
  prd = "prd.diversifica.me"
}

#s3 object
s3_object_key  = "index.html"
s3_object_file = "./staticfiles/index.html"

#cloud front
cf_acm_certificate_arn      = "arn:aws:acm:us-east-1:490089276961:certificate/fc10d8ca-08c4-409d-919f-4aa5caa74115"
cf_minimum_protocol_version = "TLSv1"

cf_aliases = {
  stg = ["stg.diversifica.me"]
  prd = ["prd.diversifica.me"]
}

cf_comment             = "Frontend Diversifica"
cf_default_root_object = "index.html"
cf_enabled             = "true"
cf_is_ipv6_enabled     = "true"
cf_log_include_cookies = "false"
cf_locations           = ["PT", "BR", "US"]

#route53
r53_domainname = {
  stg = "stg.diversifica.me"
  prd = "prd.diversifica.me"
}

r53_zone_id = "/hostedzone/Z0033982188RJQRN2L9PI"
r53_type    = "A"
