
resource "google_compute_network" "private_vpc" {

  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  project                 = var.project

}

resource "google_compute_subnetwork" "custom_subnet" {

  name          = var.subnetwork_name
  network       = google_compute_network.private_vpc.id
  ip_cidr_range = var.cidr_range
  region        = var.region

}

resource "google_compute_global_address" "lb_address" {
  name = var.lb_ip_name
}


resource "google_compute_region_network_endpoint_group" "serverless_network_endpoint_group" {

  network_endpoint_type = var.network_endpoint_type
  region                = var.region
  name                  = var.network_endpoint_name
  cloud_function {
    function = var.cloudfunction_id
  }

}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name                  = var.forwarding_rule_name
  target                = google_compute_target_http_proxy.http_proxy.self_link
  port_range            = var.forwarding_rule_port
  ip_address            = google_compute_global_address.lb_address.address
  load_balancing_scheme = var.load_balancing_scheme
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = var.http_proxy_name
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_url_map" "url_map" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.backend_service.self_link
}

resource "google_compute_backend_service" "backend_service" {
  name = var.backend_service_name

  backend {
    group = google_compute_region_network_endpoint_group.serverless_network_endpoint_group.id
  }


}





