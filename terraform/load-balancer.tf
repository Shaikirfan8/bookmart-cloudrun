resource "google_compute_region_network_endpoint_group" "bookmart_neg" {
  name                  = "bookmart-serverless-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region

  cloud_run {
    service = google_cloud_run_v2_service.bookmart.name
  }
}

resource "google_compute_backend_service" "bookmart_backend" {
  name                  = "bookmart-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"

  backend {
    group = google_compute_region_network_endpoint_group.bookmart_neg.id
  }
}

resource "google_compute_url_map" "bookmart_url_map" {
  name            = "bookmart-url-map"
  default_service = google_compute_backend_service.bookmart_backend.id
}

resource "google_compute_target_http_proxy" "bookmart_http_proxy" {
  name    = "bookmart-http-proxy"
  url_map = google_compute_url_map.bookmart_url_map.id
}

resource "google_compute_global_forwarding_rule" "bookmart_http" {
  name                  = "bookmart-http-forwarding-rule"
  target                = google_compute_target_http_proxy.bookmart_http_proxy.id
  port_range            = "80"
  load_balancing_scheme = "EXTERNAL_MANAGED"
}