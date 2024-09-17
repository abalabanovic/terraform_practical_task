terraform {
  backend "gcs" {

    bucket = "terraform-abalabanovic-tfstate"
    prefix = "terraform/state"
    credentials = "abalabanovic-private.json"
    
  }
}