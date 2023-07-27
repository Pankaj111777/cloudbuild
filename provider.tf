# terraform {
# required_providers {
# dbt-cloud = {
# source = "registry.terraform.io/gthesheep/dbt-cloud"
# version = "0.1.0"
# }
# }
# }

# provider "dbt-cloud" {
# account_id = 172001
# token      = "57971f420385a8618893e235631bce2a7dcd62fd"
# host_url = "https://cloud.getdbt.com/api"
# }

terraform {
  required_providers {
    dbt = {
      source  = "GtheSheep/dbt-cloud"
      version = "0.1.0"
    }
  }
}

provider "dbt" {
  account_id  = 184401
  token    = "dbtc_CJXpZCAIsNEB25E8xbv60UGNKdSKV9iCV0jN-7W-Lqdi0ChH34"
}

# data "dbt_cloud_project" "dbt_cloud_project" {
#   project_id = 252603
# }
provider "google" {
  project = "etl-project-369516"
}

