# Azure Linux VM Scale Set

This module controls creating the 

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| admin\_username | The name of the user to be the local administrator | `string` | `"adminuser"` | no |
| custom\_tags | Map of tags which will be added to the set by default | `map(string)` | <pre>{<br>  "created_by": "terraform-azurerm-linux-scale-set"<br>}</pre> | no |
| instance\_count | The number of VMs to create in the set | `number` | `1` | no |
| location | The location where the set should be | `any` | n/a | yes |
| name | The name of the VM set | `string` | n/a | yes |
| network\_interface | The network interface to use | `map(any)` | n/a | yes |
| resource\_group\_name | The name of the reource group which the set should exist | `any` | n/a | yes |
| sku | The VM SKU for the set | `string` | `"Standard_F2"` | no |
| tags | Map of tags to add to the set | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vm\_id | The ID of the VM set |