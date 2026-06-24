# 03 - Required Providers

## What is `required_providers`?

The `required_providers` block tells Terraform:
- **Which providers** your project needs
- **Where to download them from** (source)
- **Which version** to use

This is important because provider APIs change over time. Locking the version prevents your infrastructure code from breaking unexpectedly when a new provider version is released.

---

## Basic Syntax

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
```

**Breaking it down:**
- `aws` — the name you'll use to reference the provider (e.g., `provider "aws"`)
- `source = "hashicorp/aws"` — where to download it from (the Terraform Registry)
- `version = "~> 3.0"` — use version 3.x (any patch, but stay on major version 3)

---

## Using Multiple Providers

You can lock multiple providers at once:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0, < 3.0"
    }
  }
}
```

---

## Version Constraint Cheat Sheet

| Constraint | Meaning |
|------------|---------|
| `= 3.0.0` | Exactly version 3.0.0 |
| `>= 3.0` | Version 3.0 or newer |
| `<= 3.5` | Version 3.5 or older |
| `~> 3.0` | Any 3.x version (most common) |
| `>= 2.0, < 3.0` | Between 2.0 and 3.0 |

---

## Why This Matters

Without version locking, if the AWS provider releases version 4.0 with breaking changes, your `terraform init` will download it and potentially break your code.

With `required_providers`, you stay safe on the version you know works. ✅
