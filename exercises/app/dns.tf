data "aws_route53_zone" "selected" {
  name         = "dojo.padok.school"
  private_zone = false
}

data "aws_lb" "test" {
  name =  "padok-dojo-lb"
}

resource "aws_lb_target_group" "this" {
    for_each = local.applications

  name        = each.value.name
  port        = each.value.port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "vpc-06fb0e04e33af79f2"

  health_check {
    enabled             = true
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
  }
}

resource "aws_lb_listener_rule" "this" {
    for_each = local.applications 
        listener_arn = "arn:aws:elasticloadbalancing:eu-west-3:450568479740:listener/app/padok-dojo-lb/4f6ff08666222c65/c80aa0027d4819e0"
        action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.this[each.key].arn
        }
        condition {
            host_header {
            values = [each.value.value]
        }
    }

        lifecycle {
            ignore_changes = [
            priority
            ]
        }

    }

resource "aws_route53_record" "www" {
    for_each = local.applications

  zone_id = data.aws_route53_zone.selected.zone_id
  name    = each.value.value
  type    = "CNAME"
  ttl     = 300
  records = [data.aws_lb.test.dns_name]
}