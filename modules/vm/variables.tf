# variable "subscription_id" {
#     type = string
#     description = "Variable for our resource group"
# }
# variable "tenant_id" {
#     type = string
#     description = "Variable for our resource group"
# }
# variable "client_id" {
#     type = string
#     description = "Variable for our resource group"
# }
# variable "client_secret" {
#     type = string
#     description = "Variable for our resource group"
# }




variable "rg-name" {
    type = string
    description = "name of your resource group"

}
variable "location" {
    type = string
    description = "location of your resource group"
    default = "westus2"
}

variable "prefix" {
  default = "avm"
}

variable "vm-name" {
  type = string
  description = "virtual machine name"
}

# variable "rg-name" {
#   type = string
#   description = "resource group name"
# }

variable "vnet-rg" {
  type = string
  description = "target virutal network resource group"
}

variable "vnet" {
  type = string
  description = "target virutal network "
}
variable "subnet" {
  type = string
  description = "target virutal network subnet name"
}
# variable "nic" {
#   type = string
#   description = "virtual network card name"
# }
# variable "nic-ip-name" {
#   type = string
#   description = "virtual network card ip name"
# }
# variable "nsg-name" {
#   type = string
#   description = "virtual network security group name"
# }

# variable "tags" {
#   type = map(string)
#   description = "tags for resources"
#   default = {
#     environment = "dev"
#     cost-center = ""
#     Project = "AVM"
#   }
# }