<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_zstack"></a> [zstack](#requirement\_zstack) | 1.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vcenter_builder_image"></a> [vcenter\_builder\_image](#module\_vcenter\_builder\_image) | git::http://172.20.14.17/jiajian.chi/terraform-zstack-image.git | n/a |
| <a name="module_vcenter_builder_instance"></a> [vcenter\_builder\_instance](#module\_vcenter\_builder\_instance) | git::http://172.20.14.17/jiajian.chi/terraform-zstack-instance.git | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.install_json](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [terraform_data.remote_exec](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_storage_name"></a> [backup\_storage\_name](#input\_backup\_storage\_name) | Name of the backup storage to use | `string` | `"bs"` | no |
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br/><br/>Examples:<pre>context:<br/>  project:<br/>    name: string<br/>    id: string<br/>  environment:<br/>    name: string<br/>    id: string<br/>  resource:<br/>    name: string<br/>    id: string</pre> | `map(any)` | `{}` | no |
| <a name="input_create_image"></a> [create\_image](#input\_create\_image) | Flag to determine whether to create the image. Set to true to create the image, false to use image name to search in backupstorage. | `bool` | `true` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of DNS server IPs | `list(string)` | <pre>[<br/>  "223.5.5.5"<br/>]</pre> | no |
| <a name="input_esxi_host_ip"></a> [esxi\_host\_ip](#input\_esxi\_host\_ip) | The IP address of the ESXi host | `string` | n/a | yes |
| <a name="input_esxi_network"></a> [esxi\_network](#input\_esxi\_network) | The deployment network name in ESXi | `string` | n/a | yes |
| <a name="input_esxi_password"></a> [esxi\_password](#input\_esxi\_password) | The password for the ESXi host | `string` | n/a | yes |
| <a name="input_esxi_username"></a> [esxi\_username](#input\_esxi\_username) | The username for the ESXi host | `string` | `"root"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name for the vcenter\_builder image | `string` | `"vcenter-builder-by-terraform"` | no |
| <a name="input_image_url"></a> [image\_url](#input\_image\_url) | URL to download the image from | `string` | `"http://192.168.200.100/mirror/jiajian.chi/os/base/vcsa_builder_compressed.qcow2"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name for the vcenter\_builder instance | `string` | `"vcenter_builder"` | no |
| <a name="input_instance_offering_name"></a> [instance\_offering\_name](#input\_instance\_offering\_name) | Name of the instance offering to use | `string` | `"min"` | no |
| <a name="input_l3_network_name"></a> [l3\_network\_name](#input\_l3\_network\_name) | Name of the L3 network to use | `string` | `"test"` | no |
| <a name="input_ssh_password"></a> [ssh\_password](#input\_ssh\_password) | SSH password for remote access | `string` | `"ZStack@123"` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | SSH username for remote access | `string` | `"zstack"` | no |
| <a name="input_vcenter_host_gateway"></a> [vcenter\_host\_gateway](#input\_vcenter\_host\_gateway) | The gateway IP for the vCenter appliance | `string` | n/a | yes |
| <a name="input_vcenter_host_ip"></a> [vcenter\_host\_ip](#input\_vcenter\_host\_ip) | The static IP address of the vCenter appliance | `string` | n/a | yes |
| <a name="input_vcenter_host_prefix"></a> [vcenter\_host\_prefix](#input\_vcenter\_host\_prefix) | The CIDR prefix (e.g., 24) for the vCenter network | `string` | `"16"` | no |
| <a name="input_vcenter_hostname"></a> [vcenter\_hostname](#input\_vcenter\_hostname) | The name of the vCenter VM to deploy | `string` | n/a | yes |
| <a name="input_vcenter_os_password"></a> [vcenter\_os\_password](#input\_vcenter\_os\_password) | Password for the vCenter OS root user | `string` | n/a | yes |
| <a name="input_vcenter_sso_password"></a> [vcenter\_sso\_password](#input\_vcenter\_sso\_password) | Password for the SSO administrator | `string` | n/a | yes |
| <a name="input_vcenter_version"></a> [vcenter\_version](#input\_vcenter\_version) | The version of vCenter to deploy (allowed: 6.0, 6.5, 6.7, 7.0, 8.0) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_submodule"></a> [submodule](#output\_submodule) | The message from submodule. |
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->