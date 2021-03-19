provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "poc_mega_rg" {
  name     = "${var.environment}-${var.client}-rg"
  location = var.region
}

module "compute" {
  source  = "Azure/compute/azurerm"
  version = "3.11.0"

  resource_group_name = azurerm_resource_group.poc_mega_rg.name
  vm_os_id        = var.vm_image
  vnet_subnet_id      = module.network.vnet_subnets[0]
  ssh_key = var.path_to_sshkey
  depends_on = [azurerm_resource_group.poc_mega_rg]
  nb_data_disk = 1
  data_disk_size_gb = var.disk_size
  data_sa_type = var.disk_type
  vm_hostname = "${var.environment}-${var.client}-vm"
  vm_size = var.vm_size
  #TODO: PR to list remote_port or add the possibility to use comma separated values
  remote_port = "22-80"
  tags = {
    environment = var.environment
    client  = var.client
  }

}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.poc_mega_rg.name

  vnet_name           = "${var.environment}-${var.client}-vnet"
  address_space       = var.vnet_cidr
  subnet_prefixes     = var.subnets_cidr
  subnet_names        = var.subnets_name

  tags = {
    environment = var.environment
    client  = var.client
  }

  depends_on = [azurerm_resource_group.poc_mega_rg]
}

