output "instance_id" {
  description = "ID of EC2 instance"
  value       = module.ec2.instance_id
}

output "instance_private_ip" {
  description = "Private IP address of the training instance."
  value       = module.ec2.private_ip
}

output "security_group_id" {
  description = "Security group with no inbound rules."
  value       = module.ec2.security_group_id
}