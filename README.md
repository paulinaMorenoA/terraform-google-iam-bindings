# License  
Copyright 2021 Google LLC. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.

# Generate IAM Bindings
This code will create a IAM bindings which can be used by CFT Project IAM module. It will not create any resource. Will just return bindings.

## Compatibility
This code is intended for use with Terraform 1.0.5
## Providers

| Name | Version |
|------|---------|
| google | n/a |
| terraform | 1.0.0 |

## Usage

Basic usage is as follows for creating project:

```hcl
module "get-iam-bindings" {
  source   = "../iam-bindings"
  users_roles_needed = {
    "group:test-grp-01-poc@example.com"                   = ["poc"]
    "group:test-grp-01-databaseadministrator@example.com" = ["DatabaseAdministrator"]
    "group:test-grp-01-cloudoperations@example.com"       = ["CloudOperations", "NetworkAdministrator"]
  }
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| restricted\_iam\_admin\_users | List of users with restricted project IAM admin toles | `list(string)` | `[]` | no |
| users\_roles\_needed | Map of users/groups with roles | `map(list(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| project\_role\_bindings | n/a |
| restricted\_iam\_admin\_bindings | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

