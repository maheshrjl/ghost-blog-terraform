output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ghost.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ghost.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.ghost.public_dns
}
