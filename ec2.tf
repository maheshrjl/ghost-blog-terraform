resource "aws_instance" "ghost" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  key_name                    = "trf-key-pair"
  vpc_security_group_ids      = [aws_security_group.ghost.id]
  subnet_id                   = aws_subnet.ghost_subnet.id
  associate_public_ip_address = true
  availability_zone           = "${var.region}a"
  tags = {
    Name = "ghost-${var.environment}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "trf-key-pair"
  public_key = file(var.public_key)
}

resource "null_resource" "wait_for_instance" {
  depends_on = [aws_instance.ghost]
  provisioner "local-exec" {
    command = "sleep 15"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.ghost.public_ip}, -u ubuntu -b -e 'ansible_python_interpreter=/usr/bin/python3' ghost.yml"
  }
}
