/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  project_iam_role_bindings = {
    "TenantAdmin" = [
      "roles/iam.serviceAccountAdmin",
      "roles/cloudsupport.techSupportViewer",
      "roles/iam.securityReviewer",
      "roles/browser",
    ]
    "ANBCStorageAdmin" = [
      "roles/storage.admin",
      "roles/bigquery.dataEditor",
      "roles/bigquery.jobUser",
      "roles/artifactregistry.admin",
    ]
    "ANBCBQUser" = [
      "roles/bigquery.jobUser",
      "roles/iam.securityReviewer",
      "roles/cloudsupport.techSupportEditor",
      "roles/browser",
      "roles/bigquery.readSessionUser",
      "roles/bigquery.dataViewer",
    ]
    "ANBCArtifactUser" = [
      "roles/artifactregistry.repoAdmin",
      "roles/artifactregistry.writer",
    ]
    /**The role is too large. Consider splitting the role in two or 
    removing some of the permissions from the role, I splited the role in PowerUser_1_1 and PowerUser_2_2 **/
    "PowerUser_1_1" = [
      "roles/dataflow.admin",
      "roles/dataproc.admin",
      "roles/composer.admin",
      "roles/storage.objectViewer",
      "roles/bigquery.dataViewer",
      "roles/logging.viewer",
      "roles/monitoring.viewer",
      "roles/cloudscheduler.admin",
      "roles/run.admin",
      "roles/bigtable.admin",
      "roles/cloudbuild.builds.approver",
      "roles/aiplatform.admin",
      "roles/iam.workloadIdentityPoolAdmin",
      "roles/datapipelines.admin",
      "roles/pubsub.admin"
    ]
    "PowerUser_2_2" = [
      "roles/healthcare.annotationStoreAdmin",
      "roles/healthcare.consentArtifactAdmin",
      "roles/healthcare.consentStoreAdmin",
      "roles/healthcare.fhirStoreAdmin",
      "roles/healthcare.datasetAdmin",
      "roles/healthcare.dicomStoreAdmin",
      "roles/healthcare.hl7V2StoreAdmin",
      "roles/container.admin",
      "roles/cloudsupport.techSupportEditor",
      "roles/iam.securityReviewer",
      "roles/artifactregistry.repoAdmin",
      "roles/artifactregistry.writer",
      "roles/compute.osLogin",
      "roles/browser",
      "roles/serviceusage.serviceUsageConsumer",
      "roles/iap.tunnelResourceAccessor",
      "roles/bigquery.jobUser",
      "roles/bigquery.readSessionUser"
    ]
    "Developer" = [
      "roles/dataflow.developer",
      "roles/dataproc.editor",
      "roles/composer.user",
      "roles/storage.objectViewer",
      "roles/bigquery.dataViewer",
      "roles/logging.viewer",
      "roles/monitoring.viewer",
      "roles/cloudscheduler.jobRunner",
      "roles/run.developer",
      "roles/run.invoker",
      "roles/bigtable.user",
      "roles/cloudbuild.builds.editor",
      "roles/aiplatform.featurestoreDataWriter",
      "roles/aiplatform.user",
      "roles/iam.workloadIdentityPoolAdmin",
      "roles/pubsub.editor",
      "roles/healthcare.annotationEditor",
      "roles/healthcare.consentArtifactEditor",
      "roles/healthcare.consentEditor",
      "roles/healthcare.fhirResourceEditor",
      "roles/healthcare.datasetViewer",
      "roles/healthcare.dicomEditor",
      "roles/container.developer",
      "roles/cloudsupport.techSupportEditor",
      "roles/iam.securityReviewer",
      "roles/compute.osLogin",
      "roles/browser",
      "roles/serviceusage.serviceUsageConsumer",
      "roles/iap.tunnelResourceAccessor",
      "roles/bigquery.jobUser",
      "roles/bigquery.readSessionUser",
    ]
    "Viewer" = [
      "roles/dataflow.viewer",
      "roles/dataproc.viewer",
      "roles/composer.user",
      "roles/storage.objectViewer",
      "roles/bigquery.dataViewer",
      "roles/logging.viewer",
      "roles/monitoring.viewer",
      "roles/cloudscheduler.viewer",
      "roles/run.viewer",
      "roles/bigtable.reader",
      "roles/cloudbuild.builds.viewer",
      "roles/aiplatform.viewer",
      "roles/iam.workloadIdentityPoolViewer",
      "roles/pubsub.viewer",
      "roles/healthcare.annotationReader",
      "roles/healthcare.consentArtifactReader",
      "roles/healthcare.consentStoreViewer",
      "roles/healthcare.fhirStoreViewer",
      "roles/healthcare.datasetViewer",
      "roles/healthcare.dicomStoreViewer",
      "roles/healthcare.hl7V2StoreViewer",
      "roles/container.clusterViewer",
      "roles/cloudsupport.techSupportViewer",
      "roles/iam.securityReviewer",
      "roles/browser",
      "roles/bigquery.jobUser",
      "roles/bigquery.readSessionUser",
    ]
    "sandbox" = [
      /** The role is too large **/
      # "roles/viewer",
      "roles/iap.tunnelResourceAccessor",
      "roles/source.admin",
      "roles/artifactregistry.admin",
      "roles/automl.admin",
      "roles/bigquery.admin",
      "roles/cloudfunctions.admin",
      "roles/cloudsql.admin",
      "roles/dataflow.admin",
      "roles/container.admin",
      "roles/notebooks.admin",
      /** Monitoring admin role has the stackdriver.* permissions and
       stackdriver.projects.edit is not supported in custom roles **/
      # "roles/monitoring.admin",
      "roles/iam.serviceAccountUser",
      "roles/compute.instanceAdmin",
      "roles/compute.networkViewer",
      "roles/compute.loadBalancerAdmin",
      "roles/iam.serviceAccountAdmin",
      "roles/compute.osLogin",
      "roles/composer.user"
    ]

    "PipelineSA" = [
      "roles/compute.viewer",
      "roles/compute.networkViewer",
      "roles/compute.networkUser",
      "roles/dataflow.worker",
      "roles/composer.user",
      "roles/bigquery.jobUser",
      "roles/bigquery.readSessionUser",
      "roles/dataproc.editor",
    ]
    "EngineeringSA" = [
      "roles/compute.viewer",
      "roles/compute.networkViewer",
      "roles/compute.networkUser",
      "roles/dataflow.worker",
      "roles/composer.user",
      "roles/bigquery.jobUser",
      "roles/bigquery.readSessionUser",
      "roles/compute.osLogin",
      "roles/iap.tunnelResourceAccessor",
      "roles/dataproc.editor",
    ]
  }

#### Custom roles ###########
  project_group_to_crole_transpose = transpose(var.users_roles_needed == null ? {} : var.users_roles_needed)
  
  project_roles_custom_role_bindings = {for job_function, principals in local.project_group_to_crole_transpose :
    format("organizations/${var.org_id}/roles/%s",job_function) => toset([for principal in principals: principal])
  }
####################################
  project_roles_needed_flat = merge([for a, b in var.users_roles_needed :
    { for x in b : "${a}/${x}" => x }
  ]...)
  project_group_to_role = merge([for a, b in local.project_roles_needed_flat :
    { for x, y in local.project_iam_role_bindings : a => y if b == x }
  ]...)
  project_group_to_role_transpose = transpose(local.project_group_to_role == null ? {} : local.project_group_to_role)

  project_role_bindings = { for a, b in local.project_group_to_role_transpose :
    a => toset([for x in b : element(split("/", x), 0)])
  }
  restricted_iam_admin_expression = "api.getAttribute('iam.googleapis.com/modifiedGrantsByRole', []).hasOnly(['organizations/269666726474/roles/EdpDataprocWorker','roles/dataflow.worker','roles/dataproc.editor','roles/artifactregistry.admin','roles/composer.environmentAndStorageObjectAdmin','roles/bigquery.readSession','roles/serviceusage.serviceUsageConsumer','roles/bigquery.readSessionUser']) || api.getAttribute('iam.googleapis.com/modifiedGrantsByRole', []).hasOnly(['roles/composer.worker','roles/bigquery.jobUser','roles/logging.admin','roles/compute.viewer','roles/iap.tunnelResourceAccessor','roles/compute.networkViewer','roles/compute.osLogin','roles/compute.networkUser']) || api.getAttribute('iam.googleapis.com/modifiedGrantsByRole', []).hasOnly(['organizations/269666726474/roles/CvsNotebooksRunner','organizations/269666726474/roles/CvsNotebooksRunnerPlus'])"
  restricted_iam_admin_bindings = [
    {
      role        = "roles/resourcemanager.projectIamAdmin"
      title       = "restricted_iam_admin_role"
      description = "Restricted Project IAM admin"
      expression  = local.restricted_iam_admin_expression
      members     = var.restricted_iam_admin_users
    },
  ]
}
