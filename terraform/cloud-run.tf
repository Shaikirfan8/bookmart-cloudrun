resource "google_cloud_run_v2_service" "bookmart" {
  name     = "bookmart-service"
  location = var.region

  template {
    containers {
      image = "us-central1-docker.pkg.dev/my-project-007-499807/bookmart-repo/bookmart-nginx:v1"

      ports {
        container_port = 80
      }
    }
  }

  deletion_protection = false
}