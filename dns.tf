data "aws_route53_zone" "www" {
  name = local.zone_name
}

data "aws_lb" "dojo" {
  name = "padok-dojo-lb"
}

resource "aws_route53_record" "www" {
  zone_id  = data.aws_route53_zone.www.Z0951853F6JFBYEVJC2P
  name     = "www.blblbly-app.local"
  type    = "CNAME"
  records = [padok-dojo-lb-1534647425.eu-west-3.elb.amazonaws.com]
}
