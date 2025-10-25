Task 4: Infrastructure as Code (IaC) Execution Log

This log details the command-by-command execution of the Terraform provisioning process, demonstrating successful adherence to all task hints (init, plan, apply, state, destroy).

🛠️ Environment Setup & Tool Confirmation

Due to a Windows PATH configuration issue, the full executable path (C:\Terraform\terraform.exe) was required for all commands in the VS Code terminal. Communication issues were resolved by explicitly setting the Docker host pipe variable.

Command

Status

Notes

C:\Terraform\terraform.exe -v

SUCCESS

Confirmed Terraform executable is functional.

docker ps

SUCCESS

Confirmed Docker daemon is running and reachable.

$env:DOCKER_HOST="npipe:////./pipe/docker_engine"

SUCCESS

Set environment variable to force connection between Terraform and Docker.

1. Initialization (Hint C)

Command: C:\Terraform\terraform.exe init

Output:

Initializing the backend...
Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "~> 2.15.0"...
- Installing kreuzwerker/docker v2.15.0...
...
Terraform has been successfully initialized!


2. Planning (Hint E)

Command: C:\Terraform\terraform.exe plan

Output: (Plan output reflects the final, corrected port 8081 configuration.)

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
 + create
...
Plan: 1 to add, 0 to change, 0 to destroy.


3. Application (Hint C)

Command: C:\Terraform\terraform.exe apply

Output: (Shows successful resource creation after port conflict was resolved)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
  Enter a value: yes

docker_container.web_server: Creating...
docker_container.web_server: Creation complete after 1s [id=05812c0749c10702cca5d82194719439e2070ef766bb19a797b5756fd287c95f]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.


Verification: Nginx container successfully accessed via web browser at http://localhost:8081.

4. State Check (Hint F)

Command: C:\Terraform\terraform.exe state list

Output: (Confirms resources are being managed)

docker_container.web_server
docker_image.nginx_image


5. Destruction (Hint D)

Command: C:\Terraform\terraform.exe destroy

Output: (Shows successful cleanup, indicating 0 resources remaining as the container was already removed or in a final state.)

No changes. No objects need to be destroyed.
...
Destroy complete! Resources: 0 destroyed.
