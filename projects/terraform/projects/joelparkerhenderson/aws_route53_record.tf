##
# Route for NS and SOA
##

resource "aws_route53_zone" "joelparkerhenderson_com" {
  name = "joelparkerhenderson.com."
}

# TODO: reconcile the Cloudflare nameservers:
#
#   * nelci.ns.cloudflare.com
#   * nicolas.ns.cloudflare.com

resource "aws_route53_record" "joelparkerhenderson_com__ns" {
  allow_overwrite = true
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = aws_route53_zone.joelparkerhenderson_com.name
  type    = "NS"
  ttl     = "30"

  records = [
    aws_route53_zone.joelparkerhenderson_com.name_servers.0,
    aws_route53_zone.joelparkerhenderson_com.name_servers.1,
    aws_route53_zone.joelparkerhenderson_com.name_servers.2,
    aws_route53_zone.joelparkerhenderson_com.name_servers.3,
  ]
}

resource "aws_route53_record" "joelparkerhenderson_com__soa" {
  allow_overwrite = true
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = aws_route53_zone.joelparkerhenderson_com.name
  type    = "SOA"
  ttl     = "30"

  records = [
    "${aws_route53_zone.joelparkerhenderson_com.name_servers.0} awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400",
  ]
}

##
# Mail exchange (MX) records to connect to Fastmail.com
##

resource "aws_route53_record" "joelparkerhenderson_com__mx" {
  allow_overwrite = true
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = aws_route53_zone.joelparkerhenderson_com.name
  type    = "MX"
  ttl     = "30"

  records = [
    "10 in1-smtp.messagingengine.com",
    "20 in2-smtp.messagingengine.com",
  ]
}

resource "aws_route53_record" "joelparkerhenderson_com__spf" {
  allow_overwrite = true
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = aws_route53_zone.joelparkerhenderson_com.name
  type    = "TXT"
  ttl     = "30"

  records = [
    "v=spf1 include:spf.messagingengine.com ?all",
  ]
}

resource "aws_route53_record" "joelparkerhenderson_com__domainkey_1" {
  allow_overwrite = true
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = "fm1._domainkey"
  type    = "CNAME"
  ttl     = "30"

  records = [
    "fm1.joelparkerhenderson.com.dkim.fmhosted.com",
  ]
}

resource "aws_route53_record" "joelparkerhenderson_com__domainkey_2" {
  allow_overwrite = true
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = "fm2._domainkey"
  type    = "CNAME"
  ttl     = "30"

  records = [
    "fm2.joelparkerhenderson.com.dkim.fmhosted.com",
  ]
}

resource "aws_route53_record" "joelparkerhenderson_com__domainkey_3" {
  allow_overwrite = true
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = "fm3._domainkey"
  type    = "CNAME"
  ttl     = "30"

  records = [
    "fm3.joelparkerhenderson.com.dkim.fmhosted.com",
  ]
}

##
# Website records
##

resource "aws_route53_record" "joelparkerhenderson_com" {
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = "joelparkerhenderson.com."
  type    = "A"
  ttl     = "300"
  records = ["3.80.171.228"]
}

resource "aws_route53_record" "www_joelparkerhenderson_com" {
  zone_id = aws_route53_zone.joelparkerhenderson_com.zone_id
  name    = "www.joelparkerhenderson.com."
  type    = "A"
  ttl     = "300"
  records = ["3.80.171.228"]
}
