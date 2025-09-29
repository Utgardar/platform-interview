variable "app_config" {
  description = "Application specific configuration"
  type = object({
    vault_config = object({
      address = string
      token   = string
    })

    containers = map(object({
      has_vault      = bool
      vault_policies = optional(list(string))
      generic_secret = optional(object({
        db_password = optional(string)
      }))
      endpoint = optional(object({
        password = optional(string)
      }))
      image = string
      ports = optional(object({
        internal = number
        external = number
      }))
    }))

    env_map = object({
      short_name = string
      long_name  = string
    })
  })
}
