variable "region" {
  type    = string
  default = "us-west-1"
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

variable "name" {
  type    = string
  default = ""
}
variable "label" {
  default = "prd"
  type    = string
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

