# Terraform application deployment

## Design

Environments configuration is stores in `local` variable called `app_config`. It contains three configurations for `development`, `staging`, and `production`.

It'll be easier in future to add it to alternative CI/CD like Atlantis or Digger. In this case we'll use local variable in a bit different way:

```hcl
locals {
  app_config = {
    development = {
      ...
    }
    staging = {
      ...
    }
    production = {
      ...
    }
  }[terraform.workspace]
}
```

In this case `terraform.workspace` should be equal one of the keys in map.

Actual application deployment setup Vault audit, Vault auth backend, and does `for_each` loop for every container we need to create for our platform environment.

I've created two modules: one for general application deployment and another one to create secrets in Vault (if it's needed) and start container with specified environment variables.

## Vault connectivity

Since Vault is accessible from environment network, we can just use port 8200. But to actual setup of the credentials, policies and users we're using `localhost` address and respective environment port defined for Veult environment deployment.

## `.tool-versions` file

I'm using [asdf](https://asdf-vm.com/) to manage binaries versions on my machine. So I've added this configuration file to have the same Terraform version as is used in `run.sh`.

## Notes

### DB Passwords generation

I kept DB passwords as plain-text values inside Terraform code. But to improve security and to follow security best practices better to generate them from the code where DB is created and then either encrypt it with SOPS, or push to Vault from the place where DB is created.

### Endpoint password

I'd maybe try to generate them from Terraform code and use `ephemeral` resource. Like:

```hcl
ephemeral "random_password" "gateway_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
```

### Frontend deployment

Those Go applications are not exposing any endpoints. Once they'll have one, we'll need to update how frontend is deployed: add config file, mount it, etc.

### Terraform codebase

For real-world use-case I'll prefer to use pre-commit hooks to generate Terraform documentation, validate and lint code, etc.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.7 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.15.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 3.0.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_development"></a> [app\_development](#module\_app\_development) | ./modules/app | n/a |
| <a name="module_app_production"></a> [app\_production](#module\_app\_production) | ./modules/app | n/a |
| <a name="module_app_staging"></a> [app\_staging](#module\_app\_staging) | ./modules/app | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apps_production"></a> [apps\_production](#output\_apps\_production) | The deployments created in production environment |
| <a name="output_apps_staging"></a> [apps\_staging](#output\_apps\_staging) | The deployments created in staging environment |
| <a name="output_apss_development"></a> [apss\_development](#output\_apss\_development) | The deployments created in development environment |
<!-- END_TF_DOCS -->
