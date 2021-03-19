// GLOBAL
variable "application_name" {
  type = string
}

variable "environment" {
  type = string
  default = "poc"
}

variable "client" {
  type = string
}

variable "region" {
  type = string
  default = "West Europe"
}

// NETWORK
variable "vnet_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnets_cidr" {
  type = list
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnets_name" {
  type = list
  default = ["subnet1", "subnet2", "subnet3"]
}

// VIRTUAL MACHINES
variable "disk_type" {
  type = string
  default = "Standard_LRS"
}

variable "disk_size" {
  type = number
  default = 10
}

variable "vm_size" {
  type = string
  default = "Standard_B1ls"
}

variable "vm_image" {
  type = string
  default = "/subscriptions/088de0df-dacc-46b9-8e67-f92a2004e935/resourceGroups/MegaResourceGroup/providers/Microsoft.Compute/images/MegaHttpServer"
}

variable "path_to_sshkey" {
  type = string
  default = "~/IdeaProjects/custom-keys/id_rsa.pub"
}

