resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.Z0951853F6JFBYEVJC2P
  name    = "www.blblbly.com"
  type    = "CNAME"
  ttl     = 300
  records = [padok-dojo-lb-1534647425.eu-west-3.elb.amazonaws.com]
}