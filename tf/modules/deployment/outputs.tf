output "docker_container_ids" {
  value       = docker_container.this.*.id
  description = "The ID of the Docker container"
}

output "docker_container_names" {
  value       = docker_container.this.*.name
  description = "The name of the Docker container"
}

output "docker_container_ports" {
  value       = docker_container.this.*.ports
  description = "The ports of the Docker container"
}
