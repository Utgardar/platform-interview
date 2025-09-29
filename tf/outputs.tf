output "apss_development" {
  value       = module.app_development.deployments
  description = "The deployments created in development environment"
}

output "apps_staging" {
  value       = module.app_staging.deployments
  description = "The deployments created in staging environment"
}

output "apps_production" {
  value       = module.app_production.deployments
  description = "The deployments created in production environment"
}
