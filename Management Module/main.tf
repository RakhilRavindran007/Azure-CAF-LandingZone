module "caf-enterprise-scale" {
  #source  = "Azure/caf-enterprise-scale/azurerm"
  #version = "2.4.0"
  source = "./terraform/modules/caf-enterprise-scale"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm
  }

  # Define tenant ID and root management group ID and root management group name
  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = local.root_id
  root_name      = local.root_name

  deploy_core_landing_zones   = false
  deploy_online_landing_zones = false
  deploy_sap_landing_zones    = false

  # Deploy Management Resources and Management Groups
  deploy_management_resources    = true
  configure_management_resources = local.configure_management_resources
  subscription_id_management     = data.azurerm_client_config.management.subscription_id

  # insert the 1 required variable here
}