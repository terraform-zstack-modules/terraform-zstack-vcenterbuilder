#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}

variable "image_name" {
  description = "Name for the vcenter_builder image"
  type        = string
  default     = "vcenter-builder-by-terraform"
}

variable "image_url" {
  description = "URL to download the image from"
  type        = string
  default     = "http://minio.zstack.io:9001/packer/keycloak-by-packer-image-compressed.qcow2"
}

variable "backup_storage_name" {
  description = "Name of the backup storage to use"
  type        = string
  default     = "bs"
}


variable "instance_name" {
  description = "Name for the vcenter_builder instance"
  type        = string
  default     = "vcenter_builder"
}

variable "l3_network_name" {
  description = "Name of the L3 network to use"
  type        = string
  default     = "test"
}

variable "instance_offering_name" {
  description = "Name of the instance offering to use"
  type        = string
  default     = "min"
}

variable "ssh_user" {
  description = "SSH username for remote access"
  type        = string
  default     = "zstack"
}

variable "ssh_password" {
  description = "SSH password for remote access"
  type        = string
  default     = "ZStack@123"
  sensitive   = true
}

variable "esxi_host_ip" {
  type        = string
  description = "The IP address of the ESXi host"
}

variable "esxi_username" {
  type        = string
  description = "The username for the ESXi host"
  default     = "root"
}

variable "esxi_password" {
  type        = string
  description = "The password for the ESXi host"
  sensitive   = true
}

variable "esxi_network" {
  type        = string
  description = "The deployment network name in ESXi"
}

variable "vcenter_hostname" {
  type        = string
  description = "The name of the vCenter VM to deploy"
}

variable "vcenter_host_ip" {
  type        = string
  description = "The static IP address of the vCenter appliance"
}

variable "vcenter_host_gateway" {
  type        = string
  description = "The gateway IP for the vCenter appliance"
}

variable "vcenter_host_prefix" {
  type        = string
  description = "The CIDR prefix (e.g., 24) for the vCenter network"
  default     = "16"
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS server IPs"
  default     = ["223.5.5.5"] 
}

variable "vcenter_os_password" {
  type        = string
  description = "Password for the vCenter OS root user"
  sensitive   = true
}

variable "vcenter_sso_password" {
  type        = string
  description = "Password for the SSO administrator"
  sensitive   = true
}

variable "vcenter_version" {
  type        = string
  description = "The version of vCenter to deploy (allowed: 6.0, 6.5, 6.7, 7.0, 8.0)"

  validation {
    condition     = contains(["6.0", "6.5", "6.7", "7.0", "8.0"], var.vcenter_version)
    error_message = "vcenter_version must be one of: 6.0, 6.5, 6.7, 7.0, 8.0"
  }
}
