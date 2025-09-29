locals {
  env_map = var.deployment_config.has_vault ? [
    "VAULT_ADDR=http://vault-${var.env_map.long_name}:8200",
    "VAULT_USERNAME=${var.deployment_name}-${var.env_map.long_name}",
    "VAULT_PASSWORD=${try(var.deployment_config.endpoint.password, "default-password")}",
    "ENVIRONMENT=${var.env_map.long_name}"
  ] : []
}

resource "vault_generic_secret" "this" {
  count = var.deployment_config.has_vault ? 1 : 0

  path      = "secret/${var.env_map.long_name}/${var.deployment_name}"
  data_json = <<EOT
{
  "db_user":   "${var.deployment_name}",
  "db_password": "${try(var.deployment_config.generic_secret.db_password, "")}"
}
EOT
}


resource "vault_policy" "this" {
  count = var.deployment_config.has_vault ? 1 : 0

  name   = "${var.deployment_name}-${var.env_map.long_name}"
  policy = <<EOT

path "secret/data/${var.env_map.long_name}/${var.deployment_name}" {
  capabilities = ${try(jsonencode(var.deployment_config.vault_policies), "${jsonencode(["list", "read"])}")}
}

EOT
  depends_on = [
    vault_generic_secret.this,
  ]
}

resource "vault_generic_endpoint" "this" {
  count = var.deployment_config.has_vault ? 1 : 0

  path                 = "auth/userpass/users/${var.deployment_name}-${var.env_map.long_name}"
  ignore_absent_fields = true
  data_json            = <<EOT
{
  "policies": ["${var.deployment_name}-${var.env_map.long_name}"],
  "password": "${try(var.deployment_config.endpoint.password, "default-password")}"
}
EOT
}

resource "docker_container" "this" {
  image = var.deployment_config.image
  name  = "${var.deployment_name}_${var.env_map.short_name}"

  env = local.env_map

  networks_advanced {
    name = "vagrant_${var.env_map.long_name}"
  }

  lifecycle {
    ignore_changes = all
  }

  dynamic "ports" {
    for_each = var.deployment_config.ports != null ? [var.deployment_config.ports] : []
    content {
      internal = ports.value.internal
      external = ports.value.external
    }
  }

  depends_on = [vault_generic_endpoint.this]
}
