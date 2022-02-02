locals {
  name_prefix        = lower(var.name_prefix)
  name               = var.name != "" ? var.name : "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-${var.label}"
  keys_provided      = var.public_key != ""
  key_files_provided = var.public_key_file != "" && var.private_key_file != ""
  public_key         = var.public_key_file != "" ? file(var.public_key_file) : (local.keys_provided ? var.public_key : trimspace(tls_private_key.privatekey.public_key_openssh))
  private_key        = var.private_key_file != "" ? file(var.private_key_file) : (local.keys_provided ? var.private_key : trimspace(tls_private_key.privatekey.private_key_pem))
}

resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "publickey" {
  key_name = local.name
  public_key = local.public_key
  tags = {
    Name = "swe-key"
  }
}

resource null_resource save_keys {
  provisioner "local-exec" {
     command = "echo '${tls_private_key.privatekey.private_key_pem}' > swe-pri-key"
  }
  provisioner "local-exec" {
     command = "echo '${aws_key_pair.publickey.public_key}' > swe-pub-key"
  }
}
