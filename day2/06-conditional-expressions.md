# 06 - Conditional Expressions

## What are Conditional Expressions?

Conditional expressions let you add **if/else logic** to your Terraform configuration.

This is useful when you want a resource's value to change based on some condition — like using a bigger instance in production vs. a smaller one in development.

---

## Basic Syntax

```
condition ? value_if_true : value_if_false
```

It works just like a ternary operator in programming languages.

---

## Real-World Example

```hcl
variable "environment" {
  description = "Deployment environment: dev or prod"
  type        = string
  default     = "dev"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"

  # Use t2.micro for dev, t3.medium for prod
  instance_type = var.environment == "prod" ? "t3.medium" : "t2.micro"

  tags = {
    Name = "web-server-${var.environment}"
  }
}
```

**What's happening:**
- If `var.environment` equals `"prod"` → use `"t3.medium"`
- Otherwise (dev, staging, etc.) → use `"t2.micro"`

---

## More Examples

### Controlling a feature flag

```hcl
variable "enable_monitoring" {
  type    = bool
  default = false
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  # Enable detailed monitoring only if the flag is true
  monitoring = var.enable_monitoring ? true : false
}
```

### Choosing a storage size

```hcl
variable "environment" {
  type    = string
  default = "dev"
}

resource "aws_ebs_volume" "data_disk" {
  availability_zone = "us-east-1a"

  # 100 GB in prod, 20 GB everywhere else
  size = var.environment == "prod" ? 100 : 20
}
```

---

## When to Use Conditionals

- Different instance sizes for dev vs prod
- Turning features on/off based on environment
- Choosing between two AMIs or regions
- Setting different replica counts for databases

> Keep conditions simple and readable. If the logic gets complex, consider using separate `.tfvars` files per environment instead.
