# Setup vault entries and container

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
| <a name="provider_docker"></a> [docker](#provider\_docker) | 2.15.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.this](https://registry.terraform.io/providers/kreuzwerker/docker/2.15.0/docs/resources/container) | resource |
| [vault_generic_endpoint.this](https://registry.terraform.io/providers/hashicorp/vault/3.0.1/docs/resources/generic_endpoint) | resource |
| [vault_generic_secret.this](https://registry.terraform.io/providers/hashicorp/vault/3.0.1/docs/resources/generic_secret) | resource |
| [vault_policy.this](https://registry.terraform.io/providers/hashicorp/vault/3.0.1/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_config"></a> [deployment\_config](#input\_deployment\_config) | Deployment specific configuration | `any` | n/a | yes |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Deployment name | `string` | n/a | yes |
| <a name="input_env_map"></a> [env\_map](#input\_env\_map) | Environment variable map | <pre>object({<br/>    short_name = string<br/>    long_name  = string<br/>  })</pre> | n/a | yes |
| <a name="input_vault_endpoint"></a> [vault\_endpoint](#input\_vault\_endpoint) | Vault specific configuration | <pre>object({<br/>    address = string<br/>    token   = string<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_docker_container_ids"></a> [docker\_container\_ids](#output\_docker\_container\_ids) | The ID of the Docker container |
| <a name="output_docker_container_names"></a> [docker\_container\_names](#output\_docker\_container\_names) | The name of the Docker container |
| <a name="output_docker_container_ports"></a> [docker\_container\_ports](#output\_docker\_container\_ports) | The ports of the Docker container |
<!-- END_TF_DOCS -->
