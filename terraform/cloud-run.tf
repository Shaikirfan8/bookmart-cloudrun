resource "google_cloud_run_v2_service" "bookmart" {
  name     = "bookmart-service"
  location = var.region

  template {
    containers {
      image = "us-central1-docker.pkg.dev/${var.project_id}/bookmart-repo/${var.image_name}:${var.image_tag}"

      ports {
        container_port = 80
      }
    }
  }

  deletion_protection = false
}