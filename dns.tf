resource "aws_route53_zone" "primary" {
  name = "blblbly-app.dojo.padok.school"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.id
  name    = "www.blblbly-app.dojo.padok.school"
  type    = "CNAME"
  ttl     = 300
}