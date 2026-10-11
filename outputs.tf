output "colab_schedules_id" {
  description = "Map of id values across all colab_schedules, keyed the same as var.colab_schedules except keys with no id are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "colab_schedules_allow_queueing" {
  description = "Map of allow_queueing values across all colab_schedules, keyed the same as var.colab_schedules except keys with no allow_queueing are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.allow_queueing if v.allow_queueing != null }
}
output "colab_schedules_catch_up" {
  description = "Map of catch_up values across all colab_schedules, keyed the same as var.colab_schedules except keys with no catch_up are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.catch_up if v.catch_up != null }
}
output "colab_schedules_create_notebook_execution_job_request" {
  description = "Map of create_notebook_execution_job_request values across all colab_schedules, keyed the same as var.colab_schedules except keys with no create_notebook_execution_job_request are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => one(v.create_notebook_execution_job_request) if v.create_notebook_execution_job_request != null && length(v.create_notebook_execution_job_request) > 0 }
}
output "colab_schedules_create_pipeline_job_request" {
  description = "Map of create_pipeline_job_request values across all colab_schedules, keyed the same as var.colab_schedules except keys with no create_pipeline_job_request are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => one(v.create_pipeline_job_request) if v.create_pipeline_job_request != null && length(v.create_pipeline_job_request) > 0 }
}
output "colab_schedules_create_time" {
  description = "Map of create_time values across all colab_schedules, keyed the same as var.colab_schedules except keys with no create_time are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "colab_schedules_cron" {
  description = "Map of cron values across all colab_schedules, keyed the same as var.colab_schedules except keys with no cron are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.cron if v.cron != null && length(v.cron) > 0 }
}
output "colab_schedules_deletion_policy" {
  description = "Map of deletion_policy values across all colab_schedules, keyed the same as var.colab_schedules except keys with no deletion_policy are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "colab_schedules_desired_state" {
  description = "Map of desired_state values across all colab_schedules, keyed the same as var.colab_schedules except keys with no desired_state are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.desired_state if v.desired_state != null && length(v.desired_state) > 0 }
}
output "colab_schedules_display_name" {
  description = "Map of display_name values across all colab_schedules, keyed the same as var.colab_schedules except keys with no display_name are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "colab_schedules_end_time" {
  description = "Map of end_time values across all colab_schedules, keyed the same as var.colab_schedules except keys with no end_time are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.end_time if v.end_time != null && length(v.end_time) > 0 }
}
output "colab_schedules_last_pause_time" {
  description = "Map of last_pause_time values across all colab_schedules, keyed the same as var.colab_schedules except keys with no last_pause_time are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.last_pause_time if v.last_pause_time != null && length(v.last_pause_time) > 0 }
}
output "colab_schedules_last_resume_time" {
  description = "Map of last_resume_time values across all colab_schedules, keyed the same as var.colab_schedules except keys with no last_resume_time are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.last_resume_time if v.last_resume_time != null && length(v.last_resume_time) > 0 }
}
output "colab_schedules_last_scheduled_run_response" {
  description = "Map of last_scheduled_run_response values across all colab_schedules, keyed the same as var.colab_schedules except keys with no last_scheduled_run_response are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.last_scheduled_run_response if v.last_scheduled_run_response != null && length(v.last_scheduled_run_response) > 0 }
}
output "colab_schedules_location" {
  description = "Map of location values across all colab_schedules, keyed the same as var.colab_schedules except keys with no location are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.location if v.location != null && length(v.location) > 0 }
}
output "colab_schedules_max_concurrent_active_run_count" {
  description = "Map of max_concurrent_active_run_count values across all colab_schedules, keyed the same as var.colab_schedules except keys with no max_concurrent_active_run_count are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.max_concurrent_active_run_count if v.max_concurrent_active_run_count != null && length(v.max_concurrent_active_run_count) > 0 }
}
output "colab_schedules_max_concurrent_run_count" {
  description = "Map of max_concurrent_run_count values across all colab_schedules, keyed the same as var.colab_schedules except keys with no max_concurrent_run_count are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.max_concurrent_run_count if v.max_concurrent_run_count != null && length(v.max_concurrent_run_count) > 0 }
}
output "colab_schedules_max_run_count" {
  description = "Map of max_run_count values across all colab_schedules, keyed the same as var.colab_schedules except keys with no max_run_count are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.max_run_count if v.max_run_count != null && length(v.max_run_count) > 0 }
}
output "colab_schedules_name" {
  description = "Map of name values across all colab_schedules, keyed the same as var.colab_schedules except keys with no name are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "colab_schedules_next_run_time" {
  description = "Map of next_run_time values across all colab_schedules, keyed the same as var.colab_schedules except keys with no next_run_time are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.next_run_time if v.next_run_time != null && length(v.next_run_time) > 0 }
}
output "colab_schedules_project" {
  description = "Map of project values across all colab_schedules, keyed the same as var.colab_schedules except keys with no project are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.project if v.project != null && length(v.project) > 0 }
}
output "colab_schedules_start_time" {
  description = "Map of start_time values across all colab_schedules, keyed the same as var.colab_schedules except keys with no start_time are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.start_time if v.start_time != null && length(v.start_time) > 0 }
}
output "colab_schedules_started_run_count" {
  description = "Map of started_run_count values across all colab_schedules, keyed the same as var.colab_schedules except keys with no started_run_count are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.started_run_count if v.started_run_count != null && length(v.started_run_count) > 0 }
}
output "colab_schedules_state" {
  description = "Map of state values across all colab_schedules, keyed the same as var.colab_schedules except keys with no state are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.state if v.state != null && length(v.state) > 0 }
}
output "colab_schedules_update_time" {
  description = "Map of update_time values across all colab_schedules, keyed the same as var.colab_schedules except keys with no update_time are omitted"
  value       = { for k, v in google_colab_schedule.colab_schedules : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

