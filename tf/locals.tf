locals {
  app_config = {
    development = {
      vault_config = {
        address = "http://localhost:8201"
        token   = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
      }

      containers = {
        account = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "965d3c27-9e20-4d41-91c9-61e6631870e7"
          }
          endpoint = {
            password = "123-account-development"
          }
          image = "form3tech-oss/platformtest-account"
        }
        gateway = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "10350819-4802-47ac-9476-6fa781e35cfd"
          }
          endpoint = {
            password = "123-gateway-development"
          }
          image = "form3tech-oss/platformtest-gateway"
        }
        payment = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "5f4e3d2c-1b0a-4c3d-9e8f-7a6b5c4d32f1"
          }
          endpoint = {
            password = "123-payment-development"
          }
          image = "form3tech-oss/platformtest-payment"
        }
        nginx = {
          has_vault = false
          image     = "nginx:latest"
          ports = {
            internal = 80
            external = 4080
          }
        }
      }

      env_map = {
        short_name = "dev"
        long_name  = "development"
      }
    }

    staging = {
      vault_config = {
        address = "http://localhost:8401"
        token   = "a1b2c3d4-5678-90ab-cdef-1234567890ab"
      }

      containers = {
        account = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "b1c2d3e4-5f6a-7b8c-9d0e-1f2a3b4c5d6e"
          }
          endpoint = {
            password = "123-account-staging"
          }
          image = "form3tech-oss/platformtest-account"
        }
        gateway = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "d4c3b2a1-0f9e-8d7c-6b5a-4e3f2a1b0c9d"
          }
          endpoint = {
            password = "123-gateway-staging"
          }
          image = "form3tech-oss/platformtest-gateway"
        }
        payment = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "0a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d"
          }
          endpoint = {
            password = "123-payment-staging"
          }
          image = "form3tech-oss/platformtest-payment"
        }
        nginx = {
          has_vault = false
          image     = "nginx:1.22.0-alpine"
          ports = {
            internal = 80
            external = 4082
          }
        }
      }

      env_map = {
        short_name = "stage"
        long_name  = "staging"
      }
    }

    production = {
      vault_config = {
        address = "http://localhost:8301"
        token   = "083672fc-4471-4ec4-9b59-a285e463a973"
      }

      containers = {
        account = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "396e73e7-34d5-4b0a-ae1b-b128aa7f9977"
          }
          endpoint = {
            password = "123-account-production"
          }
          image = "form3tech-oss/platformtest-account"
        }
        gateway = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "33fc0cc8-b0e3-4c06-8cf6-c7dce2705329"
          }
          endpoint = {
            password = "123-gateway-production"
          }
          image = "form3tech-oss/platformtest-gateway"
        }
        payment = {
          has_vault      = true
          vault_policies = ["list", "read"]
          generic_secret = {
            db_password = "821462d7-47fb-402c-a22a-a58867602e39"
          }
          endpoint = {
            password = "123-payment-production"
          }
          image = "form3tech-oss/platformtest-payment"
        }
        nginx = {
          has_vault = false
          image     = "nginx:1.22.0-alpine"
          ports = {
            internal = 80
            external = 4081
          }
        }
      }
      env_map = {
        short_name = "prod"
        long_name  = "production"
      }
    }
  }
}
