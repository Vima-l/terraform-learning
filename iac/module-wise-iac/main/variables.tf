variable "bucket_name" {
  description = "Bucket name"
  type = string
}

variable "tags" {
  description = "Tags for bucket"
  type = map(string)
  default = {}
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}