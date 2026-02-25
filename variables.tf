variable "node_name" {
  description = "Proxmox node name where network interfaces will be created"
  type        = string
}

variable "bridges" {
  description = "Map of Linux bridges to create"
  type = map(object({
    ports      = optional(list(string), [])
    vlan_aware = optional(bool, true)
    autostart  = optional(bool, true)
    mtu        = optional(number)
    comment    = optional(string)
    address    = optional(string)
    gateway    = optional(string)
  }))
  default = {}

  validation {
    condition     = alltrue([for name, _ in var.bridges : can(regex("^vmbr[0-9]+$", name))])
    error_message = "Bridge names must match the pattern vmbr[N] (e.g., vmbr0, vmbr1)."
  }
}

variable "vlans" {
  description = "Map of VLAN sub-interfaces to create"
  type = map(object({
    interface = string
    vlan      = number
    autostart = optional(bool, true)
    mtu       = optional(number)
    comment   = optional(string)
    address   = optional(string)
    gateway   = optional(string)
  }))
  default = {}
}
