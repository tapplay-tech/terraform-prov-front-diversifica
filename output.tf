output "fqdn" {
  value = module.route53.fqdn
}

output "bucket_site_domainname" {
  value = module.s3.bucket_site_domainname
}