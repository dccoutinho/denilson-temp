resource "aws_cloudwatch_metric_alarm" "Average-CPU-Utilisation-Pran01" {
  alarm_name          = "Average CPU Utilisation"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = ""

  dimensions {
    InstanceId = "${aws_instance.owncloud.id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "health" {
  alarm_name                = "web-health-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "StatusCheckFailed"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "1"
  alarm_description         = "This metric monitors ec2 health status"

  dimensions {
    InstanceId = "${aws_instance.owncloud.id}"
  }
}
