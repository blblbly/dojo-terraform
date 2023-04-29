data "aws_route53_zone" "selected" {
  name         = "dojo.padok.school"
  private_zone = false
}

data "aws_lb" "test" {
  name = "padok-dojo-lb"
} 

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.blblbly-app.dojo.padok.school"
  type    = "CNAME"
  ttl     = 300
  records = [data.aws_lb.test.dns_name]
} 