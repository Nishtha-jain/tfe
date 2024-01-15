provider "tfe" {
  hostname     = "app.terraform.io"
  organization = "Practise_terraform"
  token        = var.tfe_token
}

variable "tfe_token" {
  description = "Terraform Enterprise API token"
}

resource "null_resource" "set_tfe_variable" {
  provisioner "local-exec" {
    command = "./set_tfe_variable.sh ${var.tfe_token}"
  }
}

