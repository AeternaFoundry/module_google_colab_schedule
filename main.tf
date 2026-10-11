resource "google_colab_schedule" "colab_schedules" {
  for_each = var.colab_schedules

  cron                            = each.value.cron
  display_name                    = each.value.display_name
  location                        = each.value.location
  max_concurrent_run_count        = each.value.max_concurrent_run_count
  allow_queueing                  = each.value.allow_queueing
  deletion_policy                 = each.value.deletion_policy
  desired_state                   = each.value.desired_state
  end_time                        = each.value.end_time
  max_concurrent_active_run_count = each.value.max_concurrent_active_run_count
  max_run_count                   = each.value.max_run_count
  project                         = each.value.project
  start_time                      = each.value.start_time

  dynamic "create_notebook_execution_job_request" {
    for_each = each.value.create_notebook_execution_job_request != null ? [each.value.create_notebook_execution_job_request] : []
    content {
      notebook_execution_job {
        dynamic "custom_environment_spec" {
          for_each = create_notebook_execution_job_request.value.notebook_execution_job.custom_environment_spec != null ? [create_notebook_execution_job_request.value.notebook_execution_job.custom_environment_spec] : []
          content {
            dynamic "machine_spec" {
              for_each = custom_environment_spec.value.machine_spec != null ? [custom_environment_spec.value.machine_spec] : []
              content {
                accelerator_count  = machine_spec.value.accelerator_count
                accelerator_type   = machine_spec.value.accelerator_type
                gpu_partition_size = machine_spec.value.gpu_partition_size
                machine_type       = machine_spec.value.machine_type
                dynamic "reservation_affinity" {
                  for_each = machine_spec.value.reservation_affinity != null ? [machine_spec.value.reservation_affinity] : []
                  content {
                    key                       = reservation_affinity.value.key
                    reservation_affinity_type = reservation_affinity.value.reservation_affinity_type
                    use_reservation_pool      = reservation_affinity.value.use_reservation_pool
                    values                    = reservation_affinity.value.values
                  }
                }
                tpu_topology = machine_spec.value.tpu_topology
              }
            }
            dynamic "network_spec" {
              for_each = custom_environment_spec.value.network_spec != null ? [custom_environment_spec.value.network_spec] : []
              content {
                enable_internet_access = network_spec.value.enable_internet_access
                network                = network_spec.value.network
                subnetwork             = network_spec.value.subnetwork
              }
            }
            dynamic "persistent_disk_spec" {
              for_each = custom_environment_spec.value.persistent_disk_spec != null ? [custom_environment_spec.value.persistent_disk_spec] : []
              content {
                disk_size_gb = persistent_disk_spec.value.disk_size_gb
                disk_type    = persistent_disk_spec.value.disk_type
              }
            }
          }
        }
        dynamic "dataform_repository_source" {
          for_each = create_notebook_execution_job_request.value.notebook_execution_job.dataform_repository_source != null ? [create_notebook_execution_job_request.value.notebook_execution_job.dataform_repository_source] : []
          content {
            commit_sha                        = dataform_repository_source.value.commit_sha
            dataform_repository_resource_name = dataform_repository_source.value.dataform_repository_resource_name
          }
        }
        display_name = create_notebook_execution_job_request.value.notebook_execution_job.display_name
        dynamic "encryption_spec" {
          for_each = create_notebook_execution_job_request.value.notebook_execution_job.encryption_spec != null ? [create_notebook_execution_job_request.value.notebook_execution_job.encryption_spec] : []
          content {
            kms_key_name = encryption_spec.value.kms_key_name
          }
        }
        execution_timeout = create_notebook_execution_job_request.value.notebook_execution_job.execution_timeout
        execution_user    = create_notebook_execution_job_request.value.notebook_execution_job.execution_user
        dynamic "gcs_notebook_source" {
          for_each = create_notebook_execution_job_request.value.notebook_execution_job.gcs_notebook_source != null ? [create_notebook_execution_job_request.value.notebook_execution_job.gcs_notebook_source] : []
          content {
            generation = gcs_notebook_source.value.generation
            uri        = gcs_notebook_source.value.uri
          }
        }
        gcs_output_uri                          = create_notebook_execution_job_request.value.notebook_execution_job.gcs_output_uri
        kernel_name                             = create_notebook_execution_job_request.value.notebook_execution_job.kernel_name
        labels                                  = create_notebook_execution_job_request.value.notebook_execution_job.labels
        notebook_runtime_template_resource_name = create_notebook_execution_job_request.value.notebook_execution_job.notebook_runtime_template_resource_name
        service_account                         = create_notebook_execution_job_request.value.notebook_execution_job.service_account
        dynamic "workbench_runtime" {
          for_each = create_notebook_execution_job_request.value.notebook_execution_job.workbench_runtime != null ? [create_notebook_execution_job_request.value.notebook_execution_job.workbench_runtime] : []
          content {
          }
        }
      }
      parent = create_notebook_execution_job_request.value.parent
    }
  }

  dynamic "create_pipeline_job_request" {
    for_each = each.value.create_pipeline_job_request != null ? [each.value.create_pipeline_job_request] : []
    content {
      parent = create_pipeline_job_request.value.parent
      pipeline_job {
        display_name = create_pipeline_job_request.value.pipeline_job.display_name
        dynamic "encryption_spec" {
          for_each = create_pipeline_job_request.value.pipeline_job.encryption_spec != null ? [create_pipeline_job_request.value.pipeline_job.encryption_spec] : []
          content {
            kms_key_name = encryption_spec.value.kms_key_name
          }
        }
        labels                = create_pipeline_job_request.value.pipeline_job.labels
        network               = create_pipeline_job_request.value.pipeline_job.network
        pipeline_spec         = create_pipeline_job_request.value.pipeline_job.pipeline_spec
        preflight_validations = create_pipeline_job_request.value.pipeline_job.preflight_validations
        dynamic "psc_interface_config" {
          for_each = create_pipeline_job_request.value.pipeline_job.psc_interface_config != null ? [create_pipeline_job_request.value.pipeline_job.psc_interface_config] : []
          content {
            dynamic "dns_peering_configs" {
              for_each = psc_interface_config.value.dns_peering_configs != null ? psc_interface_config.value.dns_peering_configs : []
              content {
                domain         = dns_peering_configs.value.domain
                target_network = dns_peering_configs.value.target_network
                target_project = dns_peering_configs.value.target_project
              }
            }
            network_attachment = psc_interface_config.value.network_attachment
          }
        }
        reserved_ip_ranges = create_pipeline_job_request.value.pipeline_job.reserved_ip_ranges
        dynamic "runtime_config" {
          for_each = create_pipeline_job_request.value.pipeline_job.runtime_config != null ? [create_pipeline_job_request.value.pipeline_job.runtime_config] : []
          content {
            failure_policy       = runtime_config.value.failure_policy
            gcs_output_directory = runtime_config.value.gcs_output_directory
            parameter_values     = runtime_config.value.parameter_values
          }
        }
        service_account = create_pipeline_job_request.value.pipeline_job.service_account
        template_uri    = create_pipeline_job_request.value.pipeline_job.template_uri
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

