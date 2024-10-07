provider "google" {

  credentials = file("abalabanovic-private.json")
  project     = "devops-t2-development"
  region      = "us-central1"
  zone        = "us-central1-a"

}

module "resource" {

  source                          = "./resources"
  secret_value                    = "123456789"
  cloud_function_name             = "abalabanovic-cloud-function"
  secret_id                       = "abalabanovic-secret"
  cloud_function_runtime          = "nodejs20"
  cloud_function_available_memory = 256
  cloud_function_entrypoint       = "readSecret"
  cloud_function_timeout          = 60
  source_function                 = "function.zip"
  project_id                      = "devops-t2-development"
  #Bucket where the application source code is stored
  source_function_bucket              = "cloud_function_test_abalabanovic"
  cloud_function_service_account_name = "cloud-function-service-account"
  cloud_function_trigger_http         = true
  bucket_location = "us-central1"
  bucket_name = "abalabanovic-read-bucket"
  


}

module "network" {

  source                  = "./network"
  project                 = "devops-t2-development"
  subnetwork_name         = "abalabanovic-subnet"
  network_name            = "abalabanovic-vpc"
  cidr_range              = "10.0.0.0/24"
  cloudfunction_id        = module.resource.cloud_function_self_link
  auto_create_subnetworks = false
  lb_ip_name              = "lb-ip"
  network_endpoint_type   = "SERVERLESS"
  network_endpoint_name   = "serverless-endpoint"
  forwarding_rule_name    = "http-forwarding-rule"
  load_balancing_scheme   = "EXTERNAL"
  backend_service_name    = "backend-service"
  url_map_name            = "url-map"
  http_proxy_name         = "http-proxy"
  forwarding_rule_port    = "80"
}

