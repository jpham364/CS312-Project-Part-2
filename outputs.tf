output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.mc_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_eip.mc_eip.public_ip
}
