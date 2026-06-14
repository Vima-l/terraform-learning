variable "bucket_name" {
  description = "Bucket name"
  type = string
}

variable "tags" {
  description = "Tags for bucket"
  type = map(string)
  default = {}
}