resource "google_cloud_run_service_iam_member" "public" {
  location = google_cloud_run_v2_service.bookmart.location
  service  = google_cloud_run_v2_service.bookmart.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}