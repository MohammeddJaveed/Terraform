# 01 - Providers

## What is a Provider?

A **provider** is like a **translator** between Terraform and a cloud platform (like AWS, Azure, or GCP).

Without a provider, Terraform doesn't know how to talk to AWS. The provider is a plugin that Terraform downloads and uses to create/manage resources.

> Think of it like this: if Terraform is a chef, the provider is the recipe book for a specific kitchen (AWS, Azure, GCP).

---

## Basic Example — AWS Provider

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-0123456789abcdef0"   # The machine image (OS)
  instance_type = "t2.micro"               # The size of the VM
}
```

**What's happening here:**
1. We tell Terraform to use the `aws` provider and set the region to `us-east-1` (US East, N. Virginia).
2. Then we define an EC2 instance resource using that provider.

When you run `terraform init`, Terraform automatically downloads the AWS provider plugin.

---

## Other Common Providers

| Provider | Used For |
|----------|----------|
| `aws` | Amazon Web Services |
| `azurerm` | Microsoft Azure |
| `google` | Google Cloud Platform |
| `kubernetes` | Kubernetes clusters |
| `vsphere` | VMware vSphere |

---

## 3 Ways to Configure Providers

### 1. In the Root Module (Most Common)

Put the provider block at the top of your main config. It applies to all resources in that config.

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
}
```

### 2. In a Child Module

Useful when you want to pass a specific provider into a reusable module.

```hcl
module "my_vpc" {
  source = "./modules/vpc"
  providers = {
    aws = aws.us-west-2
  }
}
```

### 3. In `required_providers` Block (Best Practice for Version Locking)

This is the safest way — it pins the provider to a specific version so your code doesn't break if the provider updates.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.79"   # Use version 3.79 or any compatible minor version
    }
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
}
```

---

## Which Method to Use?

- **Single provider, simple config** → Use root module method.
- **Multiple providers or reusing configs** → Use child module method.
- **Production / team projects** → Always use `required_providers` to lock versions.
