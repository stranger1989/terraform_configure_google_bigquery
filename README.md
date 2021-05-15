# terraform_configure_google_bigquery

Template for configure google bigquery with terraform.

## Env setting

Create `terraform.tfvars` file on root path. <br />
Here is the example terraform.tfvars file as below.

```yml
project               = { GCP project name }
region                = { GCP project region }
zone                  = { GCP project zone }
service_account_email = { GCP service_account_email }
user_email            = { GCP user_email }
```

## create big query dataset & data table via terraform

### initialize terraform

This is the first command that should be run after writing a new Terraform configuration.

```
terraform init
```

### build infrastructure

```
terraform apply
```

### check current infrastructure

```
terraform show
```

### destroy infrastructure

```
terraform destroy
```
