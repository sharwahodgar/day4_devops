🤖 TASK 4: Infrastructure as Code (IaC) - Docker Container Provisioning

Objective

This project successfully demonstrates Infrastructure as Code (IaC) by using Terraform to provision and manage a local Docker container running the Nginx web server. The primary goal was to ensure end-to-end management, including initialization, planning, application, state checking, and destruction of the infrastructure, using industry best practices.

Infrastructure Details

Component

Tool

Purpose

Status

IaC Tool

Terraform (v1.13.4)

Defines, manages, and provisions the container.

Complete

Containerization

Docker

Provides the runtime environment for the web server.

Complete

Application

Nginx:latest

Simple web server running inside the container.

Complete

Access Port

8081

Mapped from internal container port 80 to avoid conflicts.

Complete

Files

main.tf: The core Terraform configuration (HCL) defining the Docker image and container resources.

.gitignore: Prevents sensitive state data (terraform.tfstate) and provider binaries from being uploaded to the repository.

EXECUTION_LOG.md: Detailed, step-by-step record of all commands executed and their outputs.

🚀 Execution Instructions

To replicate this project, follow these steps:

Prerequisites: Ensure Terraform (v1.13+) and Docker Desktop are installed and running.

Initialize: Navigate to the project folder and run:

terraform init


Plan (Safety Check): Review the plan to confirm 1 resource will be added:

terraform plan


Apply (Build): Provision the container. Type yes when prompted. The Nginx server will be accessible at http://localhost:8081.

terraform apply


State Check: Verify Terraform is managing the resources:

terraform state list


Destroy (Cleanup): Safely remove the infrastructure. Type yes when prompted.

terraform destroy
