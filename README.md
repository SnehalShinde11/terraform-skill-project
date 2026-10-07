# Terraform Skill Project

**Name:** Snehal Shinde  
**Repository:** `SnehalShinde11/terraform-skill-project`  
**Branch:** `main`  
**Technology:** Terraform, HCL, AWS, Infrastructure as Code (IaC)

---

# Project 4.1 – Managing Terraform Modules, Output and State File

## Assignment Details

**Assignment:** Project 4.1 – Managing Terraform Modules, Output and State File

### Tasks

- Task 1 – Prepare Terraform Project Structure
- Task 2 – Create a Terraform Module
- Task 3 – Use the Module in Main Configuration
- Task 4 – Configure Output Variables
- Task 5 – Apply Terraform Configuration
- Task 6 – Analyze Terraform State File
- Task 7 – Modify Infrastructure Configuration

---

## 1. Project Overview

The objective of this project is to understand how Terraform manages infrastructure using modules, output variables, and state files.

In real-world infrastructure automation, Terraform configurations often grow large and complex. Modules help organize infrastructure code into reusable components, while output variables expose useful information about created resources. The Terraform state file keeps track of infrastructure changes and ensures consistency between configuration and actual infrastructure.

By completing this project, learners will organize infrastructure code using modules, expose resource values through output blocks, and analyze how Terraform tracks infrastructure using its state file.

---

## 2. Problem Statement

As infrastructure environments become larger, maintaining all Terraform resources in a single configuration can make the code difficult to manage and reuse.

The project addresses the following requirements:

- Organize Terraform infrastructure using reusable modules.
- Pass configuration values to modules using variables.
- Expose resource information using output variables.
- Deploy AWS infrastructure using Terraform.
- Understand how Terraform maintains infrastructure state.
- Analyze and inspect Terraform-managed resources.
- Modify infrastructure through Terraform configuration.

---

## 3. Solution Approach

The solution uses a modular Terraform architecture.

A reusable `infrastructure_resource` module is created to manage:

- AWS EC2 instance
- AWS S3 bucket

The root Terraform configuration passes variables to the module and exposes the module outputs at the root level.

The overall architecture is:

```text
Root Terraform Configuration
            |
            v
   application_resource
            |
            v
 infrastructure_resource
            |
       +----+----+
       |         |
       v         v
      EC2       S3
```

Terraform state is used to track the resources created by the configuration.

---

## 4. Project Structure

The repository contains the following Terraform configuration:

```text
terraform-skill-project/
│
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    └── infrastructure_resource/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

### Root Configuration

| File | Purpose |
|---|---|
| `main.tf` | Terraform configuration, AWS provider and module configuration |
| `variables.tf` | Defines root-level input variables |
| `outputs.tf` | Defines root-level output variables |
| `README.md` | Project documentation |

### Terraform Module

The reusable module is located at:

```text
modules/infrastructure_resource/
```

| File | Purpose |
|---|---|
| `main.tf` | Defines EC2 and S3 resources |
| `variables.tf` | Defines module input variables |
| `outputs.tf` | Defines module output variables |

---

## 5. Dependencies and Setup

The project requires:

- Terraform
- AWS account
- AWS credentials configured for Terraform
- Internet connectivity to download the AWS provider
- Appropriate AWS permissions to create EC2 and S3 resources

Verify Terraform installation:

```bash
terraform version
```

Initialize the project:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Format the configuration:

```bash
terraform fmt
```

---

# Task 1 – Prepare Terraform Project Structure

The Terraform project is organized into a root configuration and a reusable module.

```text
terraform-skill-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    └── infrastructure_resource/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

This structure separates the main Terraform configuration from reusable infrastructure components.

---

# Task 2 – Create a Terraform Module

A reusable Terraform module named `infrastructure_resource` has been created.

```text
modules/
└── infrastructure_resource/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

The module accepts configuration through variables and exposes infrastructure information through outputs.

The module creates:

- AWS EC2 instance
- AWS S3 bucket

---

# Task 3 – Use the Module in Main Configuration

The root `main.tf` calls the reusable module:

```hcl
module "application_resource" {
  source = "./modules/infrastructure_resource"

  name          = var.resource_name
  environment   = var.environment
  owner         = var.owner
  ami_id        = var.ami_id
  instance_type = var.instance_type
  bucket_name   = var.bucket_name
}
```

The root configuration passes variables to the module.

This demonstrates Terraform's module-based architecture and reusable infrastructure design.

---

# Task 4 – Configure Output Variables

The module defines outputs that expose information about the infrastructure.

Example:

```hcl
output "ec2_instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.this.id
}
```

The root configuration references the module output:

```hcl
output "ec2_instance_id" {
  description = "ID of the deployed EC2 instance."
  value       = module.application_resource.ec2_instance_id
}
```

The project exposes:

- EC2 instance ID
- EC2 public DNS
- S3 bucket name
- S3 bucket ARN

Display outputs using:

```bash
terraform output
```

---

# Task 5 – Apply Terraform Configuration

Execute the standard Terraform workflow:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

### Command Explanation

| Command | Purpose |
|---|---|
| `terraform init` | Initialize Terraform |
| `terraform fmt` | Format Terraform configuration |
| `terraform validate` | Validate Terraform configuration |
| `terraform plan` | Preview infrastructure changes |
| `terraform apply` | Apply infrastructure changes |

View outputs:

```bash
terraform output
```

---

# Task 6 – Analyze Terraform State File

Terraform maintains a state file to track infrastructure managed by Terraform.

The default local state file is:

```text
terraform.tfstate
```

The state contains information such as:

- Managed resources
- Resource IDs
- Resource attributes
- Module resources
- Current infrastructure state
- Resource relationships

Useful commands:

```bash
terraform state list
terraform state show <resource>
terraform show
```

### State Management Best Practices

Terraform state can contain sensitive infrastructure information.

Therefore:

- State files should generally not be committed to Git.
- Terraform state files should be included in `.gitignore`.
- Production environments commonly use remote state.
- Access to remote state should be properly secured.

---

# Task 7 – Modify Infrastructure Configuration

Terraform allows infrastructure changes to be managed through configuration.

The workflow is:

```bash
terraform plan
terraform apply
```

Terraform compares the desired configuration with the current state and determines the required infrastructure changes.

```text
Terraform Configuration
        |
        v
Terraform State
        |
        v
Actual Infrastructure
        |
        v
Terraform Plan
        |
        v
Terraform Apply
```

---

# Project 4.2 – Managing Multiple Environments Using Terraform Workspaces

## Assignment Details

**Assignment:** Project 4.2 – Managing Multiple Environments Using Terraform Workspaces

### Tasks

- Task 1 – Prepare Terraform Project
- Task 2 – Initialize Terraform Environment
- Task 3 – Create Terraform Workspaces
- Task 4 – Deploy Infrastructure in Development Workspace
- Task 5 – Deploy Infrastructure in Staging Workspace
- Task 6 – Deploy Infrastructure in Production Workspace
- Task 7 – Analyze Terraform Plan Output
- Task 8 – Verify Environment Isolation

---

## 1. Project Overview

The objective of this project is to manage multiple infrastructure environments using Terraform Workspaces and analyze infrastructure changes using Terraform plan output.

In real-world DevOps environments, organizations maintain separate infrastructure for development, staging, and production. Terraform workspaces allow the same infrastructure code to manage multiple environments while maintaining isolated state files.

By completing this project, learners will understand how Terraform supports environment separation and infrastructure planning.

---

## 2. Problem Statement

Organizations commonly maintain multiple infrastructure environments such as:

- Development
- Staging
- Production

Managing separate Terraform configurations for each environment can result in duplicated code and increased maintenance effort.

This project demonstrates how Terraform workspaces can be used with a common Terraform configuration while maintaining independent state for each environment.

The project also demonstrates how `terraform plan` can be used to analyze infrastructure changes before they are applied.

---

## 3. Solution Approach

The same Terraform configuration and reusable module from Project 4.1 are used for all environments.

Three Terraform workspaces are created:

```text
development
staging
production
```

Each workspace maintains independent infrastructure state.

The architecture is:

```text
                    Terraform Project
                           |
                           v
                 Terraform Configuration
                           |
          +----------------+----------------+
          |                |                |
          v                v                v
    development         staging         production
      workspace         workspace        workspace
          |                |                |
          v                v                v
   Development State   Staging State   Production State
          |                |                |
          v                v                v
    Development        Staging          Production
   Infrastructure    Infrastructure    Infrastructure
```

The production environment is also used to demonstrate an infrastructure modification by changing the EC2 instance type from `t3.micro` to `t3.small`.

---

## 4. Dependencies and Setup

Project 4.2 uses the same dependencies and Terraform configuration as Project 4.1.

Required:

- Terraform
- AWS account
- AWS credentials configured for Terraform
- Appropriate AWS permissions
- Existing Terraform project configuration

Initialize the project:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Format the configuration:

```bash
terraform fmt
```

---

# Task 1 – Prepare Terraform Project

Project 4.2 uses the same repository and Terraform configuration created for Project 4.1.

```text
terraform-skill-project/
│
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    └── infrastructure_resource/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

No separate Terraform project is required.

The same Terraform module is reused across all environments.

---

# Task 2 – Initialize Terraform Environment

Initialize the Terraform environment:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt
```

Validate the configuration:

```bash
terraform validate
```

---

# Task 3 – Create Terraform Workspaces

Check the available workspaces:

```bash
terraform workspace list
```

Create the development workspace:

```bash
terraform workspace new development
```

Create the staging workspace:

```bash
terraform workspace new staging
```

Create the production workspace:

```bash
terraform workspace new production
```

Verify the workspaces:

```bash
terraform workspace list
```

Expected:

```text
  default
  development
  staging
* production
```

The `*` indicates the currently selected workspace.

### Switching Workspaces

Development:

```bash
terraform workspace select development
```

Staging:

```bash
terraform workspace select staging
```

Production:

```bash
terraform workspace select production
```

Verify the current workspace:

```bash
terraform workspace show
```

---

# Task 4 – Deploy Infrastructure in Development Workspace

Switch to the development workspace:

```bash
terraform workspace select development
```

Verify:

```bash
terraform workspace show
```

Expected:

```text
development
```

Generate a Terraform plan:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Verify the infrastructure outputs:

```bash
terraform output
```

The infrastructure created from the development workspace is managed using the development workspace state.

---

# Task 5 – Deploy Infrastructure in Staging Workspace

Switch to the staging workspace:

```bash
terraform workspace select staging
```

Verify:

```bash
terraform workspace show
```

Expected:

```text
staging
```

Generate the plan:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Verify the outputs:

```bash
terraform output
```

The staging workspace maintains an independent state from development.

```text
Development
     |
     └── Development State
              |
              └── Development Infrastructure


Staging
     |
     └── Staging State
              |
              └── Staging Infrastructure
```

---

# Task 6 – Deploy Infrastructure in Production Workspace

Switch to the production workspace:

```bash
terraform workspace select production
```

Verify:

```bash
terraform workspace show
```

Expected:

```text
production
```

Generate the Terraform plan:

```bash
terraform plan
```

Apply the production infrastructure:

```bash
terraform apply
```

Verify the outputs:

```bash
terraform output
```

Production infrastructure is managed using the production workspace state and remains independent from development and staging.

## Production Instance Type Change

To demonstrate an infrastructure change specifically in the production environment, the EC2 instance type is changed from:

```text
t3.micro
```

to:

```text
t3.small
```

Ensure that the production workspace is selected:

```bash
terraform workspace select production
```

Update the production configuration to use:

```hcl
instance_type = "t3.small"
```

Generate the plan:

```bash
terraform plan
```

Review the plan to confirm that the expected EC2 instance modification is identified.

Apply the change:

```bash
terraform apply
```

The production workspace is updated independently.

The expected environment configuration is:

```text
Development → t3.micro

Staging     → t3.micro

Production  → t3.small
```

---

# Task 7 – Analyze Terraform Plan Output

Terraform plan is used to preview infrastructure changes before they are applied.

Run:

```bash
terraform plan
```

Terraform evaluates:

```text
Terraform Configuration
          |
          v
Current Workspace State
          |
          v
Infrastructure
          |
          v
      Plan Output
```

The plan identifies actions such as:

```text
+ create
~ modify
- destroy
```

For the production instance type change:

```text
t3.micro
    |
    v
t3.small
```

Terraform should identify the required infrastructure modification.

The plan should always be reviewed before:

```bash
terraform apply
```

This helps confirm that Terraform will perform the expected changes.

---

# Task 8 – Verify Environment Isolation

Verify that each Terraform workspace maintains independent state.

List all workspaces:

```bash
terraform workspace list
```

Switch to development:

```bash
terraform workspace select development
terraform workspace show
terraform state list
```

Switch to staging:

```bash
terraform workspace select staging
terraform workspace show
terraform state list
```

Switch to production:

```bash
terraform workspace select production
terraform workspace show
terraform state list
```

Each workspace maintains its own Terraform state.

```text
                  Terraform Configuration
                           |
          +----------------+----------------+
          |                |                |
          v                v                v
    development         staging         production
          |                |                |
          v                v                v
   Independent State  Independent State  Independent State
          |                |                |
          v                v                v
    Development        Staging          Production
   Infrastructure    Infrastructure    Infrastructure
```

A change applied while the `production` workspace is selected does not modify the Terraform state maintained by the `development` or `staging` workspaces.

---

# Terraform Workspace State Management

Terraform workspaces provide separate state for each environment.

For this project:

```text
development → Development State
staging     → Staging State
production  → Production State
```

Conceptually:

```text
Terraform Project
       |
       v
Terraform Configuration
       |
       +-------------------+
       |                   |
       v                   v
   Workspaces          Common Module
       |
       +--------------+--------------+
       |              |              |
       v              v              v
 development      staging       production
       |              |              |
       v              v              v
 Development      Staging       Production
     State          State          State
```

### Important

The three environments do **not** share the same Terraform state.

Each workspace maintains its own state, allowing Terraform to track the infrastructure belonging to that environment independently.

With a local backend, Terraform stores workspace-specific state within the Terraform working directory's workspace state structure.

With a remote backend, workspace state is maintained according to the backend's workspace/state mechanism.

---

# Complete Terraform Workflow

```text
                    Terraform Project
                           |
                           v
                    terraform init
                           |
                           v
                    terraform fmt
                           |
                           v
                  terraform validate
                           |
                           v
                  Create Workspaces
                           |
          +----------------+----------------+
          |                |                |
          v                v                v
    development         staging         production
          |                |                |
          v                v                v
   terraform plan    terraform plan    terraform plan
          |                |                |
          v                v                v
   terraform apply   terraform apply   terraform apply
          |                |                |
          v                v                v
    Development        Staging         Production
    Infrastructure    Infrastructure   Infrastructure
          |                |                |
          v                v                v
    Independent       Independent      Independent
       State             State            State
```

---

# Key Terraform Commands

| Command | Purpose |
|---|---|
| `terraform init` | Initialize Terraform |
| `terraform fmt` | Format Terraform configuration |
| `terraform validate` | Validate configuration |
| `terraform plan` | Preview infrastructure changes |
| `terraform apply` | Apply infrastructure changes |
| `terraform output` | Display output variables |
| `terraform show` | Display Terraform state information |
| `terraform state list` | List resources managed by Terraform |
| `terraform state show` | Display detailed resource state |
| `terraform workspace list` | List Terraform workspaces |
| `terraform workspace new <name>` | Create a workspace |
| `terraform workspace select <name>` | Switch to a workspace |
| `terraform workspace show` | Display the current workspace |
| `terraform destroy` | Destroy Terraform-managed infrastructure |

---

# Technologies Used

- Terraform
- HCL
- AWS
- Infrastructure as Code (IaC)
- Terraform Modules
- Terraform Variables
- Terraform Outputs
- Terraform State Management
- Terraform Workspaces
- AWS EC2
- AWS S3

---

# Conclusion

Projects 4.1 and 4.2 demonstrate practical Terraform Infrastructure as Code concepts, beginning with reusable modules, output variables, and state management and extending to multi-environment infrastructure using Terraform workspaces.

The same Terraform configuration is used to manage:

```text
Development
     |
     v
Staging
     |
     v
Production
```

Each environment is managed through its own Terraform workspace and independent state.

The production environment is also used to demonstrate an infrastructure change:

```text
EC2 Instance Type

t3.micro
   |
   v
t3.small
```

Terraform `plan` is used to review the expected change before `apply`, demonstrating a controlled Infrastructure as Code workflow.
