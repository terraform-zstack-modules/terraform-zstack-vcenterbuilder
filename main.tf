locals {
  context = var.context
}

module "vcenter_builder_image" {
  source = "git::http://172.20.14.17/jiajian.chi/terraform-zstack-image.git"

  create_image        = var.create_image
  image_name          = var.image_name
  image_url           = var.image_url
  guest_os_type      = "Centos 7"
  platform           = "Linux"
  format             = "qcow2"
  architecture       = "x86_64"

  backup_storage_name = var.backup_storage_name
}

module "vcenter_builder_instance" {
  source = "git::http://172.20.14.17/jiajian.chi/terraform-zstack-instance.git"

  name                  = var.instance_name
  description           = "Created by Terraform devops"
  instance_count        = 1
  image_uuid            = module.vcenter_builder_image.image_uuid
  l3_network_name       = var.l3_network_name
  instance_offering_name = var.instance_offering_name
}

resource "local_file" "install_json" {
  content = templatefile("${path.module}/files/install.json.tpl", {
    esxi_host_ip         = var.esxi_host_ip
    esxi_username        = var.esxi_username
    esxi_password        = var.esxi_password
    esxi_network         = var.esxi_network
    vcenter_hostname     = var.vcenter_hostname
    vcenter_host_ip      = var.vcenter_host_ip
    vcenter_host_gateway = var.vcenter_host_gateway
    vcenter_host_prefix  = var.vcenter_host_prefix
    dns_servers          = var.dns_servers
    vcenter_os_password  = var.vcenter_os_password
    vcenter_sso_password = var.vcenter_sso_password
  })
  filename = "${path.module}/install.json"
}

resource "terraform_data" "remote_exec" {
  depends_on = [module.vcenter_builder_instance, local_file.install_json]

  connection {
      type     = "ssh"
      host     = module.vcenter_builder_instance.instance_ips[0]
      user     = var.ssh_user
      password = var.ssh_password
      timeout  = "5m"
  }
  provisioner "file" {
    source      = "${path.module}/install.json"
    destination = "/home/zstack/vcsa/install.json"
    on_failure = fail
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "cd /home/zstack/vcsa/${var.vcenter_version}/vcsa-cli-installer/lin64",
      "./vcsa-deploy install --accept-eula --no-ssl-certificate-verification /home/zstack/vcsa/install.json"
    ]
    on_failure = fail
  }

}