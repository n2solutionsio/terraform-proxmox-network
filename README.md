# terraform-proxmox-network

OpenTofu module for managing Proxmox VLAN-aware Linux bridges.

## Usage

```hcl
module "bridges" {
  source = "git::https://github.com/n2solutionsio/terraform-proxmox-network.git?ref=v0.1.0"

  node_name = "proxmox-01"

  bridges = {
    "vmbr1" = {
      ports      = ["enp6s0"]
      vlan_aware = true
      mtu        = 9000
      comment    = "10G VLAN-aware bridge"
    }
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| OpenTofu/Terraform | >= 1.6.0 |
| proxmox | ~> 0.95.0 |

## License

MPL-2.0
