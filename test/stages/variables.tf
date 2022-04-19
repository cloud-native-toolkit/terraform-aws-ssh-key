variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "access_key" {
  type    = string
  default = ""
}

variable "secret_key" {
  type    = string
  default = ""
}

variable "name_prefix" {
  type        = string
  default     = "swe"
  description = "name prefix"
}


variable "public_key_file" {
  type    = string
  default = ""
}

variable "private_key_file" {
  type    = string
  default = ""
}

variable "public_key" {
  type    = string
  default = ""
}

variable "private_key" {
  type    = string
  default = ""
}

variable "rsa_bits" {
  type    = number
  default = 3072
}

variable "prefix_name" {
  type        = string
  description = "Prefix to be added to the names of resources which are being provisioned"
  default     = "swe"
}