provider "google" {

    credentials = file("abalabanovic-private.json")
    project = "devops-t2-development"
    region = "us-central1"
    zone = "us-central1-a"
  
}

module "resource" {

    source = "./resources"
    bucket_name = "abalabanovic-bucket-cloud-function"
    secret_value = "123456789"
    cloud_function_name = "abalabanovic-cloud-function"
    secret_id = "abalabanovic-secret"
    cloud_function_runtime = "nodejs20"
    cloud_function_available_memory = 256
    cloud_function_entrypoint = "readSecret"
    cloud_function_timeout = 60
    source_function = "function.zip"
    project_id = "devops-t2-development"
    source_function_bucket = "cloud_function_test_abalabanovic"

  
}

module "network" {

    source = "./network"
    project = "devops-t2-development"
    subnetwork_name = "abalabanovic-subnet"
    network_name = "abalabanovic-vpc"
    cidr_range = "10.0.0.0/24"
    cloudfunction_id = module.resource.cloud_function_self_link
  
}

