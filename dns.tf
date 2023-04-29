resource "aws_route53_zone" "primary" {
  name = "blblbly-app.dojo.padok.school"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.id
  name    = "www.blblbly-app.dojo.padok.school"
  type    = "CNAME"
  ttl     = 300
  records = ["padok-dojo-lb-1534647425.eu-west-3.elb.amazonaws.com"]
}