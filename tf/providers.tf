terraform {
  required_version = ">=0.12"

  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "pafftfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.32.0"
    }
  }
}
provider "azurerm" {
  features {}
}

