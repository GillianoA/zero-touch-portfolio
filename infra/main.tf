terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cf1ce690-408e-40c4-915e-5c035dd21cb8"
}

# 1. Resource Group: The logical container for all our resources
resource "azurerm_resource_group" "rg" {
  name     = "portfolio-rg"
  location = "East US"
}

# 2. Random Suffix: Ensures our registry name is unique globally
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

# 3. Azure Container Registry (ACR): The private garage for your images
resource "azurerm_container_registry" "acr" {
  name                = "portfolioacr${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic" # "Basic" is cheapest and sufficient for personal projects
  admin_enabled       = true    # Allows simple authentication for GitHub Actions later
}

# Output the registry name so we know where to push later
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}