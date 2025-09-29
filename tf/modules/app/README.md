# Applications deployment

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.7 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.15.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.0.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_deployment"></a> [deployment](#module\_deployment) | ../deployment | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_audit.audit](https://registry.terraform.io/providers/hashicorp/vault/3.0.1/docs/resources/audit) | resource |
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/3.0.1/docs/resources/auth_backend) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_config"></a> [app\_config](#input\_app\_config) | Application specific configuration | <pre>object({<br/>    vault_config = object({<br/>      address = string<br/>      token   = string<br/>    })<br/><br/>    containers = map(object({<br/>      has_vault      = bool<br/>      vault_policies = optional(list(string))<br/>      generic_secret = optional(object({<br/>        db_password = optional(string)<br/>      }))<br/>      endpoint = optional(object({<br/>        password = optional(string)<br/>      }))<br/>      image = string<br/>      ports = optional(object({<br/>        internal = number<br/>        external = number<br/>      }))<br/>    }))<br/><br/>    env_map = object({<br/>      short_name = string<br/>      long_name  = string<br/>    })<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployments"></a> [deployments](#output\_deployments) | The deployments created in multipass machine |
<!-- END_TF_DOCS -->
