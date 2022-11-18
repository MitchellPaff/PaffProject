data "azuread_client_config" "current" {}

resource "azuread_application" "paffadapplication" {
  display_name = "paffadapplication"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "paff-service-principal2" {
  application_id               = azuread_application.paffadapplication.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}
