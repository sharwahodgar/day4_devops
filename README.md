🤖 TASK 4: Infrastructure as Code (IaC) - Docker Container Provisioning

Objective

This project successfully demonstrates Infrastructure as Code (IaC) by using Terraform to provision and manage a local Docker container running the Nginx web server. The primary goal was to ensure end-to-end management, including initialization, planning, application, state checking, and destruction of the infrastructure, using industry best practices.

📝 Project Description

This Terraform configuration defines two main resources:

docker_image.nginx_image: Ensures the official nginx:latest image is pulled from Docker Hub.

docker_container.web_server: Creates a running container named tf_nginx_web_server from the image. It is configured to restart automatically (restart = "always") and maps the internal Nginx port (80) to the host machine's port 8081 to avoid a conflict (like the common issue with Jenkins using 8080).

Infrastructure Details

IaC Tool (Terraform v1.13.4): Used for defining, managing, and provisioning the container. (Status: Complete)

Containerization (Docker): Provides the runtime environment for the Nginx web server. (Status: Complete)

Application (Nginx:latest): The simple web server running inside the Docker container. (Status: Complete)

Access Port (8081): The port mapped from the internal container port 80 to the host machine to avoid network conflicts. (Status: Complete)

Files

main.tf: The core Terraform configuration (HCL) defining the Docker image and container resources.

.gitignore: Prevents sensitive state data (terraform.tfstate) and provider binaries from being uploaded to the repository.

EXECUTION_LOG.md: Detailed, step-by-step record of all commands executed and their outputs.

🚀 Execution Instructions

1. Prerequisites and Setup Notes

Ensure Terraform and Docker Desktop are installed and running.

Important Windows Troubleshooting Note:
If you encounter the error Error initializing Docker client: protocol not available, you must explicitly set the DOCKER_HOST environment variable for your PowerShell session to force Terraform to connect via the Windows named pipe:

$env:DOCKER_HOST="npipe:////./pipe/docker_engine"



2. Terraform Workflow

Navigate to the project folder (day4_devops) in your terminal and execute the following steps:

Initialize: Download the required Docker provider.

terraform init



Plan (Safety Check): Review the plan to confirm the container and image will be created.

terraform plan



Apply (Build): Provision the container. Type yes when prompted.

terraform apply



3. Verification and Cleanup

Accessing the Application:
Once apply is complete, open your web browser and navigate to:

http://localhost:8081



You should see the Nginx welcome page.

State Check: Verify Terraform is managing the resources.

terraform state list



Destroy (Cleanup): Safely remove the infrastructure. Type yes when prompted.

terraform destroy

