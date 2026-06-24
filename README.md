# 🚀 Terraform — Infrastructure as Code Journey

> **A structured, day-by-day hands-on upskilling journey through Terraform, covering everything from core concepts to production-ready patterns.**

[![HCL](https://img.shields.io/badge/Language-HCL%2096.5%25-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform/language)
[![Python](https://img.shields.io/badge/Python-3.5%25-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge)](https://github.com/MohammeddJaveed/Terraform)

---

## 👋 About This Repository

This repository documents my **self-driven Terraform learning journey** — built day by day, commit by commit. Each folder (`day1` through `day7`) represents a focused learning session where I implemented real Terraform concepts from scratch using **HashiCorp Configuration Language (HCL)**.

This is not just theory — every concept here is written, tested, and version-controlled as working code.

---

## 🗂️ Repository Structure

```
Terraform/
├── day1/          # Terraform basics & first provider configuration
├── day2/          # Providers, state, variables, functions & debugging
├── day3/          # Resource blocks, attributes & dependencies
├── day4/          # Variables, locals & outputs
├── day5/          # State management & remote backends
├── day6/          # Modules — reusability & composition
├── day7/          # Advanced patterns, functions & debugging
├── .gitignore     # Excludes sensitive .tfstate and .tfvars files
└── README.md
```

---

## 📅 Day-by-Day Breakdown

### 📌 Day 1 — Getting Started with Terraform
- What is Infrastructure as Code (IaC) and why it matters
- Installing Terraform and configuring the first provider
- Understanding `terraform init`, `plan`, and `apply`
- Writing and deploying the first `.tf` configuration file

### 📌 Day 2 — Terraform Deep Dive
- Understanding providers and how Terraform connects to AWS, Azure, GCP, and other platforms
- Learning how Terraform state tracks deployed infrastructure
- Using `required_providers` to lock provider sources and versions
- Creating reusable configurations with input variables and output values
- Adding simple logic with conditional expressions
- Using built-in functions for strings, lists, maps, and type conversion
- Debugging and formatting Terraform with `validate`, `plan`, `console`, `TF_LOG`, and `fmt`

### 📌 Day 3 — Resources, Attributes & Dependencies
- Defining cloud resources with `resource` blocks
- Understanding implicit vs explicit dependencies
- Using `depends_on` for controlled provisioning order
- Reading resource attributes and chaining outputs

### 📌 Day 4 — Variables, Locals & Outputs
- Declaring input variables with type constraints
- Using `locals` to simplify repeated expressions
- Defining `output` blocks to expose infrastructure values
- Passing variable values via `.tfvars` files

### 📌 Day 5 — Terraform State Management
- Understanding `terraform.tfstate` and why it matters
- Configuring remote backends (e.g. S3) for team collaboration
- State locking to prevent concurrent modification conflicts
- Importing existing infrastructure into Terraform state

### 📌 Day 6 — Modules: Reusability & Composition
- Structuring configurations as reusable modules
- Passing inputs and consuming outputs across modules
- Using the [Terraform Registry](https://registry.terraform.io/) for community modules
- Root vs child module patterns

### 📌 Day 7 — Advanced Patterns, Functions & Debugging
- Using built-in functions (`lookup`, `merge`, `format`, etc.)
- Conditional expressions and dynamic blocks
- `terraform fmt` for consistent code formatting
- Debugging with `terraform console` and `TF_LOG`

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Terraform (HCL)** | Infrastructure provisioning and lifecycle management |
| **Python** | Helper scripts and automation utilities |
| **Git / GitHub** | Version control and portfolio hosting |
| **.gitignore** | Excludes sensitive state files and credentials |

---

## ⚡ Getting Started

To explore or run any of these configurations locally:

**1. Clone the repository**
```bash
git clone https://github.com/MohammeddJaveed/Terraform.git
cd Terraform
```

**2. Navigate to a day folder**
```bash
cd day1
```

**3. Initialise Terraform**
```bash
terraform init
```

**4. Preview the execution plan**
```bash
terraform plan
```

**5. Apply the configuration**
```bash
terraform apply
```

> ⚠️ **Note:** Ensure you have [Terraform installed](https://developer.hashicorp.com/terraform/install) and valid cloud provider credentials configured before running `apply`.

---

## 🔐 Security Note

Sensitive files such as `*.tfstate`, `*.tfvars`, and provider credential files are excluded via `.gitignore`. **Never commit state files or credentials to version control.**

---

## 📚 Learning Resources

- [Terraform Official Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry — Community Modules](https://registry.terraform.io/)
- [HashiCorp Learn](https://developer.hashicorp.com/terraform/tutorials)

---

## 🙋 About Me

**Mohammed Javeed** — Software Engineer based in Dublin, Ireland 🇮🇪

Passionate about building scalable, clean software and continuously levelling up across the stack — from frontend React apps to cloud infrastructure with Terraform.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mohammed-javee-)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/MohammeddJaveed)

---

## ⭐ Support

If this repository helped you or you found it interesting, consider leaving a ⭐ — it means a lot and helps others discover it!

---

*Built with curiosity and consistency — one day at a time.* 🏗️
