resource "aws_route53_record" "www" {
  zone_id = Z0951853F6JFBYEVJC2P
  name    = "blblbly-app.dojo.padok.school"
  type    = "CNAME"
  records = [padok-dojo-lb-1534647425.eu-west-3.elb.amazonaws.com]
}
