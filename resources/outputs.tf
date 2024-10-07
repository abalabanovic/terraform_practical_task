output "cloud_function_self_link" {

  value       = google_cloudfunctions_function.cloud_function.name
  description = "Cloud function id"

}

