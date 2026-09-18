terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "mystatefile-rg"
    storage_account_name = "mystatefile"
    container_name       = "preprodtfstate"
    key                  = "preprod.terraform.tfstate"
  }
}


