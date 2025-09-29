resource "vault_audit" "audit" {
  type = "file"

  options = {
    file_path = "/vault/logs/audit"
  }
}

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

module "deployment" {
  source = "../deployment"

  for_each = var.app_config.containers

  deployment_name   = each.key
  deployment_config = each.value
  vault_endpoint    = var.app_config.vault_config
  env_map           = var.app_config.env_map

  depends_on = [
    resource.vault_auth_backend.userpass,
  ]
}
