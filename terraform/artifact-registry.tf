resource "google_artifact_registry_repository" "bookmart_repo" {
  location      = var.region
  repository_id = "bookmart-repo"
  description   = "Artifact Registry for BookMart Cloud Run"
  format        = "DOCKER"
}