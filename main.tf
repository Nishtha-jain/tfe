provider "tfe" {
  hostname     = "app.terraform.io"
  organization = "Practise_terraform"
  token        = var.tfe_token
}

resource "null_resource" "set_tfe_variable" {
  provisioner "local-exec" {
    command = "./variable.sh"
  }
}

