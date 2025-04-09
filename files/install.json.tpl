{
  "__version": "2.13",
  "new_vcsa": {
    "esxi": {
      "hostname": "${esxi_host_ip}",               
      "username": "${esxi_username}",
      "password": "${esxi_password}",
      "deployment_network": "${esxi_network}",
      "datastore": "datastore1"
    },
    "appliance": {
      "thin_disk_mode": true,
      "deployment_option": "tiny",
      "name": "${vcenter_hostname}"
    },
    "network": {
      "mode": "static",
      "ip": "${vcenter_host_ip}",
      "gateway": "${vcenter_host_gateway}",
      "prefix": "${vcenter_host_prefix}",
      "ip_family": "ipv4",
      "dns_servers": ${jsonencode(dns_servers)}
    },
    "os": {
      "password": "${vcenter_os_password}",
      "ssh_enable": true,
      "time_tools_sync": true
    },
    "sso": {
      "password": "${vcenter_sso_password}",
      "domain_name": "vsphere.local"
    }
  },
  "ceip": {
    "settings": {
      "ceip_enabled": false
    }
  }
}
