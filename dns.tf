resource "aws_route53_record" "dojo.padok.school" {
  name    = "blblbly-app.dojo.padok.school"
  type    = "CNAME"
  records = [padok-dojo-lb-1534647425.eu-west-3.elb.amazonaws.com
lb_listner_arn = arn:aws:elasticloadbalancing:eu-west-3:450568479740:listener/app/padok-dojo-lb/a842707af71bc2a5/6ae3b87f31e537fa]
}
