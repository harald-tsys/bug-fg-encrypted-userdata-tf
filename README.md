# bug-fg-encrypted-userdata-tf

Sample code for https://github.com/opentelekomcloud/terraform-provider-opentelekomcloud/issues/


Following environment variables must be set:

| Environment variable | description                                     |
| -------------------- | ----------------------------------------------- |
| OTC_SDK_AK           | Access key                                      |
| OTC_SDK_SK           | Secret key                                      |
| OTC_SDK_DOMAIN_NAME  | Domain name eg. OTC-EU-DE-000000000010000XXXXX" | 
| OTC_SDK_PROJECTNAME  | Project name e.g. eu_de                         |
| OTC_IAM_ENDPOINT     | https://iam.eu-de.otc.t-systems.com/v3          |

## deploy

1. Set environment variables according to README.md
2. change folder to terraform `cd terraform`
3. `terraform init`
4. `terraform apply`
5. execute apply again: `terraform apply`
