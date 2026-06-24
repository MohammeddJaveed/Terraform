# 02 - Terraform State File

## What is the State File?

When Terraform creates infrastructure (like an EC2 instance), it needs to **remember** what it built so it can update or destroy it later.

It stores this memory in a file called **`terraform.tfstate`**.

> Think of the state file as Terraform's **notebook** — it writes down everything it has created, so next time you run it, it knows what already exists.

---

## Desired State vs Current State

| Term | What it means |
|------|--------------|
| **Desired State** | What you wrote in your `.tf` files (what you WANT) |
| **Current State** | What actually exists in your cloud account right now |
| **State File** | Terraform's record of what it last created |

When you run `terraform apply`, Terraform:
1. Reads your `.tf` files (desired state)
2. Reads the state file (what it previously built)
3. Checks the actual cloud (current state)
4. Makes changes to close any gaps

---

## Where is the State File Stored?

By default, it's stored **locally** as `terraform.tfstate` in your project folder.

```
my-project/
├── main.tf
├── variables.tf
└── terraform.tfstate   ← auto-created after `terraform apply`
```

### ⚠️ Warning

- **Never commit `terraform.tfstate` to Git** — it can contain sensitive data (passwords, IPs, etc.)
- Add it to your `.gitignore`:

```
# .gitignore
terraform.tfstate
terraform.tfstate.backup
.terraform/
```

---

## Remote State (Best Practice for Teams)

For team projects, store the state file in a remote location like an **S3 bucket** (covered in Day 4). This way:
- Everyone on the team shares the same state
- No conflicts when multiple people run Terraform
- State is backed up safely

---

## Useful State Commands

```bash
# See what Terraform currently has in state
terraform state list

# See details about a specific resource in state
terraform state show aws_instance.my_server

# Remove a resource from state (without destroying it)
terraform state rm aws_instance.my_server
```
