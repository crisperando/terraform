output "instance_id" {
  value = aws_instance.training.id
}

output "private_ip" {
  value = aws_instance.training.private_ip
}

output "security_group_id" {
  value = aws_security_group.training.id
}
