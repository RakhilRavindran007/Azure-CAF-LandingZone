module "caf-enterprise-scale" {
  #source  = "Azure/caf-enterprise-scale/azurerm"
  #version = "2.4.0"
  source = "./terraform/modules/caf-enterprise-scale"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }

  # Define tenant ID and root management group ID and root management group name
  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = local.root_id
  root_name      = local.root_name
  library_path   = "${path.root}/lib"

  #Control deployment of the core landing zone hierachy.
  deploy_corp_landing_zones   = local.deploy_corp_landing_zones
  deploy_online_landing_zones = local.deploy_online_landing_zones
  deploy_sap_landing_zones    = local.deploy_sap_landing_zones

  #Control deployment of the custom landing zone hierachy with custom archtype defenition and default archtype.

  custom_landing_zones = {
    "${local.root_id}-automotive" = {
      display_name               = "Automotive"
      parent_management_group_id = "${local.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-online-media" = {
      display_name               = "${(var.root_id)} Media"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-online-broadcasting" = {
      display_name               = "${upper(var.root_id)} Broadcasting"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "customer_online"
        parameters = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["eastus", ]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["eastus", ]
          }
        }
        access_control = {}
      }
    }
  }

  # insert the 1 required variable here
}