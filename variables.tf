variable "project" {
  description = "Project Name"
  type        = string
  default     = "devops-project-340122"
}

variable "credentials_file" {
  default = "devops-project-340122-ed9ed2d41da6.json"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "bucket-name" {
  type        = string
  description = "terraform backend"
  default     = "mheathtf-bucket"

}

variable "storage-class" {
  type        = string
  description = "standard"
  default     = "standard"
}