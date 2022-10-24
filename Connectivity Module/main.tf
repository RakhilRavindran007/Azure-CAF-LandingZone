module "caf-enterprise-scale" {
  #source  = "Azure/caf-enterprise-scale/azurerm"
  #version = "2.4.0"
  source = "./terraform/modules/caf-enterprise-scale"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  # Define tenant ID and root management group ID and root management group name
  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = local.root_id
  root_name      = local.root_name

  # Please keep these argument values as false if we are are deploy the landing zone in layered based deployment
  deploy_core_landing_zones   = false
  deploy_online_landing_zones = false
  deploy_sap_landing_zones    = false

  # Please make the deploy_connectivity_resources argument values as true if we need to deploy connectivity resources and configure_connectivity_resources as true if we need to configure it
  deploy_connectivity_resources    = true
  configure_connectivity_resources = local.configure_connectivity_resources
  subscription_id_connectivity     = data.azurerm_client_config.core.subscription_id

  # insert the 1 required variable here
}