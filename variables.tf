variable "intersight_api_key" {}

variable "intersight_secret_key" {}

variable "intersight_endpoint" {}

variable "org_name" {}

variable "server_list" {
  type        = list(map(string))
  description = "Servers (identified by name, object_type, and target_platform) to assign to configured server profiles"
  default = [
    {
      name                   = "BGL101-R1-1",
      target_platform        = "Standalone",
      server_profile_action  = "unassign"
    },
    {
      name                   = "BGL101-R1-2",
      target_platform        = "Standalone",
      server_profile_action  = "unassign"
    },
    {
      name                   = "BGL101-R1-FI101-1",
      target_platform        = "FIAttached",
      server_profile_action  = "unassign"
    }
  ]
}



