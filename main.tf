

module "vm" {
  source              = "./modules/vm"
  # source              = "Azure/vnet/azurerm"
  rg-name =     "hm-test1"
  vm-name =      "hm-vm1"
  vnet-rg =     "test"
  vnet  =       "test-vnet"
  subnet =      "default"
}
module "vm" {
  source              = "./modules/vm"
  # source              = "Azure/vnet/azurerm"
  rg-name =     "hm-test2"
  vm-name =      "hm-vm2"
  vnet-rg =     "test"
  vnet  =       "test-vnet"
  subnet =      "default"
}