resource "proxmox_virtual_environment_network_linux_bridge" "this" {
  for_each = var.bridges

  node_name  = var.node_name
  name       = each.key
  ports      = each.value.ports
  vlan_aware = each.value.vlan_aware
  autostart  = each.value.autostart
  mtu        = each.value.mtu
  comment    = each.value.comment
  address    = each.value.address
  gateway    = each.value.gateway
}
