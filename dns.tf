resource "aws_route53_record" "www" {
  zone_id  = data.aws_route53_zone.this.Z0951853F6JFBYEVJC2P
  name     = www.blblbly-app.dojo.padok.school
  type    = "CNAME"
  records = [padok-dojo-lb-1534647425.eu-west-3.elb.amazonaws.com]
}
