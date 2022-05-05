terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.15"
    }
  }
}

provider "intersight" {
  apikey    = var.intersight_api_key
  secretkey = var.intersight_secret_key
  endpoint = var.intersight_endpoint
}
data "intersight_organization_organization" "org_data" {
  name = var.org_name
}
resource "intersight_server_profile" "profile" {
  
  count = length(var.server_list)
  name   = "SP-${var.server_list[count.index].name}"
  action = var.server_list[count.index].server_profile_action
  target_platform = var.server_list[count.index].target_platform
  
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org_data.id
  }
}
