output "usrprikey" {
  value     = tls_private_key.privatekey.private_key_pem
  sensitive = true
}
output "usrpubkey" {
  value = aws_key_pair.publickey.public_key
  sensitive = true
}
