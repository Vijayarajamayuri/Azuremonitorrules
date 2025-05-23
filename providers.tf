terraform {
  required_version = ">= 1.3"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.28.0"
    }
  }

}

provider "azurerm" {
  features {}
  subscription_id = "105294a7-6583-4501-b4e9-106e979d05e9"
  tenant_id = "7335011f-1748-4902-8dee-6f4dac036859"
}
