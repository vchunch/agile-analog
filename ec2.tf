resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "agile_analog" {
  ami           = var.ami
  instance_type = var.instance_type

  // instance profile
  iam_instance_profile = aws_iam_instance_profile.test_profile.name

  // Public SSH key
  key_name = aws_key_pair.mykey.key_name

  // Security group
  #security_groups = aws_security_group.agile_analog_sg.id
  vpc_security_group_ids = [
    aws_security_group.agile_analog_sg.id
  ]

  depends_on = [aws_security_group.agile_analog_sg]

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }

  tags = {
    Name        = "agile-analog"
    OS          = "amazon-linux"
    persistence = "9.00-18.00"
  }

}
