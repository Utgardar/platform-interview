provider "vault" {
  address = var.app_config.vault_config.address
  token   = var.app_config.vault_config.token
}
