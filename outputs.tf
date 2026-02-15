output "bridge_ids" {
  description = "Map of bridge names to their IDs"
  value       = { for k, v in proxmox_virtual_environment_network_linux_bridge.this : k => v.id }
}

output "bridge_names" {
  description = "List of created bridge names"
  value       = keys(proxmox_virtual_environment_network_linux_bridge.this)
}
