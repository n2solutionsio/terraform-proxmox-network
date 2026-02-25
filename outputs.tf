output "bridge_ids" {
  description = "Map of bridge names to their IDs"
  value       = { for k, v in proxmox_virtual_environment_network_linux_bridge.this : k => v.id }
}

output "bridge_names" {
  description = "List of created bridge names"
  value       = keys(proxmox_virtual_environment_network_linux_bridge.this)
}

output "vlan_ids" {
  description = "Map of VLAN interface names to their IDs"
  value       = { for k, v in proxmox_virtual_environment_network_linux_vlan.this : k => v.id }
}

output "vlan_names" {
  description = "List of created VLAN interface names"
  value       = keys(proxmox_virtual_environment_network_linux_vlan.this)
}
