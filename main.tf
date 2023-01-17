
module "aks_west" {
  source   = "./modules/cluster"
  location = "westeurope"
}

module "aks_north" {
  source   = "./modules/cluster"
  location = "northeurope"
}

