mock_provider "proxmox" {}

variables {
  node_name = "proxmox-01"

  bridges = {
    "vmbr1" = {
      ports      = ["enp6s0"]
      vlan_aware = true
      autostart  = true
      mtu        = 9000
      comment    = "10G VLAN-aware bridge"
    }
    "vmbr2" = {
      ports      = ["enp7s0"]
      vlan_aware = false
    }
  }
}

run "creates_bridges" {
  command = plan

  assert {
    condition     = length(proxmox_virtual_environment_network_linux_bridge.this) == 2
    error_message = "Should create 2 bridges"
  }
}

run "bridge_vlan_aware_flag" {
  command = plan

  assert {
    condition     = proxmox_virtual_environment_network_linux_bridge.this["vmbr1"].vlan_aware == true
    error_message = "vmbr1 should be VLAN-aware"
  }

  assert {
    condition     = proxmox_virtual_environment_network_linux_bridge.this["vmbr2"].vlan_aware == false
    error_message = "vmbr2 should not be VLAN-aware"
  }
}

run "node_assignment" {
  command = plan

  assert {
    condition     = proxmox_virtual_environment_network_linux_bridge.this["vmbr1"].node_name == "proxmox-01"
    error_message = "Bridge should be assigned to proxmox-01"
  }
}

run "autostart_default" {
  command = plan

  assert {
    condition     = proxmox_virtual_environment_network_linux_bridge.this["vmbr2"].autostart == true
    error_message = "Default autostart should be true"
  }
}
