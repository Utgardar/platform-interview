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
