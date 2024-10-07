variable "bucket_name" {

  type        = string
  description = "Name for bucket"

}

variable "bucket_location" {

  type        = string
  description = "Bucket location"
  default     = "us-central1"

}

variable "project_id" {

  type        = string
  description = "Project ID"

}

variable "secret_id" {

  type        = string
  description = "Secret id"

}

variable "secret_value" {

  type        = string
  description = "Secret value"

}

variable "cloud_function_name" {

  type        = string
  description = "Cloud function name"

}

variable "cloud_function_runtime" {

  type        = string
  description = "Runtime for cloud function"

}

variable "region" {

  type        = string
  description = "Region"
  default     = "us-central1"

}

variable "cloud_function_entrypoint" {

  type    = string
  default = "hello_world"

}

variable "cloud_function_available_memory" {

  type        = number
  description = "Memory for cloud function"
  default     = 256

}

variable "cloud_function_timeout" {

  type        = number
  description = "Timeout"
  default     = 60

}

variable "source_function" {

  type        = string
  description = "Function source code"

}

variable "source_function_bucket" {

  type        = string
  description = "Bucket where the source code is stored"

}

variable "cloud_function_trigger_http" {

  type    = bool
  default = true

}

variable "cloud_function_service_account_name" {

  type = string

}