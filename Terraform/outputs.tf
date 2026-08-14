output "jenkins_server_public_ip" {
  description = "The public IP of the Jenkins EC2 instance"
  value       = module.jenkins.jenkins_public_ip
}