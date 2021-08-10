
#use module to create new vm with name and also create new RG
module "vm1" {
  source              = "./modules/vm"
  # source              = "Azure/vnet/azurerm"
  rg-name =     "hm-test1"
  vm-name =      "hm-vm1"
  vnet-rg =     "test"
  vnet  =       "test-vnet"
  subnet =      "default"
  tags = {
    environment = "test"
    project   = "AVM"
    owner     = "kla"
   }
}

#call again the module to create second vm with different name and RG but vnet/vnetRG/subnet will be same
# module "vm2" {
#   source              = "./modules/vm"
#   # source              = "Azure/vnet/azurerm"
#   rg-name =     "hm-test1"
#   vm-name =      "hm-vm1"
#   vnet-rg =     "test"
#   vnet  =       "test-vnet"
#   subnet =      "default"
#   tags = {
#     environment = "test"
#     project   = "AVM"
#     owner     = "kla"
#    }
# }