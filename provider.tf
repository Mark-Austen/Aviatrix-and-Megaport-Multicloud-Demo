terraform {
  required_providers {
    megaport = {
      source  = "megaport/megaport"
      version = "1.3.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.92.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
}

provider "megaport" {
  access_key            = "<access_key>"
  secret_key            = "<secret_key>"
  accept_purchase_terms = true
  environment           = "production"
}

provider "aws" {
  region = var.aws_region_1
  access_key = "<access_key>"
  secret_key = "<secret_key>"
}

provider "azurerm" {
  features {} 
}
