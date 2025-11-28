

_______
# Setting Up and Installing Terraform: Step-by-Step Guide

## Prerequisites

- A computer running Windows, macOS, or Linux
- Administrator/sudo access
- Internet connection
- A text editor (VS Code, Sublime Text, or Atom recommended)

## Step 1: Install Terraform

### For Windows:

1. **Download Terraform**
    
    - Visit https://www.terraform.io/downloads
    - Download the Windows 64-bit zip file
2. **Extract and Install**
    
    - Create a folder: `C:\terraform`
    - Extract the downloaded zip file to this folder
    - You should see `terraform.exe` in the folder
3. **Add to PATH**
    
    - Right-click "This PC" → Properties → Advanced system settings
    - Click "Environment Variables"
    - Under "System variables", find and select "Path", then click "Edit"
    - Click "New" and add: `C:\terraform`
    - Click OK on all windows

### For macOS:

```bash
# Using Homebrew (recommended)
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Verify installation
terraform version
```

### For Linux (Ubuntu/Debian):

```bash
# Add HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add HashiCorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
sudo apt update
sudo apt install terraform

# Verify installation
terraform version
```

## Step 2: Verify Installation

Open a new terminal/command prompt and run:

```bash
terraform version
```

You should see output like: `Terraform v1.x.x`

## Step 3: Set Up Your First Terraform Project

### Create Project Directory

```bash
# Create a new directory for your project
mkdir my-terraform-project
cd my-terraform-project
```

- Create a new folder locally on your computer

![[Pasted image 20251127190822.png]]

- !! Mission Critical Copy over .gitignore !!
![[Pasted image 20251127190632.png]]

- A .gitignore file is essential for security: It prevents sensitive files (like the state file) from being accidentally pushed to GitHub.

![[Screenshot 2025-11-27 at 7.15.12 PM.png]]

- Open a terminal from that folder

type:
```rb
code .
```

to start Visual Studio Code
![[Pasted image 20251127192022.png]]

Click on Yes, I trust the author (you)
![[Screenshot 2025-11-27 at 7.21.08 PM.png]]


### Create Your First Configuration File

Create a file named `main.tf` in your project directory:

```hcl
# main.tf - Basic example
terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

# Simple resource to create a local file
resource "local_file" "example" {
  content  = "Hello from Terraform!"
  filename = "${path.module}/hello.txt"
}
```

or in Visual Studio Code:

```rb
touch 00-auth.tf
```
## Step 4: Initialize Terraform

Run the initialization command in your project directory:

```bash
terraform init
```

**What this does:**

- Downloads required provider plugins (stored in `.terraform` directory)
- Creates a `.terraform.lock.hcl` file to lock provider versions
- Prepares your working directory for other Terraform commands

**Expected output:**

```rb
Initializing the backend...
Initializing provider plugins...
Terraform has been successfully initialized!
```

## Step 5: Validate and Plan

### Validate Your Configuration

```bash
terraform validate
```

This checks if your configuration is syntactically valid.

### Create an Execution Plan

```bash
terraform plan
```

This shows what Terraform will do without actually making changes.

## Step 6: Apply Configuration

```bash
terraform apply
```

- Type `yes` when prompted
- This creates the resources defined in your configuration
- A `terraform.tfstate` file will be created to track your infrastructure state

## Step 7: Verify and Clean Up

### Check Created Resources

```bash
# List the file that was created
ls -la hello.txt  # macOS/Linux
dir hello.txt     # Windows
```

### Destroy Resources (when done testing)

```bash
terraform destroy
```

Type `yes` when prompted to remove all created resources.

## Important Files and Directories

### **Files You SHOULD Modify:**

- `*.tf` files (main.tf, variables.tf, outputs.tf, etc.) - Your Terraform configurations
- `*.tfvars` files - Variable value files
- `terraform.tfvars` - Default variable values

### **Files You SHOULD NOT Modify Manually:**

- `.terraform.lock.hcl` - Provider version lock file (managed by Terraform)
- `terraform.tfstate` - State file (managed by Terraform)
- `terraform.tfstate.backup` - State backup (managed by Terraform)
- `.terraform/` directory - Provider plugins and modules (managed by Terraform)

### **Files to Add to .gitignore:**

```gitignore
# .gitignore for Terraform projects
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
.terraform.lock.hcl
crash.log
override.tf
override.tf.json
*_override.tf
*_override.tf.json
```

## Recommended Tools

### **USE These:**

- **VS Code** with "HashiCorp Terraform" extension
- **Terraform CLI** (official command-line tool)
- **Git** for version control
- **terraform-docs** for documentation generation
- **tflint** for linting Terraform code

### **AVOID These:**

- Editing `.tfstate` files manually
- Using unofficial Terraform forks
- Running multiple `terraform apply` commands simultaneously on the same state

## Essential Commands Reference

```bash
# Initialize working directory
terraform init

# Validate configuration
terraform validate

# Format configuration files
terraform fmt

# Show execution plan
terraform plan

# Apply changes
terraform apply

# Destroy infrastructure
terraform destroy

# Show current state
terraform show

# List resources in state
terraform state list

# Output values
terraform output
```

## Useful GitHub Repositories

1. **Official Terraform Examples**
    
    - https://github.com/hashicorp/terraform-guides
    - Official examples and best practices
2. **Terraform AWS Modules**
    
    - https://github.com/terraform-aws-modules
    - Community-maintained AWS modules
3. **Terraform Best Practices**
    
    - https://github.com/antonbabenko/terraform-best-practices
    - Comprehensive guide to Terraform conventions

## Next Steps

1. Choose a cloud provider (AWS, Azure, GCP, etc.)
2. Set up provider credentials
3. Learn about Terraform modules for code reusability
4. Explore remote state backends (S3, Terraform Cloud)
5. Study Terraform workspaces for environment management

## Common Issues and Solutions

**Issue:** `terraform: command not found`

- **Solution:** Ensure Terraform is in your PATH and restart your terminal

**Issue:** Provider download fails

- **Solution:** Check internet connection and firewall settings

**Issue:** State file locked

- **Solution:** Wait for other operations to complete or manually remove lock file if process crashed

---

You're now ready to start building infrastructure with Terraform! Start with simple local resources, then progress to cloud providers as you become comfortable with the workflow.