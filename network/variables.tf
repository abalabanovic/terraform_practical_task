variable "network_name" {

  type        = string
  description = "Name for VPC"

}

variable "subnetwork_name" {

  type        = string
  description = "Name for subnet"

}

variable "cidr_range" {

  type        = string
  description = "IP range for custom subnet"
  default     = "10.0.0.0/0"

}

variable "region" {

  type        = string
  description = "Region"
  default     = "us-central1"

}

variable "project" {

  type        = string
  description = "Project ID"

}

variable "cloudfunction_id" {

  description = "Id of cloud function"

}

variable "auto_create_subnetworks" {

  type = bool

}

variable "lb_ip_name" {

  type = string

}

variable "network_endpoint_type" {

  type    = string
  default = "SERVERLESS"

}

variable "network_endpoint_name" {

  type = string

}

variable "forwarding_rule_name" {

  type = string

}

variable "forwarding_rule_port" {

  type = string

}

variable "load_balancing_scheme" {

  type    = string
  default = "EXTERNAL"

}

variable "backend_service_name" {

  type = string

}

variable "url_map_name" {

  type = string

}

variable "http_proxy_name" {

  type = string

}

