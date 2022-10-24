# The following variable are used to simplify the process of customizing 
# important settings and provide the foundation for what needs to be true when 
# deploying multiple instances of the module into a single Tenant.

# With the exception of subscription_id_management and 
# subscription_id_connectivity, these are all given values via the included 
# .tfvars files.

variable "subscription_id_management" {
  type        = string
  default     = ""
  description = "Sets the Subscription ID to use for Connectivity resources."
}

variable "root_id" {
  type        = string
  default     = "es"
  description = "Sets the ID associated with the \"customer root\" Management Group and the default prefix used for most resources deployed as part of Enterprise-scale."
}

variable "root_name" {
  type        = string
  default     = "Enterprise-Scale"
  description = "Sets the displayName value for the \"customer root\" Management Group."
}

variable "default_location" {
  type        = string
  default     = "westeurope"
  description = "Sets the default location for resources, including references to location within Policy templates."
}

variable "deploy_management_resources" {
  type        = bool
  default     = true
  description = "If set to true, will deploy the connectivity resources in the Subscription assigned as the Connectivity landing zone."
}

variable "security_alerts_email_address" {
  type        = string
  default     = "rakhil.pilachrey@pwc.com"
  description = "If set to true, will deploy the connectivity resources in the Subscription assigned as the Connectivity landing zone."
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_management_resources_custom"
  }
}