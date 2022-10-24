module "caf-enterprise-scale" {
  #source  = "Azure/caf-enterprise-scale/azurerm"
  #version = "2.4.0"
  source = "./terraform/modules/caf-enterprise-scale"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  # Please keep these argument values as false if we are are deploy the landing zone in layered based deployment
  deploy_corp_landing_zones   = false
  deploy_core_landing_zones   = false
  deploy_online_landing_zones = false
  deploy_sap_landing_zones    = false

  deploy_identity_resources    = var.deploy_identity_resources
  subscription_id_identity     = data.azurerm_client_config.core.subscription_id
  configure_identity_resources = local.configure_identity_resources

}