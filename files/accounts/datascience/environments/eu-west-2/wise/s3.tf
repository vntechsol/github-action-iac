module "s3_bucket" {
  #source = "git::ssh:https://github.com/vntechsol/github_action_iac_ssh_key//modules/s3/bucket" # private repo with HTTPS secrets.ASK_FOR_PASS
  source = "git::ssh://git@github.com/vntechsol/github_action_iac_ssh_key//modules/s3/bucket?ref=main" # private repo with SSH and add ?ref=featurebranch name

  enabled        = true
  s3_bucket_name = "infra-test-s3bucket"
  additional_tags = {
    "Cost Centre" = "INFRA"
    Product       = "INFRA"
    Service       = "IaC"
  }
}
