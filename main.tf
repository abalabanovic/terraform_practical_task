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
    cloud_function_runtime = "python39"
    cloud_function_available_memory = 256
    cloud_function_entrypoint = "hello_world"
    cloud_function_timeout = 60
    source_function = "function_source.zip"
    project_id = "devops-t2-development"

  
}

module "network" {

    source = "./network"
    project = "terraform-abalabanovic-tfstate"
    subnetwork_name = "abalabanovic-subnet"
    network_name = "abalabanovic-vpc"
    group_selflink = module.resource.cloud_function_self_link
  
}

