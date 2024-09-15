variable "network_name" {
  
    type = string
    description = "Name for VPC"

}

variable "subnetwork_name" {

    type = string
    description = "Name for subnet"
  
}

variable "cidr_range" {

    type = string
    description = "IP range for custom subnet"
    default = "10.0.0.0/0"
  
}

variable "region" {

    type = string
    description = "Region"
    default = "us-central1"
  
}

variable "project" {

    type = string
    description = "Project ID"

}

variable "group_selflink" {

    description = "Self link for backend"
  
}