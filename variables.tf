variable "colab_schedules" {
  description = <<EOT
Map of colab_schedules, attributes below
Required:
    - cron
    - display_name
    - location
    - max_concurrent_run_count
Optional:
    - allow_queueing
    - deletion_policy
    - desired_state
    - end_time
    - max_concurrent_active_run_count
    - max_run_count
    - project
    - start_time
    - create_notebook_execution_job_request (block):
        - notebook_execution_job (required, block):
            - custom_environment_spec (optional, block):
                - machine_spec (optional, block):
                    - accelerator_count (optional)
                    - accelerator_type (optional)
                    - gpu_partition_size (optional)
                    - machine_type (optional)
                    - reservation_affinity (optional, block):
                        - key (optional)
                        - reservation_affinity_type (required)
                        - use_reservation_pool (optional)
                        - values (optional)
                    - tpu_topology (optional)
                - network_spec (optional, block):
                    - enable_internet_access (optional)
                    - network (optional)
                    - subnetwork (optional)
                - persistent_disk_spec (optional, block):
                    - disk_size_gb (optional)
                    - disk_type (optional)
            - dataform_repository_source (optional, block):
                - commit_sha (optional)
                - dataform_repository_resource_name (required)
            - display_name (required)
            - encryption_spec (optional, block):
                - kms_key_name (required)
            - execution_timeout (optional)
            - execution_user (optional)
            - gcs_notebook_source (optional, block):
                - generation (optional)
                - uri (required)
            - gcs_output_uri (required)
            - kernel_name (optional)
            - labels (optional)
            - notebook_runtime_template_resource_name (optional)
            - service_account (optional)
            - workbench_runtime (optional, block):
        - parent (optional)
    - create_pipeline_job_request (block):
        - parent (optional)
        - pipeline_job (required, block):
            - display_name (optional)
            - encryption_spec (optional, block):
                - kms_key_name (required)
            - labels (optional)
            - network (optional)
            - pipeline_spec (optional)
            - preflight_validations (optional)
            - psc_interface_config (optional, block):
                - dns_peering_configs (optional, block):
                    - domain (required)
                    - target_network (required)
                    - target_project (required)
                - network_attachment (optional)
            - reserved_ip_ranges (optional)
            - runtime_config (optional, block):
                - failure_policy (optional)
                - gcs_output_directory (required)
                - parameter_values (optional)
            - service_account (optional)
            - template_uri (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    cron                            = string
    display_name                    = string
    location                        = string
    max_concurrent_run_count        = string
    allow_queueing                  = optional(bool)
    deletion_policy                 = optional(string)
    desired_state                   = optional(string)
    end_time                        = optional(string)
    max_concurrent_active_run_count = optional(string)
    max_run_count                   = optional(string)
    project                         = optional(string)
    start_time                      = optional(string)
    create_notebook_execution_job_request = optional(object({
      notebook_execution_job = object({
        custom_environment_spec = optional(object({
          machine_spec = optional(object({
            accelerator_count  = optional(number)
            accelerator_type   = optional(string)
            gpu_partition_size = optional(string)
            machine_type       = optional(string)
            reservation_affinity = optional(object({
              key                       = optional(string)
              reservation_affinity_type = string
              use_reservation_pool      = optional(bool)
              values                    = optional(list(string))
            }))
            tpu_topology = optional(string)
          }))
          network_spec = optional(object({
            enable_internet_access = optional(bool)
            network                = optional(string)
            subnetwork             = optional(string)
          }))
          persistent_disk_spec = optional(object({
            disk_size_gb = optional(string)
            disk_type    = optional(string)
          }))
        }))
        dataform_repository_source = optional(object({
          commit_sha                        = optional(string)
          dataform_repository_resource_name = string
        }))
        display_name = string
        encryption_spec = optional(object({
          kms_key_name = string
        }))
        execution_timeout = optional(string)
        execution_user    = optional(string)
        gcs_notebook_source = optional(object({
          generation = optional(string)
          uri        = string
        }))
        gcs_output_uri                          = string
        kernel_name                             = optional(string)
        labels                                  = optional(map(string))
        notebook_runtime_template_resource_name = optional(string)
        service_account                         = optional(string)
        workbench_runtime = optional(object({
        }))
      })
      parent = optional(string)
    }))
    create_pipeline_job_request = optional(object({
      parent = optional(string)
      pipeline_job = object({
        display_name = optional(string)
        encryption_spec = optional(object({
          kms_key_name = string
        }))
        labels                = optional(map(string))
        network               = optional(string)
        pipeline_spec         = optional(string)
        preflight_validations = optional(bool)
        psc_interface_config = optional(object({
          dns_peering_configs = optional(list(object({
            domain         = string
            target_network = string
            target_project = string
          })))
          network_attachment = optional(string)
        }))
        reserved_ip_ranges = optional(list(string))
        runtime_config = optional(object({
          failure_policy       = optional(string)
          gcs_output_directory = string
          parameter_values     = optional(map(string))
        }))
        service_account = optional(string)
        template_uri    = optional(string)
      })
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

