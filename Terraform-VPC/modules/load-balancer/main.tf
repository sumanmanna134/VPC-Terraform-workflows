resource "aws_lb" "load_balancer" {
  name               = "application-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets

  tags = {
    Environment = "production"
  }
}

#Listener

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#Target group
resource "aws_lb_target_group" "tg" {
  name     = "exchange-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

#target for attachment

resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.instances)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}