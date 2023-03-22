resource "aws_ebs_volume" "ghost" {
  availability_zone = "${var.region}a"
  size              = 30
  type              = "gp2"
  encrypted         = false
  tags = {
    Name = "ghost-${var.environment}"
  }
}

resource "aws_volume_attachment" "ghost" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ghost.id
  instance_id = aws_instance.ghost.id
}
