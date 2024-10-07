
resource "google_secret_manager_secret" "my_secret" {

  secret_id = var.secret_id
  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }

}

resource "google_storage_bucket" "my_bucket" {

  name          = var.bucket_name
  location      = var.bucket_location
  force_destroy = true


}

resource "google_secret_manager_secret_version" "my_secret_version" {

  secret      = google_secret_manager_secret.my_secret.id
  secret_data = var.secret_value

}

resource "google_service_account" "cloud_function_service_account" {
  account_id   = var.cloud_function_service_account_name
  display_name = "Cloud Function Service Account"
}

resource "google_project_iam_member" "secret_manager_access" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.cloud_function_service_account.email}"
}

resource "google_project_iam_member" "storage_object_viewer" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.cloud_function_service_account.email}"

}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = var.project_id
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers" # Allows unauthenticated access
  cloud_function = google_cloudfunctions_function.cloud_function.id
}


resource "google_cloudfunctions_function" "cloud_function" {

  name                  = var.cloud_function_name
  runtime               = var.cloud_function_runtime
  entry_point           = var.cloud_function_entrypoint
  region                = var.region
  source_archive_bucket = var.source_function_bucket
  source_archive_object = var.source_function
  trigger_http          = var.cloud_function_trigger_http
  available_memory_mb   = var.cloud_function_available_memory
  timeout               = var.cloud_function_timeout
  environment_variables = {

    SECRET_ID = google_secret_manager_secret.my_secret.secret_id

  }

  service_account_email = google_service_account.cloud_function_service_account.email

}


