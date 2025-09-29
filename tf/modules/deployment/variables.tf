variable "deployment_name" {
  description = "Deployment name"
  type        = string
}

variable "deployment_config" {
  description = "Deployment specific configuration"
  type        = any
}

variable "env_map" {
  description = "Environment variable map"
  type = object({
    short_name = string
    long_name  = string
  })
}

variable "vault_endpoint" {
  description = "Vault specific configuration"
  type = object({
    address = string
    token   = string
  })
}
