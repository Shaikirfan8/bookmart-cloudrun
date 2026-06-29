variable "project_id" {
  description = "my-project-007-499807"
  type        = string
}

variable "region" {
  description = "us-central1"
  type        = string
}

variable "image_name" {
  description = "Docker image name"
  type        = string
  default     = "bookmart-nginx"
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "v1"
}