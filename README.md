# bug-fg-encrypted-userdata-tf

Sample code for https://github.com/opentelekomcloud/terraform-provider-opentelekomcloud/issues/

Using **encrypted_user_data** in **opentelekomcloud_fgs_function_v2** changes
function on every **terraform apply**

Following environment variables must be set:

| Environment variable | description                                     |
| -------------------- | ----------------------------------------------- |
| OTC_SDK_AK           | Access key                                      |
| OTC_SDK_SK           | Secret key                                      |
| OTC_SDK_DOMAIN_NAME  | Domain name eg. OTC-EU-DE-000000000010000XXXXX" | 
| OTC_SDK_PROJECTNAME  | Project name e.g. eu_de                         |
| OTC_IAM_ENDPOINT     | https://iam.eu-de.otc.t-systems.com/v3          |

## Reproduce

1. Set environment variables according to README.md
2. change folder to terraform `cd terraform`
3. execute `terraform init`
4. execute `terraform apply -auto-approve`
```

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # opentelekomcloud_fgs_function_v2.myfunction will be created
  + resource "opentelekomcloud_fgs_function_v2" "myfunction" {
      + allow_ephemeral_storage = (known after apply)
      + apig_route_enable       = (known after apply)
      + app                     = "default"
      + app_agency              = (known after apply)
      + code_filename           = "index.py"
      + code_type               = "inline"
      + concurrency_num         = (known after apply)
      + depend_list             = (known after apply)
      + description             = "Test function"
      + dns_list                = (known after apply)
      + enable_auth_in_header   = (known after apply)
      + enable_lts_log          = (known after apply)
      + encrypted_user_data     = (sensitive value)
      + enterprise_project_id   = (known after apply)
      + ephemeral_storage       = (known after apply)
      + extend_config           = (known after apply)
      + func_code               = "4ebdc769dab2b4f497d889175045101a16be74f5"
      + functiongraph_version   = (known after apply)
      + gpu_type                = (known after apply)
      + handler                 = "index.handler"
      + heartbeat_handler       = (known after apply)
      + id                      = (known after apply)
      + is_stateful_function    = (known after apply)
      + log_group_id            = (known after apply)
      + log_group_name          = (known after apply)
      + log_topic_id            = (known after apply)
      + log_topic_name          = (known after apply)
      + lts_custom_tag          = (known after apply)
      + max_instance_num        = "1"
      + memory_size             = 128
      + mount_user_group_id     = (known after apply)
      + mount_user_id           = (known after apply)
      + name                    = "bug-encrypted-user-data"
      + region                  = (known after apply)
      + runtime                 = "Python3.10"
      + timeout                 = 3
      + urn                     = (known after apply)
      + user_data               = jsonencode(
            {
              + NOT_ENCRYPTED = "Hello World"
            }
        )
      + version                 = (known after apply)

      + custom_image (known after apply)

      + func_mounts (known after apply)

      + versions (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

opentelekomcloud_fgs_function_v2.myfunction: Creating...
opentelekomcloud_fgs_function_v2.myfunction: Creation complete after 2s [id=urn:fss:eu-de:d52e41d2434941b194ce3f91b1b12f8a:function:default:bug-encrypted-user-data:latest]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

5. execute apply again: `terraform apply -auto-approve`
```
opentelekomcloud_fgs_function_v2.myfunction: Refreshing state... [id=urn:fss:eu-de:d52e41d2434941b194ce3f91b1b12f8a:function:default:bug-encrypted-user-data:latest]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # opentelekomcloud_fgs_function_v2.myfunction will be updated in-place
  ~ resource "opentelekomcloud_fgs_function_v2" "myfunction" {
      ~ encrypted_user_data     = (sensitive value)
        id                      = "urn:fss:eu-de:d52e41d2434941b194ce3f91b1b12f8a:function:default:bug-encrypted-user-data:latest"
        name                    = "bug-encrypted-user-data"
        tags                    = {}
        # (42 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
opentelekomcloud_fgs_function_v2.myfunction: Modifying... [id=urn:fss:eu-de:d52e41d2434941b194ce3f91b1b12f8a:function:default:bug-encrypted-user-data:latest]
opentelekomcloud_fgs_function_v2.myfunction: Modifications complete after 1s [id=urn:fss:eu-de:d52e41d2434941b194ce3f91b1b12f8a:function:default:bug-encrypted-user-data:latest]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```