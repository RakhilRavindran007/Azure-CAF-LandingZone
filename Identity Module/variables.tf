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

variable "subscription_id_identity" {
  type        = string
  default     = ""
  description = "Sets the Subscription ID to use for Connectivity resources."
}

variable "deploy_identity_resources" {
  type        = bool
  default     = true
  description = "Sets the idenity resources"
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