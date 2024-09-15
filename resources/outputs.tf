output "cloud_function_self_link" {
  
  value = google_cloudfunctions_function.cloud_function.id
  description = "Cloud function id"

}

