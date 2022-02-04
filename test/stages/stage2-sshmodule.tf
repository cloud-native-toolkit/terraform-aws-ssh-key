module "sshmodul" {
  source      = "./module"
  name_prefix = var.name_prefix
  public_key  = var.public_key
  private_key = var.private_key
  rsa_bits    = var.rsa_bits
}
