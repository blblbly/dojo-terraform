resource "aws_route53_record" "primary" {
  name    = "blblbly-app.dojo.padok.school"
  type    = "CNAME"
  records = [padok-dojo-lb-1534647425.eu-west-3.elb.amazonaws.com]
}
