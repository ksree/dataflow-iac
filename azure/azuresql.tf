provider "azurerm" {
  version = "=2.2.0"
  features {}
}

resource "azurerm_resource_group" "dataflow" {
  name     = "dataflowazureresourcegroup"
  location = "West US"
}

resource "azurerm_sql_server" "dataflow" {
  name                         = "dataflowazuresqlserver"
  resource_group_name          = azurerm_resource_group.dataflow.name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_account" "dataflow" {
  name                     = "dataflowstorageaccount"
  resource_group_name      = azurerm_resource_group.dataflow.name
  location                 = azurerm_resource_group.dataflow.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_sql_database" "dataflow" {
  name                = "dataflowazuresqldatabase"
  resource_group_name = azurerm_resource_group.dataflow.name
  location            = "West US"
  server_name         = azurerm_sql_server.dataflow.name

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.dataflow.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.dataflow.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }

  tags = {
    environment = "dev"
  }
}
