
resource "google_compute_network" "private_vpc" {
  
    name = var.network_name
    auto_create_subnetworks = false
    project = var.project
    
}

resource "google_compute_subnetwork" "custom_subnet" {

    name = var.subnetwork_name
    network = google_compute_network.private_vpc.id
    ip_cidr_range = var.cidr_range
    region = var.region
  
}

resource "google_compute_global_address" "lb_address" {
  name = "lb-ip"
}

/*

resource "google_compute_region_network_endpoint_group" "serverless_network_endpoint_group" {

  network_endpoint_type = "SERVERLESS"
  region = var.region
  name = "serverless-endpoint"
  cloud_function {
    function = var.cloudfunction_id
  }
  
}

resource "google_compute_forwarding_rule" "http_forwarding_rule" {
  name       = "http-forwarding-rule"
  target     = google_compute_target_http_proxy.http_proxy.self_link
  port_range = "80"
  ip_address = google_compute_global_address.lb_address.address
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name       = "http-proxy"
  url_map    = google_compute_url_map.url_map.self_link
}

resource "google_compute_url_map" "url_map" {
  name            = "url-map"
  default_service = google_compute_backend_service.backend_service.self_link
}

resource "google_compute_backend_service" "backend_service" {
  name = "backend-service"

  backend {
    group = google_compute_region_network_endpoint_group.serverless_network_endpoint_group.id
  }


}

*/



