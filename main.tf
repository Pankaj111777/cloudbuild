# resource "dbt_cloud_job" "test" {
#   environment_id = 217719
#   execute_steps = [
#     "dbt test"
#   ]
#   generate_docs        = false
#   is_active            = false
#   name                 = "Test"
#   num_threads          = 4
#   project_id           = 252603
#   run_generate_sources = false
#   target_name          = "default"
#   triggers = {
#     "custom_branch_only" : true,
#     "github_webhook" : false,
#     "git_provider_webhook" : false,
#     "schedule" : false
#   }
  # this is the default that gets set up when modifying jobs in the UI
#   schedule_days = [0, 1, 2, 3, 4, 5, 6]
#   schedule_type = "days_of_week"
# }
terraform {
  backend "gcs" {
    bucket  = "tf-dbt-state"
    prefix  = "terraform/state"
  }
}

resource "dbt_cloud_job" "apply" {
  environment_id = 217945
  execute_steps = [
    "dbt test"
  ]
  generate_docs        = false
  is_active            = true
  name                 = "apply"
  num_threads          = 4 #217945 == "217945" ? 5 : 6
  project_id           = 269764
  schedule_days = [4, 6]
  schedule_type = "days_of_week"
  run_generate_sources = false
  target_name          = "default"
  triggers = {
    "custom_branch_only" : true,
    "git_provider_webhook" = false
    "github_webhook" : false,
    "schedule" : true
  }
#   schedule_days = [0, 1, 2, 3, 4, 5, 6]
#   schedule_type = "days_of_week"    
}

resource "dbt_cloud_job" "test01" {
  environment_id = 217945
  execute_steps = [
    "dbt test"
  ]
  generate_docs        = false
  is_active            = true
  name                 = "test01"
  num_threads          = 4
  project_id           = 269764
  schedule_days = [2, 3, 5]
  schedule_type = "days_of_week"
  run_generate_sources = false
  target_name          = "default"
  triggers = {
    "custom_branch_only" : true,
    "git_provider_webhook" = false
    "github_webhook" : false,
    "schedule" : true
  }
#   schedule_days = [0, 1, 2, 3, 4, 5, 6]
#   schedule_type = "days_of_week"  
  
}

resource "dbt_cloud_job" "welcome" {
  environment_id = 217945
  execute_steps = [
    "dbt test"
  ]
  generate_docs        = false
  is_active            = true
  name                 = "welcome"
  num_threads          = 4
  project_id           = 269764
  schedule_cron = " 30 2 * * * "
  schedule_type = "custom_cron"
  run_generate_sources = false
  target_name          = "default"
  triggers = {
    "custom_branch_only" : true,
    "git_provider_webhook" = false
    "github_webhook" : false,
    "schedule" : true
  }
#   schedule_days = [0, 1, 2, 3, 4, 5, 6]
#   schedule_type = "days_of_week"  
  
}

# data "google_secret_manager_secret_version" "my_secret" {
#   provider = google-beta
#   secret = "projects/551523126163/secrets/dbt-cloud"
#   version = "1"
# }

# resource "dbt_cloud_job" "import" {
#   environment_id = 217945
#   execute_steps = [
#     "dbt test"
#   ]
#   generate_docs        = " "
#   is_active            = " "
#   name                 = " "
#   num_threads          = " "
#   project_id           = " "
#   schedule_cron = " "
#   schedule_type = " "
#   run_generate_sources = " "
#   target_name          = " "
#   triggers = {
#     "custom_branch_only" : " "
#     "git_provider_webhook" = " "
#     "github_webhook" : " "
#     "schedule" : " "
#   }
# }
