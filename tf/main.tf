module "app_development" {
  source = "./modules/app"

  app_config = local.app_config["development"]
}

module "app_staging" {
  source = "./modules/app"

  app_config = local.app_config["staging"]
}

module "app_production" {
  source = "./modules/app"

  app_config = local.app_config["production"]
}
