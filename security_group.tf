resource "aws_security_group" "agile_analog_sg" {
  name        = var.security_group
  description = var.security_group

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "agile-analog-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}
